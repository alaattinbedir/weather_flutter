// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.currently,
    required this.hourly,
    required this.daily,
  });

  double latitude;
  double longitude;
  String timezone;
  Currently currently;
  Hourly hourly;
  Daily daily;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: json["timezone"],
        currently: Currently.fromJson(json["currently"]),
        hourly: Hourly.fromJson(json["hourly"]),
        daily: Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "currently": currently.toJson(),
        "hourly": hourly.toJson(),
        "daily": daily.toJson(),
      };
}

class Currently {
  Currently({
    required this.time,
    required this.summary,
    required this.icon,
    required this.precipIntensity,
    required this.precipProbability,
    required this.temperature,
    required this.apparentTemperature,
    required this.dewPoint,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windGust,
    required this.windBearing,
    required this.cloudCover,
    required this.uvIndex,
    required this.visibility,
    required this.ozone,
  });

  int time;
  Summary? summary;
  Icon? icon;
  num precipIntensity;
  num precipProbability;
  double temperature;
  double apparentTemperature;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windBearing;
  double cloudCover;
  int uvIndex;
  int visibility;
  double ozone;

  factory Currently.fromJson(Map<String, dynamic> json) => Currently(
        time: json["time"],
        summary: summaryValues.map[json["summary"]],
        icon: iconValues.map[json["icon"]],
        precipIntensity: json["precipIntensity"],
        precipProbability: json["precipProbability"],
        temperature: json["temperature"]?.toDouble(),
        apparentTemperature: json["apparentTemperature"]?.toDouble(),
        dewPoint: json["dewPoint"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windBearing: json["windBearing"],
        cloudCover: json["cloudCover"]?.toDouble(),
        uvIndex: json["uvIndex"],
        visibility: json["visibility"],
        ozone: json["ozone"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "summary": summaryValues.reverse[summary],
        "icon": iconValues.reverse[icon],
        "precipIntensity": precipIntensity,
        "precipProbability": precipProbability,
        "temperature": temperature,
        "apparentTemperature": apparentTemperature,
        "dewPoint": dewPoint,
        "humidity": humidity,
        "pressure": pressure,
        "windSpeed": windSpeed,
        "windGust": windGust,
        "windBearing": windBearing,
        "cloudCover": cloudCover,
        "uvIndex": uvIndex,
        "visibility": visibility,
        "ozone": ozone,
      };
}

enum Icon { clearNight, clearDay }

final iconValues = EnumValues({"clear-day": Icon.clearDay, "clear-night": Icon.clearNight});

enum Summary { clear }

final summaryValues = EnumValues({"clear": Summary.clear});

class Daily {
  Daily({
    required this.summary,
    required this.icon,
    required this.data,
  });

  String summary;
  Icon? icon;
  List<Datum> data;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        summary: json["summary"],
        icon: iconValues.map[json["icon"]],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "icon": iconValues.reverse[icon],
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.time,
    required this.summary,
    required this.icon,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.moonPhase,
    required this.precipIntensity,
    required this.precipIntensityMax,
    this.precipIntensityMaxTime,
    required this.precipProbability,
    required this.temperatureHigh,
    required this.temperatureHighTime,
    required this.temperatureLow,
    required this.temperatureLowTime,
    required this.apparentTemperatureHigh,
    required this.apparentTemperatureHighTime,
    required this.apparentTemperatureLow,
    required this.apparentTemperatureLowTime,
    required this.dewPoint,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windGust,
    required this.windGustTime,
    required this.windBearing,
    required this.cloudCover,
    required this.uvIndex,
    required this.uvIndexTime,
    required this.visibility,
    required this.ozone,
    required this.temperatureMin,
    required this.temperatureMinTime,
    required this.temperatureMax,
    required this.temperatureMaxTime,
    required this.apparentTemperatureMin,
    required this.apparentTemperatureMinTime,
    required this.apparentTemperatureMax,
    required this.apparentTemperatureMaxTime,
  });

