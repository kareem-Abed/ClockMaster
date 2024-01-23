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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Column(
              children: <Widget>[
                Timer(),
                const SizedBox(
                  height: 30,
                ),
                Laps(),
                const SizedBox(
                  height: 30,
                ),
                Controls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
