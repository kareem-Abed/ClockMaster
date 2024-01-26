import 'dart:convert';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:ClockMaster/pages/clock/wegits/analog_clock.dart';
import 'package:ClockMaster/pages/clock/wegits/world_clock.dart';

import '../../controllers/clock_controller.dart';


class ClockPage extends StatefulWidget {

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final controller = Get.put(ClockController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [


              ClockView(),
              SizedBox(height: 8),
              buildWorldClock(),

            ],
          ),
        ),
      ),
    );
  }




}


