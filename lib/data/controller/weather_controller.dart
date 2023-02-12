import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/common/base/base_controller.dart';
import 'package:weather_flutter/data/service/base_client.dart';
import 'package:weather_flutter/data/model/weather.dart' as weather_model;
import 'package:weather_flutter/data/service/app_exceptions.dart';
import 'package:weather_flutter/common/helper/dialog_helper.dart';

class WeatherController extends GetxController with BaseController {
  void getData() async {
    showLoading('fetching data');
    var response = await BaseClient().get('/41.3874,2.1686', contentType: MimeType.applicationJson.name);
    if (response == null) return;

    hideLoading();
    var weather = weather_model.weatherFromJson(response);
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
