import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch/pages/stopwatch/wegits/timer.dart';
import 'wegits/controls.dart';
import 'wegits/laps.dart';
import '../../controllers/stopwatch_controller.dart';

class Stopwatch_page extends StatefulWidget {
  const Stopwatch_page({super.key});

  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => Stopwatch_page(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<Stopwatch_page> {
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
