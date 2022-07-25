import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hy_timer/hy_timer/views/timer_appbar.dart';
import 'package:hy_timer/hy_timer/views/timer_countdown.dart';
import 'package:hy_timer/hy_timer/views/timer_positive.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hy_timer/hy_timer/views/timer_toggle.dart';
import 'views/timer_groupbutton.dart';
import 'package:hy_timer/hy_timer/timer_controller.dart';

class HYTimerPage extends StatelessWidget {
  const HYTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HYTimerController tc = Get.put(HYTimerController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              HYTimerAppBar(
                menuFc: () => tc.menuClickMethod(),
                settingFc: () => tc.settingClickMethod(),
              ),
              const HYTimerToggle(),
              const Spacer(),
              HYTimerGroupButton(
                displayFc: () => tc.displayTimerMethod(),
                playFc: () => tc.playTimerMethod(),
              ),
            ],
          ),
          Obx(() => Center(
                child: tc.timerType.value == 0
                    ? const HYPositiveTimer()
                    : const HYCountdownTimer(),
              ))
        ],
      ),
    );
  }
}
