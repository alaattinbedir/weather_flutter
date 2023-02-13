import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/app/base/base_controller.dart';
import 'package:weather_flutter/data/service/base_client.dart';
import 'package:weather_flutter/data/model/weather.dart';
import 'package:weather_flutter/data/service/app_exceptions.dart';
import 'package:weather_flutter/app/helper/dialog_helper.dart';

class WeatherController extends GetxController with BaseController {
  var dailyList = <Datum>[].obs; //Currently
  var hourlyList = <Currently>[].obs;
  var weatherType = ''.obs;
  var currentCityTemp = ''.obs;
  var currentDate = ''.obs;
  var cityName = "Barcelona".obs;

  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    getData();
    super.onInit();
  }

  void getData() async {
    // showLoading('fetching data');
    var response = await BaseClient().get('/41.3874,2.1686', contentType: MimeType.applicationJson.name);
    // hideLoading();

    if (response == null) return;
    final weather = weatherFromJson(response);
    dailyList.value = weather.daily.data;
    hourlyList.value = weather.hourly.data;
    weatherType.value = weather.currently.summary.toString();
    currentCityTemp.value = weather.currently.temperature.toString();
    currentDate.value = weather.currently.time.toString();

    debugPrint('Weather count: ${weather.daily.data.length}');
  }

  void postData() async {
    var payLoad = {'message': 'CodeX sucks!!!'};
    showLoading('Posting data...');
    var response = await BaseClient().post('/41.3874,2.1686', payloadObj: payLoad).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErroDialog(description: apiError["reason"]);
      } else {
        handleError(error);
      }
    });
    if (response == null) return;
    hideLoading();
    debugPrint(response);
  }
}
