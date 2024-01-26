import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/clock_controller.dart';
Expanded buildWorldClock() {
  return Expanded(
    child: GetBuilder<ClockController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: controller.countries.length,
            itemBuilder: (context, index) {
              return buildWorldClockItem(controller.countries[index], controller.countryTimes[index]);
            },
          ),

        );
      },
    ),
  );
}

Widget buildWorldClockItem(Country country, DateTime countryTime) {
  String formattedTime = DateFormat('h:mm:ss a').format(countryTime);
  return Container(

    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          country.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          '$formattedTime',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.lightBlueAccent),
        ),

      ],
    ),
  );
}