import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;
import '../models/Country.dart';

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


