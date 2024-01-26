import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ClockMaster/pages/stopwatch/wegits/timer.dart';
import 'wegits/controls.dart';
import 'wegits/laps.dart';
import '../../controllers/stopwatch_controller.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => StopwatchPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<StopwatchPage> {
  final controller = Get.put(StopwatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 16,
          ),
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              // const SizedBox(
              //   height: 50,
              // ),
              Flexible(
                  flex: 2,
                  child: Timer()),
             //Timer()
             //  const SizedBox(
             //    height: 40,
             //  ),
              Flexible(
                flex: 5,
                child: Laps(), ),
             // Laps(),
              const SizedBox(
                height: 45,
              ),
              Flexible(
                flex: 1,
                child:   Controls(), ),
            //  Controls(),
            ],
          ),
        ),
      ),
    );
  }
}
