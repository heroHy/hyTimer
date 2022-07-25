import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hy_timer/hy_timer/timer_controller.dart';

class HYPositiveTimer extends StatelessWidget {
  const HYPositiveTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HYTimerController tc = Get.find();
    return SizedBox(
      height: Get.width * 0.9,
      width: Get.width * 0.9,
      child: Stack(
        children: [
          Image.asset('images/timer_positive_back.png'),
          Center(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  tc.secondToString(tc.positiveTime.value),
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: tc.fontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DIN',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
