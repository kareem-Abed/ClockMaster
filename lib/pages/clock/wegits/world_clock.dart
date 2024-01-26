import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: controller.countries.length,
            itemBuilder: (context, index) {
              return buildWorldClockItem(
                  controller.countries[index], controller.countryTimes[index]);
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
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.globe,
              color: Colors.lightBlueAccent,
            ),
            SizedBox(width: 8),
            SizedBox(
              width: 130,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  country.name,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.clock,
              color: Colors.lightBlueAccent,
            ),
            SizedBox(width: 25),
            Text(
              '$formattedTime',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.lightBlueAccent),
            ),
          ],
        ),
      ],
    ),
  );
}
