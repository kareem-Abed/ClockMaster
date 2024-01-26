import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ClockMaster/pages/stopwatch/stopwatch.dart';

import 'clock/clock_page.dart';
import 'timer/timer_page.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  List page = [
    ClockPage(),
    StopwatchPage(),
    TimerPage(),
   // StopwatchPage(),
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800], // unselected icon color
          // Set the background color of the container
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          // Add a shadow effect
          border: Border.all(
            color: Colors.lightBlueAccent,
            width: 1,
          ), // Add a border around the container
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              haptic: true,
              tabBorderRadius: 12,
              tabBackgroundColor: Colors.lightBlue
                  .withOpacity(0.2), // selected tab background color

              rippleColor: Colors.lightBlueAccent[100]!,
              hoverColor: Colors.lightBlueAccent[100]!,
              gap: 3,
              activeColor: Colors.lightBlueAccent,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              duration: Duration(milliseconds: 200),
              color: Colors.lightBlueAccent,
              tabs: const [
                GButton(
                  icon: FontAwesomeIcons.clock,
                  text: " Clock",
                ),
                GButton(
                  icon: FontAwesomeIcons.stopwatch,
                  text: "Stopwatch",
                ),
                GButton(
                  icon: FontAwesomeIcons.hourglassHalf,
                  text: "Timer",
                ),
                // GButton(
                //   icon: Icons.alarm,
                //   text: "Alarm",
                // ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
