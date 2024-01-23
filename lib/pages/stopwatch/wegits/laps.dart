import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:stopwatch/controllers/stopwatch_controller.dart';


class Laps extends StatelessWidget {
   Laps({super.key});
  final controller = Get.put(StopwatchController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20.0),
      ),

      child: StreamBuilder<List<StopWatchRecord>>(
        stream: controller.stopWatchTimer.records,
        initialData: controller.stopWatchTimer.records.value,
        builder: (context, snap) {
          final value = snap.data!;
          if (value.isEmpty) {
            return const SizedBox.shrink();
          }
          Future.delayed(const Duration(milliseconds: 100), () {
            controller.scrollController.animateTo(
                controller
                    .scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut);
          });

          return ListView.builder(
            controller: controller.scrollController,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final data = value[index];
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}. ',
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Helvetica',
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${data.displayTime}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.transparent,
                  )
                ],
              );
            },
            itemCount: value.length,
          );
        },
      ),
    );

  }
}