  int time;
  String summary;
  String icon;
  int sunriseTime;
  int sunsetTime;
  double moonPhase;
  num precipIntensity;
  double precipIntensityMax;
  int? precipIntensityMaxTime;
  num precipProbability;
  double temperatureHigh;
  int temperatureHighTime;
  double temperatureLow;
  int temperatureLowTime;
  double apparentTemperatureHigh;
  int apparentTemperatureHighTime;
  double apparentTemperatureLow;
  int apparentTemperatureLowTime;
  double dewPoint;
  double humidity;
  double pressure;
  double windSpeed;
  double windGust;
  int windGustTime;
  int windBearing;
  double cloudCover;
  int uvIndex;
  int uvIndexTime;
  num visibility;
  double ozone;
  double temperatureMin;
  int temperatureMinTime;
  double temperatureMax;
  int temperatureMaxTime;
  double apparentTemperatureMin;
  int apparentTemperatureMinTime;
  double apparentTemperatureMax;
  int apparentTemperatureMaxTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        time: json["time"],
        summary: json["summary"],
        icon: json["icon"],
        sunriseTime: json["sunriseTime"],
        sunsetTime: json["sunsetTime"],
        moonPhase: json["moonPhase"]?.toDouble(),
        precipIntensity: json["precipIntensity"],
        precipIntensityMax: json["precipIntensityMax"]?.toDouble(),
        precipIntensityMaxTime: json["precipIntensityMaxTime"],
        precipProbability: json["precipProbability"]?.toDouble(),
        temperatureHigh: json["temperatureHigh"]?.toDouble(),
        temperatureHighTime: json["temperatureHighTime"],
        temperatureLow: json["temperatureLow"]?.toDouble(),
        temperatureLowTime: json["temperatureLowTime"],
        apparentTemperatureHigh: json["apparentTemperatureHigh"]?.toDouble(),
        apparentTemperatureHighTime: json["apparentTemperatureHighTime"],
        apparentTemperatureLow: json["apparentTemperatureLow"]?.toDouble(),
        apparentTemperatureLowTime: json["apparentTemperatureLowTime"],
        dewPoint: json["dewPoint"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        pressure: json["pressure"]?.toDouble(),
        windSpeed: json["windSpeed"]?.toDouble(),
        windGust: json["windGust"]?.toDouble(),
        windGustTime: json["windGustTime"],
        windBearing: json["windBearing"],
        cloudCover: json["cloudCover"]?.toDouble(),
        uvIndex: json["uvIndex"],
        uvIndexTime: json["uvIndexTime"],
        visibility: json["visibility"],
        ozone: json["ozone"]?.toDouble(),
        temperatureMin: json["temperatureMin"]?.toDouble(),
        temperatureMinTime: json["temperatureMinTime"],
        temperatureMax: json["temperatureMax"]?.toDouble(),
        temperatureMaxTime: json["temperatureMaxTime"],
        apparentTemperatureMin: json["apparentTemperatureMin"]?.toDouble(),
        apparentTemperatureMinTime: json["apparentTemperatureMinTime"],
        apparentTemperatureMax: json["apparentTemperatureMax"]?.toDouble(),
        apparentTemperatureMaxTime: json["apparentTemperatureMaxTime"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "summary": summary,
        "icon": icon,
        "sunriseTime": sunriseTime,
        "sunsetTime": sunsetTime,
        "moonPhase": moonPhase,
        "precipIntensity": precipIntensity,
        "precipIntensityMax": precipIntensityMax,
        "precipIntensityMaxTime": precipIntensityMaxTime,
        "precipProbability": precipProbability,
        "temperatureHigh": temperatureHigh,
        "temperatureHighTime": temperatureHighTime,
        "temperatureLow": temperatureLow,
        "temperatureLowTime": temperatureLowTime,
        "apparentTemperatureHigh": apparentTemperatureHigh,
        "apparentTemperatureHighTime": apparentTemperatureHighTime,
        "apparentTemperatureLow": apparentTemperatureLow,
        "apparentTemperatureLowTime": apparentTemperatureLowTime,
        "dewPoint": dewPoint,
        "humidity": humidity,
        "pressure": pressure,
        "windSpeed": windSpeed,
        "windGust": windGust,
        "windGustTime": windGustTime,
        "windBearing": windBearing,
        "cloudCover": cloudCover,
        "uvIndex": uvIndex,
        "uvIndexTime": uvIndexTime,
        "visibility": visibility,
        "ozone": ozone,
        "temperatureMin": temperatureMin,
        "temperatureMinTime": temperatureMinTime,
        "temperatureMax": temperatureMax,
        "temperatureMaxTime": temperatureMaxTime,
        "apparentTemperatureMin": apparentTemperatureMin,
        "apparentTemperatureMinTime": apparentTemperatureMinTime,
        "apparentTemperatureMax": apparentTemperatureMax,
        "apparentTemperatureMaxTime": apparentTemperatureMaxTime,
      };
}

class Hourly {
  Hourly({
    required this.summary,
    required this.icon,
    required this.data,
  });

  String summary;
  Icon? icon;
  List<Currently> data;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        summary: json["summary"],
        icon: iconValues.map[json["icon"]],
        data: List<Currently>.from(json["data"].map((x) => Currently.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "icon": iconValues.reverse[icon],
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
