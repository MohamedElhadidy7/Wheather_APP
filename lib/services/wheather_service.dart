import 'dart:developer';
import 'package:wheather_app/models/wheather_model.dart';
import 'package:dio/dio.dart';

class WheatherService {
  final Dio dio = Dio();

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '443f1c69f4e8476999475310241609';

  Future<WheatherModel> GetCurrentWheather({required String cityname}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=1');

      WheatherModel wheatherModel = WheatherModel.fromJson(response.data);

      return wheatherModel;
    } on DioException catch (e) {
      final String errmessage = e.response?.data['error']['message'] ??
          'opps there was an error,try later';
      throw Exception(errmessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error,try later');
    }
  }
}
