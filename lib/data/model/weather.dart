// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  List<Current> hourly;
  Current current;
  int timezoneOffset;
  List<Daily> daily;
  double lon;
  String timezone;
  double lat;

  Weather({
    required this.hourly,
    required this.current,
    required this.timezoneOffset,
    required this.daily,
    required this.lon,
    required this.timezone,
    required this.lat,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        hourly: List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        current: Current.fromJson(json["current"]),
        timezoneOffset: json["timezone_offset"],
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "current": current.toJson(),
        "timezone_offset": timezoneOffset,
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
        "lon": lon,
        "timezone": timezone,
        "lat": lat,
      };
}

class Current {
  int dt;
  double temp;
  int humidity;
  int? sunrise;
  int? sunset;
  double uvi;
  int windDeg;
  List<WeatherElement> weather;
  double feelsLike;
  int clouds;
  int visibility;
  double windSpeed;
  int pressure;
  double dewPoint;
  double? windGust;
  double? pop;
  Rain? rain;

  Current({
    required this.dt,
    required this.temp,
    required this.humidity,
    this.sunrise,
    this.sunset,
    required this.uvi,
    required this.windDeg,
    required this.weather,
    required this.feelsLike,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.pressure,
    required this.dewPoint,
    this.windGust,
    this.pop,
    this.rain,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        temp: json["temp"]?.toDouble(),
        humidity: json["humidity"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        uvi: json["uvi"]?.toDouble(),
        windDeg: json["wind_deg"],
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        feelsLike: json["feels_like"]?.toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"]?.toDouble(),
        pressure: json["pressure"],
        dewPoint: json["dew_point"]?.toDouble(),
        windGust: json["wind_gust"]?.toDouble(),
        pop: json["pop"]?.toDouble(),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp,
        "humidity": humidity,
        "sunrise": sunrise,
        "sunset": sunset,
        "uvi": uvi,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "feels_like": feelsLike,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "pressure": pressure,
        "dew_point": dewPoint,
        "wind_gust": windGust,
        "pop": pop,
        "rain": rain?.toJson(),
      };
}

class Rain {
  double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class WeatherElement {
  int id;
  Main main;
  String icon;
  Description description;

  WeatherElement({
    required this.id,
    required this.main,
    required this.icon,
    required this.description,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: mainValues.map[json["main"]]!,
        icon: json["icon"],
        description: descriptionValues.map[json["description"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainValues.reverse[main],
        "icon": icon,
        "description": descriptionValues.reverse[description],
      };
}

enum Description { BROKEN_CLOUDS, CLEAR_SKY, FEW_CLOUDS, LIGHT_RAIN, MODERATE_RAIN, OVERCAST_CLOUDS, SCATTERED_CLOUDS }

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Main { CLEAR, CLOUDS, RAIN }

final mainValues = EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS, "Rain": Main.RAIN});

class Daily {
  double pop;
  double? rain;
  int dt;
  Temp temp;
  int humidity;
  int sunrise;
  int sunset;
  double uvi;
  double moonPhase;
  int windDeg;
  double windGust;
  int moonset;
  FeelsLike feelsLike;
  List<WeatherElement> weather;
  double windSpeed;
  int pressure;
  int moonrise;
  double dewPoint;
  int clouds;

  Daily({
    required this.pop,
    this.rain,
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.uvi,
    required this.moonPhase,
    required this.windDeg,
    required this.windGust,
    required this.moonset,
    required this.feelsLike,
    required this.weather,
    required this.windSpeed,
    required this.pressure,
    required this.moonrise,
    required this.dewPoint,
    required this.clouds,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        pop: json["pop"]?.toDouble(),
        rain: json["rain"]?.toDouble(),
        dt: json["dt"],
        temp: Temp.fromJson(json["temp"]),
        humidity: json["humidity"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        uvi: json["uvi"]?.toDouble(),
        moonPhase: json["moon_phase"]?.toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"]?.toDouble(),
        moonset: json["moonset"],
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        windSpeed: json["wind_speed"]?.toDouble(),
        pressure: json["pressure"],
        moonrise: json["moonrise"],
        dewPoint: json["dew_point"]?.toDouble(),
        clouds: json["clouds"],
      );

  Map<String, dynamic> toJson() => {
        "pop": pop,
        "rain": rain,
        "dt": dt,
        "temp": temp.toJson(),
        "humidity": humidity,
        "sunrise": sunrise,
        "sunset": sunset,
        "uvi": uvi,
        "moon_phase": moonPhase,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "moonset": moonset,
        "feels_like": feelsLike.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "wind_speed": windSpeed,
        "pressure": pressure,
        "moonrise": moonrise,
        "dew_point": dewPoint,
        "clouds": clouds,
      };
}

class FeelsLike {
  double night;
  double eve;
  double day;
  double morn;

  FeelsLike({
    required this.night,
    required this.eve,
    required this.day,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        day: json["day"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "night": night,
        "eve": eve,
        "day": day,
        "morn": morn,
      };
}

class Temp {
  double night;
  double min;
  double eve;
  double day;
  double max;
  double morn;

  Temp({
    required this.night,
    required this.min,
    required this.eve,
    required this.day,
    required this.max,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        night: json["night"]?.toDouble(),
        min: json["min"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        day: json["day"]?.toDouble(),
        max: json["max"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "night": night,
        "min": min,
        "eve": eve,
        "day": day,
        "max": max,
        "morn": morn,
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
