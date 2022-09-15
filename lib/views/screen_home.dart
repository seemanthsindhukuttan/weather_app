import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/views/widgets/weather_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController _cityController = TextEditingController();

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Visibility(
          visible: controller.isLoading.value,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: TextFormField(
                    controller: _cityController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      hintText: 'Search City',
                    ),
                    onFieldSubmitted: (value) {
                      controller.isLoading.value = false;
                      controller.search(value.trim());
                      _cityController.clear();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.cityName.value,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      weatherCard(
                        imageUrl: 'assets/temperature.png',
                        label:
                            'Temperature : ${controller.temperature.value}°c',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      weatherCard(
                        imageUrl: 'assets/humidity.png',
                        label: 'Humidity : ${controller.humidity.value}hPa',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      weatherCard(
                        imageUrl: 'assets/pressure.png',
                        label: 'Pressure : ${controller.pressure.value}%',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      weatherCard(
                        imageUrl: 'assets/clouds.png',
                        label: 'Clouds  ${controller.clouds.value}%',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
