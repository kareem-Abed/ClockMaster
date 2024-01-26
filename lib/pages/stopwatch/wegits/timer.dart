import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ClockMaster/controllers/stopwatch_controller.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class Timer extends StatelessWidget {
  Timer({super.key});
  final controller = Get.put(StopwatchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Divider(
          //     height: 10,
          //     thickness: 2,
          //     color: Colors.lightBlueAccent.withOpacity(0.5),
          //   ),
          // ),

          StreamBuilder<int>(
            stream: controller.stopWatchTimer.rawTime,
            initialData: controller.stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final hours = StopWatchTimer.getDisplayTime(
                value,
                minute: false,
                second: false,
                milliSecond: false,
              );
              final minute = StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                minute: true,
                second: false,
                milliSecond: false,
              );
              final second = StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                minute: false,
                milliSecond: false,
              );
              final milliSecond = StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                minute: false,
                second: false,
              );
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    //   height: 45,

                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      hours,
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    ':',
                    style: const TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 50,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    //   height: 45,

                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      minute,
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    ':',
                    style: const TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 50,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    //   height: 45,

                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      second,
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    //   height: 45,

                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:
                    Text(
                      '$milliSecond',
                      style: const TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 20,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                ],
              );
            },
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Divider(
          //     height: 10,
          //     thickness: 2,
          //     color: Colors.lightBlueAccent.withOpacity(0.5),
          //   ),
          // ),
        ],
      ),),
    );
  }
}
/*
* class Timer extends StatelessWidget {
  Timer({super.key});
  final controller = Get.put(StopwatchController());
  @override
  Widget build(BuildContext context) {
    return Center(
        child: WidgetCircularAnimator(
          size: 300,

          innerIconsSize: 5,
          outerIconsSize: 8,
          innerColor: Colors.lightBlueAccent,
          outerColor: Colors.lightBlueAccent,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Divider(
                  //     height: 10,
                  //     thickness: 2,
                  //     color: Colors.lightBlueAccent.withOpacity(0.5),
                  //   ),
                  // ),

                  StreamBuilder<int>(
                    stream: controller.stopWatchTimer.rawTime,
                    initialData: controller.stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data!;
                      final displayTime = StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        milliSecond: false,
                      );
                      final displayTime2 = StopWatchTimer.getDisplayTime(
                        value,
                        hours: false,
                        minute: false,
                        second: false,
                      );
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            displayTime,
                            style: const TextStyle(
                                fontSize: 35,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.',
                            style: const TextStyle(
                                fontSize: 30,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            displayTime2,
                            style: const TextStyle(
                              color: Colors.lightBlueAccent,
                                fontSize: 30,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Divider(
                  //     height: 10,
                  //     thickness: 2,
                  //     color: Colors.lightBlueAccent.withOpacity(0.5),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
*
* */
