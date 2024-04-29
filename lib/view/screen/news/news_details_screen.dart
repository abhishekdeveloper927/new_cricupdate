import 'package:cricupdate/data/model/response/news_model.dart';
import 'package:cricupdate/util/app_constants.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/dimensions.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsModel newsModel;

  const NewsDetailsScreen({super.key, required this.newsModel});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          widget.newsModel.title!,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeLarge),
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              final imageProvider =
                  Image.network(widget.newsModel.images![0]).image;
              showImageViewer(context, imageProvider, onViewerDismissed: () {});
            },
            child: Image.network(
              widget.newsModel.images![0],
              height: 200,
              width: Get.width,
              errorBuilder:
                  (BuildContext context, Object object, StackTrace? tree) {
                return Image.network(
                  'https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg',
                  height: 200,
                  width: Get.width,
                  fit: BoxFit.cover,
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.newsModel.title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeOverLarge),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Text(
                  AppConstants.appName,
                  style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSizeSmall),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Text(
                  widget.newsModel.createdAt.toString(),
                  style: TextStyle(
                      color: Colors.grey, fontSize: Dimensions.fontSizeDefault),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Text(
                  widget.newsModel.description!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.fontSizeDefault),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
