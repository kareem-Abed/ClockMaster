import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stopwatch/pages/stopwatch/stopwatch.dart';

import 'clock/clock_page.dart';



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 1);

    List<Widget> _buildScreens() {
      return [
         Clock_page(),
         Stopwatch_page(),
         Stopwatch_page(),
         Stopwatch_page(),
      ];
    }
    Color activeColor=Colors.lightBlueAccent;
    Color inactiveColor=Colors.grey;
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon:  FaIcon(FontAwesomeIcons.clock),
          iconSize: 30,
          title: ("Clock"),
          activeColorPrimary: activeColor,
          inactiveColorPrimary:inactiveColor,
        ),
        PersistentBottomNavBarItem(
          icon:  FaIcon(FontAwesomeIcons.stopwatch),
          iconSize: 30,
          title: ("Stopwatch"),
          activeColorPrimary: activeColor,
          inactiveColorPrimary:inactiveColor,
        ),

        PersistentBottomNavBarItem( iconSize: 30,
          icon:FaIcon(FontAwesomeIcons.hourglassHalf),
          title: ("Timer"),
          activeColorPrimary: activeColor,
          inactiveColorPrimary: inactiveColor,
        ),
        PersistentBottomNavBarItem( iconSize: 30,
          icon:Icon(Icons.alarm),
          title: ("Alarm"),

          activeColorPrimary: activeColor,
          inactiveColorPrimary: inactiveColor,
        ),
      ];
    }

    return PersistentTabView(

      context,
      navBarHeight: 70,

      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,

      backgroundColor: Colors.grey.shade800,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset:
      true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
      true,

      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.lightBlueAccent, width: 2.0),
        colorBehindNavBar: Colors.grey.shade800,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(

        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style1,
    );
  }
}