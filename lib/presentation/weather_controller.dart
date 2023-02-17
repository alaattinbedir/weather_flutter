import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/app/base/base_controller.dart';
import 'package:weather_flutter/app/helper/utility.dart';
import 'package:weather_flutter/data/service/base_client.dart';
import 'package:weather_flutter/data/model/weather.dart';

class WeatherController extends GetxController with BaseController {
  var dailyList = <Datum>[].obs;
  var hourlyList = <Currently>[].obs;
  var weatherType = ''.obs;
  var currentCityTemp = ''.obs;
  var currentDate = ''.obs;
  var cityName = "Barcelona".obs;

  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    getData();
    super.onInit();
  }

  void getData() async {
    var response = await BaseClient().get('/41.3874,2.1686', contentType: MimeType.applicationJson.name);

    if (response == null) return;
    final weather = weatherFromJson(response);

    dailyList.value = weather.daily.data;
    hourlyList.value = weather.hourly.data;
    weatherType.value = weather.currently.summary == null ? 'Clear' : weather.currently.summary.toString();
    currentCityTemp.value = Utility().convertFahrenheitToCelsiusAsString(weather.currently.temperature);
    currentDate.value = Utility().getFormatedDate(weather.currently.time);

    debugPrint(response);
  }
}
