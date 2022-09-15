import 'package:get/get.dart';
import '../services/services.dart';

class HomeController extends GetxController {
  RxString cityName = 'Loading...'.obs;
  RxDouble temperature = 0.0.obs;
  RxInt pressure = 0.obs;
  RxInt humidity = 0.obs;
  RxInt clouds = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    final data = await Services().getCurrentLocation();
    cityName.value = data!.name!;
    temperature.value = data.main!.temp!;
    pressure.value = data.main!.pressure!;
    humidity.value = data.main!.humidity!;
    clouds.value = data.clouds!.all!;
    isLoading.value = true;
    super.onInit();
  }

  search(String value) async {
    final data = await Services().getCityWeather(cityName: value);
    cityName.value = data!.name!;
    temperature.value = data.main!.temp!;
    pressure.value = data.main!.pressure!;
    humidity.value = data.main!.humidity!;
    clouds.value = data.clouds!.all!;
    isLoading.value = true;
  }
}
