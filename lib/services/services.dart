import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/core/constants.dart';
import 'package:weather_app/core/key.dart';
import 'package:weather_app/model/weather_model.dart';

class Services {
  Future<Model?> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );

    if (position != null) {
      return await _getCurrentWeather(position: position);
    }
  }

  Future<Model?> _getCurrentWeather({required Position position}) async {
    try {
      final client = http.Client();
      Uri urlParse = Uri.parse(
        "${AppConstants.baseUrl}lat=${position.latitude}&lon=${position.longitude}&appid=$APIKEY",
      );
      Response response = await client.get(urlParse);
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        return Model.fromJson(decode);
      }
    } on HttpException catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Model?> getCityWeather({required String cityName}) async {
    try {
      final client = http.Client();
      Uri urlParse = Uri.parse(
        "${AppConstants.baseUrl}q=$cityName&appid=$APIKEY&appid=$APIKEY",
      );
      Response response = await client.get(urlParse);
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);

        return Model.fromJson(decode);
      }
    } on HttpException catch (e) {
      log(e.toString());
    }
    return null;
  }
}
