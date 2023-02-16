import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'app_exceptions.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417';

enum MimeType {
  applicationJson("application/json"),
  textHtml("text/html"),
  applicationPdf("application/pdf"),
  formUrlEncoded("application/x-www-form-urlencoded; charset=utf-8"),
  imagePng("image/png"),
  base64ForHtml("base64");

  final String name;
  const MimeType(this.name);
}

class BaseClient {
  var client = http.Client();
  static const int timeOutDuration = 20;

  //GET
  Future<dynamic> get(String endPoint, {String baseUrl = baseUrl, Map<String, String>? headers, String? contentType}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    var allHeaders = prepareHeaderForSession(contentType, headers);

    try {
      var response = await client.get(uri, headers: allHeaders).timeout(const Duration(seconds: timeOutDuration));
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> post(String endPoint, {String baseUrl = baseUrl, dynamic payloadObj, Map<String, String>? headers, String? contentType}) async {
    var uri = Uri.parse(baseUrl + endPoint);
    var payload = json.encode(payloadObj);
    var allHeaders = prepareHeaderForSession(contentType, headers);

    try {
      var response = await client.post(uri, body: payload, headers: allHeaders).timeout(const Duration(seconds: timeOutDuration));
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }

  Map<String, String>? prepareHeaderForSession(String? contentType, Map<String, String>? extraHeaderParams) {
    Map<String, String> allHeaderFields = <String, String>{};
    allHeaderFields['Content-Type'] = contentType ?? MimeType.applicationJson.name;
    if (extraHeaderParams != null) {
      allHeaderFields.addAll(extraHeaderParams);
    }
    return allHeaderFields;
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException('Error occured with code : ${response.statusCode}', response.request!.url.toString());
    }
  }
}
