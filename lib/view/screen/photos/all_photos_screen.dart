/*
import 'package:cricupdate/data/model/response/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class AllPhotosScreen extends StatelessWidget {
  final PhotosModel photosModel;

  const AllPhotosScreen({super.key, required this.photosModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Get.theme.primaryColor,
        title: Text(
          "All Photos",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSizeLarge),
        ),
      ),
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: GridView.builder(
          itemCount: photosModel.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Image.network(photosModel.url!);
          }),
    );
  }
}
*/
