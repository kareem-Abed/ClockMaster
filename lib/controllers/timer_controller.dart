import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();
    }
  }

  @override
  void onInit() {
    super.onInit();


    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        update();
      } else {
        progress = 1.0;
        isPlaying = false;
        update();
      }
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
