import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hy_timer/hy_timer/timer_controller.dart';

class HYTimerToggle extends StatelessWidget {
  const HYTimerToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HYTimerController tc = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: SizedBox(
        width: 130,
        height: 32,
        child: Obx(
          () => NeumorphicToggle(
            height: 50,
            style: const NeumorphicToggleStyle(
                depth: 1,
                backgroundColor: Color(0xFFEEEEEE),
                borderRadius: BorderRadius.all(Radius.circular(17))),
            selectedIndex: tc.timerType.value,
            displayForegroundOnlyIfSelected: true,
            children: [
              ToggleElement(
                background: const Center(
                    child: Text(
                  "正计时",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
                foreground: const Center(
                    child: Text(
                  "正计时",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
              ),
              ToggleElement(
                background: const Center(
                    child: Text(
                  "倒计时",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
                foreground: const Center(
                    child: Text(
                  "倒计时",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
              ),
            ],
            thumb: Neumorphic(
              style: NeumorphicStyle(
                depth: 1,
                color: Colors.white,
                boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(17))),
              ),
            ),
            onChanged: (value) {
              HapticFeedback.lightImpact();
              tc.setTimerType(value);
            },
          ),
        ),
      ),
    );
  }
}
