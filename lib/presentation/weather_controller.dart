import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/app/base/base_controller.dart';
import 'package:weather_flutter/app/helper/utility.dart';
import 'package:weather_flutter/data/service/base_client.dart';
import 'package:weather_flutter/data/model/weather.dart';

class WeatherController extends GetxController with BaseController {
  var dailyList = <Daily>[].obs;
  var hourlyList = <Current>[].obs;
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
    var response = await BaseClient().get('onecall?lat=41.3874&lon=2.1686&exclude=minutely,alert&appid=b6dd3cedb673897c7f68486a9b40b7a3&units=metric',
        contentType: MimeType.applicationJson.name);

    if (response == null) return;
    final weather = weatherFromJson(response);

    dailyList.value = weather.daily;
    hourlyList.value = weather.hourly;
    weatherType.value = weather.current.weather[0].description.name;
    currentCityTemp.value = Utility().convertFahrenheitToCelsiusAsString(weather.current.temp);
    currentDate.value = Utility().getFormatedDate(weather.current.dt);

    debugPrint(response);
  }
}
