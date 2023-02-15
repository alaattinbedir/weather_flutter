import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_flutter/app/helper/utility.dart';
import 'package:weather_flutter/presentation/weather_controller.dart';

class WeatherPage extends GetWidget<WeatherController> {
  @override
  final WeatherController controller = Get.put(WeatherController());

  WeatherPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/after_noon.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Obx(
          () => Column(
            children: [
              Text(
                '${controller.cityName}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
                width: double.infinity,
              ),
              Text(
                '${controller.weatherType}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Image.asset(
                'assets/images/partly_sunny.png',
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              Text(
                '${controller.currentCityTemp}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 65.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${controller.currentDate}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.hourlyList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 5,
                    );
                  },
                  itemBuilder: (context, index) {
                    return buildHorlyCell(index);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.dailyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildDailyCell(index);
                    }),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildHorlyCell(int index) => Container(
        color: Colors.transparent,
        width: 55,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Utility().getHourFromDate(controller.hourlyList[index].time),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              'assets/images/partly_sunny.png',
              width: 40,
              height: 30,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              Utility().convertFahrenheitToCelsiusAsString(controller.hourlyList[index].temperature),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );

  Widget buildDailyCell(int index) => Container(
        color: Colors.transparent,
        height: 55,
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 90,
              child: Text(
                Utility().getDayFromDate(controller.dailyList[index].time),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/partly_sunny.png',
              width: 40,
              height: 30,
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            Text(
              Utility().convertFahrenheitToCelsiusAsString(controller.dailyList[index].apparentTemperatureHigh),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              Utility().convertFahrenheitToCelsiusAsString(controller.dailyList[index].temperatureHigh),
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
}
