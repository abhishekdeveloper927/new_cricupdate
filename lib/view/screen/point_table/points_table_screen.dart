import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class PointTableScreen extends StatefulWidget {
  final int sessionId;

  const PointTableScreen({super.key, required this.sessionId});

  @override
  State<PointTableScreen> createState() => _PointTableScreenState();
}

class _PointTableScreenState extends State<PointTableScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Get.theme.primaryColor,
      title: Text(
        "Points Table",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizeLarge),
      ),
    ) /*,
        body: GetBuilder<MatchesController>(builder: (matchesController) {
          if (matchesController.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (matchesController.pointTablePage == null) {
            return Center(
              child: Text(
                "No Points Table Found",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSizeLarge),
              ),
            );
          }
          return Scrollbar(
              controller: controller2,
              thumbVisibility: true,
              child: SingleChildScrollView(
                  controller: controller2,
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      controller: controller,
                      child: DataTable(
                          columnSpacing: 25,
                          columns: [
                            DataColumn(
                                label: Text(
                              'Team',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'P',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'W',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'L',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'NR',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'Pts',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                            DataColumn(
                                label: Text(
                              'NRR',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeLarge,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                          rows:
                              matchesController.pointTablePage!.data!.map((e) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  e.teamModel != null
                                      ? Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              child: Image.network(
                                                e.teamModel!.imagePath ?? "",
                                                height: 25,
                                                width: 25,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width:
                                                  Dimensions.paddingSizeDefault,
                                            ),
                                            Text(
                                              e.teamModel!.code ?? "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    Dimensions.fontSizeDefault,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          "",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                          ),
                                        ),
                                ),
                                DataCell(
                                  Text(
                                    e.played.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.won.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.lost.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.noresult.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.points.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    e.nettoRunRate.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.fontSizeDefault,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList()))));
        })*/
        );
  }
}
