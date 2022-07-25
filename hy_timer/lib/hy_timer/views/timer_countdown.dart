import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hy_timer/hy_timer/timer_controller.dart';

import 'timer_picker.dart';

class HYCountdownTimer extends StatelessWidget {
  const HYCountdownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HYTimerController tc = Get.find();
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => SizedBox(
            width: 260,
            height: 260,
            child: GFProgressBar(
              percentage:
                  tc.isShowProgress.value ? 1 - tc.progressValue.value : 0,
              circleWidth: 15,
              radius: 260,
              type: GFProgressType.circular,
              backgroundColor: Colors.transparent,
              linearGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFAD126),
                    Color(0xFFFF544F),
                  ]),
            ),
          ),
        ),
        Image.asset(
          'images/ring.png',
          width: 290,
        ),
        Container(
          width: 220,
          height: 220,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
            borderRadius: BorderRadius.all(
              Radius.circular(110),
            ),
          ),
        ),
        Obx(() => tc.isShowProgress.value
            ? Text(
                tc.secondToString(tc.countdownTime.value),
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: tc.fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DIN',
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HYtimerPicker(
                          dataList: tc.pickerList,
                          callBack: (value) {
                            tc.setCountdownTime(0, value);
                          },
                        ),
                        HYtimerPicker(
                          dataList: tc.pickerList,
                          callBack: (value) {
                            tc.setCountdownTime(1, value);
                          },
                        )
                      ],
                    ),
                  ),
                  const Text(
                    ':',
                    style: TextStyle(fontSize: 60, fontFamily: 'DIN'),
                  )
                ],
              )),
      ],
    );
  }
}
