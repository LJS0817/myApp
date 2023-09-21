import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:isma/mng/DataMng.dart';
import 'package:provider/provider.dart';

class OilHeader extends StatelessWidget {
  const OilHeader({super.key});

  @override
  Widget build(BuildContext context) {
    DataMng dataMng = Provider.of<DataMng>(context);
    return Container(
      color: getThemeColor(-1, 0),
      child: SafeArea(
        child: Container(
          height: 180,
          color: getThemeColor(-1, 0),
          padding: const EdgeInsets.only(left: 55, right: 55, bottom: 20, top: 10),
          child: Transform.translate(
            offset: const Offset(10, 10),
            child: Container(
              width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
              child: Transform.translate(
                offset: const Offset(-10, -10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: getThemeColor(-1, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Transform.translate(
                          offset: const Offset(0, -7),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              dataMng.getOilData()!.english,
                              style: TextStyle(
                                color: getThemeColor(-1, 0),
                                fontSize: 15,
                                overflow: TextOverflow.fade,
                              ),
                              softWrap: false,
                              maxLines: 1,
                            ),
                          ),
                        )
                      ),


                      Positioned(
                        left: 0,
                        bottom: 20,
                        child: Text(
                          dataMng.getOilData()!.NaOH.toString(),
                          style: TextStyle(
                              color: getThemeColor(-1, 2),
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 10,
                        child: Text(
                          "NaOH",
                          style: TextStyle(
                            color: getThemeColor(-1, 0),
                            fontSize: 11
                          ),
                        ),
                      ),

                      Positioned(
                        right: 0,
                        bottom: 20,
                        child: Text(
                          dataMng.getOilData()!.KOH.toString(),
                          style: TextStyle(
                              color: getThemeColor(-1, 2),
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 10,
                        child: Text(
                          "KOH",
                          style: TextStyle(
                              color: getThemeColor(-1, 0),
                              fontSize: 11
                          ),
                        ),
                      ),


                      Positioned(
                        right: 0,
                        top: 5,
                        child: Text(
                          "NO.${1}",
                          style: TextStyle(
                            color: getThemeColor(-1, 0).withOpacity(0.3),
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Positioned(
                        left: 0,
                        top: 5,
                        child: SvgPicture.asset(
                          'assets/icon/oil.svg',
                          width: 20,
                          height: 20,
                          color: getThemeColor(-1, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }

}