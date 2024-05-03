import 'package:cricupdate/controller/all_matches_controller.dart';
import 'package:cricupdate/controller/auth_controller.dart';
import 'package:cricupdate/data/model/response/competition_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/dimensions.dart';

class PointTableScreen extends StatefulWidget {
  final CompetitionModel competitionModel;

  const PointTableScreen({super.key, required this.competitionModel});

  @override
  State<PointTableScreen> createState() => _PointTableScreenState();
}

class _PointTableScreenState extends State<PointTableScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AllMatchesController>().getCompetitionInfo(
          token: Get.find<AuthController>().entityToken,
          competitionId: widget.competitionModel.cid!);
    });
    super.initState();
  }

  final ScrollController controller = ScrollController();
  final ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMatchesController>(builder: (matchesController) {
      if (matchesController.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (matchesController.competitionInfoModel == null) {
        return Center(
          child: Text(
            "No Data Found",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        );
      }
      if (matchesController.competitionInfoModel == null) {
        return Center(
          child: Text(
            "No Data Found",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        );
      }
      if (matchesController.competitionInfoModel!.standing == null) {
        return Center(
          child: Text(
            "No Data Found",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSizeLarge),
          ),
        );
      }
      if (matchesController.competitionInfoModel!.standing!.standings == null ||
          matchesController
              .competitionInfoModel!.standing!.standings!.isEmpty) {
        return Center(
          child: Text(
            "No Data Found",
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
                      rows: matchesController.competitionInfoModel!.standing!
                          .standings![0].standings!
                          .map((e) {
                        return DataRow(
                          cells: [
                            DataCell(
                              e.team != null
                                  ? Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: Image.network(
                                            e.team!.logoUrl ?? "",
                                            height: 25,
                                            width: 25,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: Dimensions.paddingSizeDefault,
                                        ),
                                        Text(
                                          e.team!.abbr ?? "",
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
                                        fontSize: Dimensions.fontSizeDefault,
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
                                e.win.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.loss.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                e.nr.toString(),
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
                                e.netrr.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeDefault,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList()))));
    });
  }
}
