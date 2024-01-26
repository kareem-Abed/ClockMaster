import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ClockMaster/controllers/stopwatch_controller.dart';

class Laps extends StatelessWidget {
  Laps({super.key});
  final controller = Get.put(StopwatchController());


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Lap',
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Helvetica',
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Time',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Text(
                      'Difference',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            color: Colors.lightBlueAccent.withOpacity(0.8),
          ),
          Expanded(
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
                      controller.scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut);
                });

                return ListView.builder(
                  controller: controller.scrollController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    int? data1 = value[index].rawValue;
                    final data = value[index];
                    int? data2;
                    if (index == 0) {
                      data2 = value[index].rawValue;
                    } else {
                      data2 = value[index - 1].rawValue;
                    }

                    Duration difference = Duration( milliseconds: data1! - data2!);

                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 35,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '${index + 1}. ',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Helvetica',
                                        color: Colors.lightBlueAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${data.displayTime}',
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '+ ',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.lightBlueAccent,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${difference.inHours}:${difference.inMinutes}:${difference.inSeconds} .${((difference.inMilliseconds)%1000)}',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Helvetica',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
