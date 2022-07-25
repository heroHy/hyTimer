import 'dart:async';
import 'package:get/get.dart';

class HYTimerController extends GetxController {
  late Timer timer;
  // 时间计时器

  late Timer progressTimer;
  // 进度条计时器

  var timerType = 0.obs;
  // 计时器样式 0:正计时 1:倒计时

  var isPlaying = false.obs;
  // 是否正在计时

  var isShowProgress = false.obs;
  // 是否展示进度条

  var positiveTime = 0.obs;
  // 正计时时间（s）

  double fontSize = 60.0;
  // 正计时字号,超出1小时设置为40

  var progressValue = 0.0.obs;
  // 进度值

  List<int> pickerList = [];
  // 选择器数组

  int pickerTime = 0;
  // 选择时间

  int pickerM = 0;
  int pickerS = 0;
  var countdownTime = 0.obs;
  // 倒计时时间

  @override
  void onInit() {
    buildPickerList();
    super.onInit();
  }

  @override
  void onClose() {
    cancleTimer();
    super.onClose();
  }

  void buildPickerList() {
    /// 初始化选择器数组

    for (var i = 0; i < 60; i++) {
      pickerList.add(i);
    }
  }

  void menuClickMethod() {
    /// 菜单点击

    Get.snackbar("提示", "点击了菜单", snackPosition: SnackPosition.BOTTOM);
  }

  void settingClickMethod() {
    /// 设置点击

    Get.snackbar("提示", "点击了设置", snackPosition: SnackPosition.BOTTOM);
  }

  void setTimerType(int value) {
    /// 切换计时器样式

    timerType.value = value;
    displayTimerMethod();
  }

  void displayTimerMethod() {
    /// 结束按钮方法

    if (isShowProgress.value) {
      isShowProgress.value = false;
      progressTimer.cancel();
    }
    cancleTimer();
    progressValue.value = 0;
    positiveTime.value = 0;
    countdownTime.value = 0;
    isPlaying.value = false;
    pickerTime = 0;
  }

  void playTimerMethod() {
    /// 启动/暂停按钮方法

    switch (timerType.value) {
      case 0:
        timerPositiveMethod();
        break;
      case 1:
        timerMethod();
        break;
      default:
    }
  }

  void timerPositiveMethod() {
    /// 正计时方法

    if (isPlaying.value) {
      // 暂停
      cancleTimer();
      isPlaying.value = false;
    } else {
      // 启动
      isPlaying.value = true;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        positiveTime.value += 1;
      });
    }
  }

  void timerMethod() {
    /// 倒计时方法，总计时几秒milliseconds就给几秒

    if (isPlaying.value) {
      // 暂停
      progressTimer.cancel();
      timer.cancel();
      isPlaying.value = false;
    } else {
      // 启动
      if (pickerTime == 0) {
        Get.snackbar("提示", "请选择倒计时时间", snackPosition: SnackPosition.BOTTOM);
        return;
      }
      isPlaying.value = true;
      isShowProgress.value = true;
      progressTimer =
          Timer.periodic(Duration(milliseconds: pickerTime), (timer) {
        if (progressValue < 0.999) {
          progressValue.value += 0.001;
        } else {
          // 计时结束
          progressTimer.cancel();
          return;
        }
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        countdownTime.value -= 1;
        if (countdownTime.value == 0) {
          // 计时结束
          timer.cancel();
          return;
        }
      });
    }
  }

  void setCountdownTime(int type, int value) {
    /// 设置倒计时

    switch (type) {
      case 0:
        pickerM = value;
        break;
      case 1:
        pickerS = value;
        break;
      default:
    }

    pickerTime = pickerM * 60 + pickerS;
    countdownTime.value = pickerTime;
  }

  String secondToString(int second) {
    /// 秒数转时间格式

    var d = Duration(seconds: second);
    List<String> parts = d.toString().split(':');
    List<String> patrss = parts[2].split('.');
    if (second < 3600) {
      fontSize = 60.0;
      return ' ${parts[1].padLeft(2, '0')}:${patrss[0].padLeft(2, '0')}';
    } else {
      fontSize = 40.0;
      return ' ${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}:${patrss[0].padLeft(2, '0')}';
    }
  }

  void cancleTimer() {
    /// 销毁计时器

    if (isPlaying.value) {
      timer.cancel();
    }
  }
}
