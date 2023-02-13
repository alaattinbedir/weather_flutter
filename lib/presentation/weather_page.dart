import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              Text(
                '${controller.cityName}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Text(
                '${controller.weatherType}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/partly_sunny.png'),
              Text(
                '${controller.currentCityTemp}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${controller.currentDate}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.hourlyList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return buildCard(index);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.dailyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCell(index);
                    }),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget buildCard(int index) => Container(
        color: Colors.white,
        width: 100,
        height: 150,
        child: Center(child: Text('$index')),
      );

  Widget buildCell(int index) => Container(
        color: Colors.white,
        height: 50,
        child: Center(child: Text('$index')),
      );
}
