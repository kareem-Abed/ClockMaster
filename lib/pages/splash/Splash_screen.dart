import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../BottomNavBar.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        opacity = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 2), () {

      Get.offAll(BottomNavBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: darkBackgroundColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(seconds: 1,microseconds: 200000),
          curve: Curves.easeInOut, // Use a smoother easing curve
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent,
                    border: Border.all(color:Colors.transparent ,width: 2 ),

                ),
                child: ClipRRect(
                  child: Image.asset(
                    "assets/icons/app.png",
                    height: 200.0,
                    scale: 0.5,
                    width: 200.0,
                  ),
                ),
              ),
           SizedBox(height: 15,),
              Text(
                "    EdTech    ",
                style: TextStyle(
                  color:   Colors.lightBlueAccent,
                  fontSize: 32.0,

                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),

              ),
              SizedBox(height: 10,),
               Text(
                "By kareem Ahmed",
                style: TextStyle(
                   color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontFamily: "assets/fonts/Avenir-Book.ttf",
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w300,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash.jpeg', // Replace with your image path
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }
}

