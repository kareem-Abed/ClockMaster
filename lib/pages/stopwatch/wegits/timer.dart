import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:stopwatch/controllers/stopwatch_controller.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class Timer extends StatelessWidget {
  Timer({super.key});
  final controller = Get.put(StopwatchController());
  @override
  Widget build(BuildContext context) {
    return Center(
        child: WidgetCircularAnimator(
          size: 300,
          innerIconsSize: 5,
          outerIconsSize: 5,
          innerColor: Colors.lightBlueAccent,
          outerColor: Colors.lightBlueAccent,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            child: Center(
              child: StreamBuilder<int>(
                stream: controller.stopWatchTimer.rawTime,
                initialData: controller.stopWatchTimer.rawTime.value,
                builder: (context, snap) {
                  final value = snap.data!;
                  final displayTime = StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                  );
                  return Text(
                    displayTime,
                    style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
