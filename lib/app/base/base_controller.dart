import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/app/helper/dialogs.dart';
import 'package:weather_flutter/data/service/app_exceptions.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      Dialogs().showErroDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      Dialogs().showErroDialog(description: message);
    } else if (error is ApiNotRespondingException) {
      Dialogs().showErroDialog(description: 'Oops! It took longer to respond.');
    }
  }

  // showLoading([String? message]) {
  //   Dialogs().showLoading(message);
  // }

  hideLoading() {
    Dialogs().hideLoading();
  }
}
