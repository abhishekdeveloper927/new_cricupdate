import 'package:cricupdate/data/model/response/news_model.dart';
import 'package:cricupdate/view/screen/news/news_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../util/dimensions.dart';

class NewsCard extends StatefulWidget {
  final NewsModel newsModel;

  const NewsCard({super.key, required this.newsModel});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.to(() => NewsDetailsScreen(newsModel: widget.newsModel));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault),
                    child: Image.network(
                      widget.newsModel.images![0],
                      height: 90,
                      width: 110,
                      errorBuilder: (BuildContext context, Object object,
                          StackTrace? tree) {
                        return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                            child: Image.network(
                              'https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg',
                              height: 90,
                              width: 110,
                              fit: BoxFit.cover,
                            ));
                      },
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: Dimensions.paddingSizeDefault,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.newsModel.title!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Dimensions.fontSizeLarge,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.newsModel.createdAt.toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Dimensions.fontSizeSmall,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSmall,
            ),
            Text(
              widget.newsModel.description!,
              style: TextStyle(
                color: Colors.black,
                fontSize: Dimensions.fontSizeSmall,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
