import 'model.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class Weatherapiclient {}
  Future<WeatherModel> request() async {
    String url = "https://api.open-meteo.com/v1/forecast?latitude=-7.87&longitude=112.5283&hourly=temperature_2m&timezone=Asia%2FBangkok";

    Response response = await Dio().get(url);
    final parsedData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parsedData);
    
    return weather;
  }