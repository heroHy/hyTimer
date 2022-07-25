import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hy_timer/hy_timer/timer_controller.dart';

class HYTimerGroupButton extends StatelessWidget {
  const HYTimerGroupButton({
    Key? key,
    required this.displayFc,
    required this.playFc,
  }) : super(key: key);
  final void Function() displayFc;
  final void Function() playFc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 140),
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildDisplayButton(),
            buildPlayButton(),
          ],
        ),
      ),
    );
  }

  Widget buildDisplayButton() {
    HYTimerController tc = Get.find();
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        tc.displayTimerMethod();
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.all(Radius.circular(37.5))),
        width: 75,
        height: 75,
        child: Center(
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
                color: Color(0xFF707070),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ),
    );
  }

  Widget buildPlayButton() {
    HYTimerController tc = Get.find();
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        tc.playTimerMethod();
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFF6C553),
            borderRadius: BorderRadius.all(Radius.circular(37.5))),
        width: 75,
        height: 75,
        child: Center(
            child: Obx(() => Icon(
                  tc.isPlaying.value ? Icons.pause : Icons.play_arrow_rounded,
                  size: 45,
                ))),
      ),
    );
  }
}
