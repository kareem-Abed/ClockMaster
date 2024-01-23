import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:stopwatch/controllers/stopwatch_controller.dart';

class Controls extends StatelessWidget {
  Controls({super.key});
  final controller = Get.put(StopwatchController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: controller.StartAndpause,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Obx(
                () => Icon(
                  controller.isRunning.value ? Icons.pause : Icons.play_arrow,
                  color: Colors.lightBlueAccent,
                  size: 30,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.AddLap,
            child: Container(
              //   height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Lap',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: controller.Reset,
            child: Container(
              //   height: 45,
              //    width: 100,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.refresh,
                color: Colors.lightBlueAccent,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
