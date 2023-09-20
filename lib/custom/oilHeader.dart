import 'package:flutter/material.dart';
import 'package:isma/config/colors.dart';
import 'package:isma/config/define.dart';
import 'package:provider/provider.dart';

class OilHeader extends StatelessWidget {
  const OilHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sweet almond oil test 12312313",
                          style: TextStyle(
                            color: getThemeColor(-1, 0),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "TASDASDKLJZKXLJCK LAKSDJKZXC",
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