import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';


class ClockController extends GetxController {
  RxList<Country> countries = <Country>[



    Country(timezone: "Africa/Cairo", name: "Egypt"),
    Country(timezone: "America/New_York", name: "United States"),
    Country(timezone: "Europe/London", name: "United Kingdom"),
    Country(timezone: "Asia/Tokyo", name: "Japan"),
    Country(timezone: "Australia/Sydney", name: "Australia"),
    Country(timezone: "Asia/Shanghai", name: "China"),
    Country(timezone: "Europe/Berlin", name: "Germany"),
    Country(timezone: "America/Toronto", name: "Canada"),
    Country(timezone: "Asia/Seoul", name: "South Korea"),
    Country(timezone: "Africa/Johannesburg", name: "South Africa"),
    Country(timezone: "America/Mexico_City", name: "Mexico"),
    Country(timezone: "Europe/Paris", name: "France"),
    Country(timezone: "Asia/Dubai", name: "United Arab Emirates"),
    Country(timezone: "America/Sao_Paulo", name: "Brazil"),
    Country(timezone: "Europe/Moscow", name: "Russia"),
    Country(timezone: "Asia/Kolkata", name: "India"),
    Country(timezone: "Africa/Lagos", name: "Nigeria"),
    Country(timezone: "Europe/Madrid", name: "Spain"),
    Country(timezone: "Asia/Bangkok", name: "Thailand"),
    Country(timezone: "Africa/Nairobi", name: "Kenya"),
    Country(timezone: "Europe/Istanbul", name: "Turkey"),
    Country(timezone: "Asia/Singapore", name: "Singapore"),
    Country(timezone: "Africa/Addis_Ababa", name: "Ethiopia"),
    Country(timezone: "Europe/Stockholm", name: "Sweden"),
    Country(timezone: "Asia/Hong_Kong", name: "Hong Kong"),
    Country(timezone: "Africa/Casablanca", name: "Morocco"),
    Country(timezone: "Europe/Vienna", name: "Austria"),
    Country(timezone: "Asia/Kuala_Lumpur", name: "Malaysia"),
    Country(timezone: "Africa/Accra", name: "Ghana"),
    Country(timezone: "Europe/Amsterdam", name: "Netherlands"),
    Country(timezone: "Asia/Taipei", name: "Taiwan"),
    Country(timezone: "Africa/Kigali", name: "Rwanda"),
    Country(timezone: "Europe/Prague", name: "Czech Republic"),
    Country(timezone: "Asia/Manila", name: "Philippines"),
    Country(timezone: "Africa/Tunis", name: "Tunisia"),
    Country(timezone: "Europe/Budapest", name: "Hungary"),
    Country(timezone: "Asia/Seoul", name: "South Korea"),
    Country(timezone: "Africa/Nouakchott", name: "Mauritania"),
    Country(timezone: "Europe/Zurich", name: "Switzerland"),
    Country(timezone: "Asia/Beirut", name: "Lebanon"),
    Country(timezone: "Africa/Dakar", name: "Senegal"),
    Country(timezone: "Europe/Oslo", name: "Norway"),
    Country(timezone: "Asia/Dhaka", name: "Bangladesh"),
    Country(timezone: "Africa/Windhoek", name: "Namibia"),
    Country(timezone: "Europe/Warsaw", name: "Poland"),
    Country(timezone: "Asia/Tehran", name: "Iran"),
    Country(timezone: "Africa/Kampala", name: "Uganda"),
    Country(timezone: "Europe/Copenhagen", name: "Denmark"),
    Country(timezone: "Africa/Luanda", name: "Angola"),
    Country(timezone: "Europe/Bucharest", name: "Romania"),
    Country(timezone: "Asia/Yerevan", name: "Armenia"),
    Country(timezone: "Africa/Libreville", name: "Gabon"),
    Country(timezone: "Europe/Brussels", name: "Belgium"),
    Country(timezone: "Asia/Almaty", name: "Kazakhstan"),
    Country(timezone: "Africa/Niamey", name: "Niger"),
    Country(timezone: "Europe/Bucharest", name: "Romania"),
    Country(timezone: "Asia/Almaty", name: "Kazakhstan"),
    Country(timezone: "Africa/Niamey", name: "Niger"),
    Country(timezone: "Europe/Bucharest", name: "Romania"),
    Country(timezone: "Asia/Almaty", name: "Kazakhstan"),


  ].obs;

  RxList<DateTime> countryTimes = List.filled(61, DateTime.now()).obs;

  @override
  void onInit() {
    super.onInit();
    tzdata.initializeTimeZones();
    //fetchCountries();
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    for (int i = 0; i < countries.length; i++) {
      countryTimes[i] = tz.TZDateTime.now(tz.getLocation(countries[i].timezone));
      update();
    }
  }
  Future<void> fetchCountries() async {
    try {
      final response = await http.get(Uri.parse('https://restcountries.com/v2/all'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        countries.value = data.map((countryData) => Country.fromMap(countryData)).toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      print('Error fetching countries: $e');
    }
  }
}

class ClockControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ClockController>(ClockController());
  }
}

class Clock_page extends StatelessWidget {

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
              SizedBox(height: 10),
              ClockView(),
              Expanded(
                child: GetBuilder<ClockController>(
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: controller.countries.length,
                        itemBuilder: (context, index) {
                          return buildWorldClock(controller.countries[index], controller.countryTimes[index]);
                        },
                      ),
        
                    );
                  },
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
  Widget buildWorldClock(Country country, DateTime countryTime) {
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



}


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
      width: 300,
      height: 300,

      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var fillBrush = Paint()..color =Colors.lightBlueAccent.shade700;
    //var fillBrush = Paint()..color = Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.deepOrange, Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
class Country {
  final String name;
  final String timezone;

  Country({required this.name, required this.timezone});

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'],
      timezone: map['timezones'],
    );
  }}