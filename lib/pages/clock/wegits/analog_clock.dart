

import 'dart:async';

import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 265,
        height: 270,

        child: AnalogClock(
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.lightBlueAccent),
              color: Colors.grey[900]!,
              shape: BoxShape.circle),
          width: 150.0,
          isLive: true,
          secondHandColor: Colors.lightBlueAccent,
          hourHandColor: Colors.white,
          minuteHandColor: Colors.white,
          showSecondHand: true,
          numberColor: Colors.white,
          showNumbers: true,

          digitalClockColor: Colors.lightBlueAccent,
          showAllNumbers: true,
          textScaleFactor: 1.4,
          showTicks: true,
          showDigitalClock: true,
          datetime: DateTime.now(),
        )

    );
  }
}
