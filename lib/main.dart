import 'dart:io';

import 'package:cricupdate/firebase_options.dart';
import 'package:cricupdate/theme/color.dart';
import 'package:cricupdate/util/app_constants.dart';
import 'package:cricupdate/view/screen/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'helper/get_di.dart';
import 'package:http/http.dart' as http;

FirebaseMessaging messaging = FirebaseMessaging.instance;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
AndroidInitializationSettings? androidInitializationSettings;
DarwinInitializationSettings? darwinInitializationSettings;

Future<void> main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MobileAds.instance.initialize();
  await setup();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    if (message.data['url'] != null) {
      urlLaunch(Uri.parse(message.data['url']));
    }
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    if (kDebugMode) {
      print('Got a message whilst in the foreground!');
    }
    if (kDebugMode) {
      print('Message data: ${message.notification}');
    }
    message.data['title'];
    showLocalNotification(
      message.notification!.title!,
      message.notification!.body!,
      message.data["image"],
    );

    if (message.notification != null) {
      if (kDebugMode) {
        print('Got a message whilst in the foreground!');
      }
      if (kDebugMode) {
        print('Message data: ${message.data}');
      }
      if (kDebugMode) {
        print('Message data: ${message.notification}');
      }
    }
  });
  runApp(const MyApp());
}

urlLaunch(Uri url) async {
  if (await canLaunchUrl(url)) {
    launchUrl(url, mode: LaunchMode.externalApplication);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

Future<void> setup() async {
  const androidInitializationSetting =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const iosInitializationSetting = DarwinInitializationSettings();
  const initSettings = InitializationSettings(
      android: androidInitializationSetting, iOS: iosInitializationSetting);
  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

Future<File> _downloadAndSaveImage(String url, String fileName) async {
  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/$fileName';
  final response = await http.get(Uri.parse(url));
  final file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);
  return file;
}

Future<void> showLocalNotification(
  String title,
  String body,
  String image,
) async {
  final imageFileName = image.split('/').last;
  final imageFile = await _downloadAndSaveImage(image, imageFileName);
  final androidNotificationDetail = AndroidNotificationDetails(
    '0', // channel Id
    'general' // channel Name
    ,
    playSound: true,
    styleInformation: BigPictureStyleInformation(
      FilePathAndroidBitmap(imageFile.path),
    ),
  );
  const iosNotificatonDetail = DarwinNotificationDetails();
  final notificationDetails = NotificationDetails(
    iOS: iosNotificatonDetail,
    android: androidNotificationDetail,
  );

  flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    notificationDetails,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const SplashScreen(),
    );
  }
}
