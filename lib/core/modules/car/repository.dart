import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gps_test/core/modules/car/wialon_car.dart';

import 'package:gps_test/core/modules/login/wialon_login.dart';
import 'package:gps_test/core/services/app_exceptions.dart';
import 'package:gps_test/core/services/app_localstorage.dart';

class CarRepository {
  // Normaly keep all these keys in a .env file
  static const _token =
      '5dce19710a5e26ab8b7b8986cb3c49e58C291791B7F0A7AEB8AFBFCEED7DC03BC48FF5F8';
  static const int _unitId = 734455; // car buick
  static const int _flag = 8193; // car buick

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://hst-api.wialon.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<WialonLogin> requestLogin() async {
    try {
      //1.- request the login
      final response = await _dio.post(
        '/wialon/ajax.html',
        queryParameters: {
          'svc': 'token/login',
          'params': jsonEncode({'token': _token}),
        },
      );
      // if the response is string, parse it
      final data = response.data is String
          ? jsonDecode(response.data) as Map<String, dynamic>
          : response.data as Map<String, dynamic>;

      // if the response contains an error, throw an exception
      if (data.containsKey('error')) {
        final ex = WialonException(data['error'] as int);
        log(ex.toString());
        throw ex;
      }

      //2.- parse to dart object and return it
      final login = WialonLogin.fromJson(data);
      return login;
    } on DioException catch (e) {
      throw Exception('Error de red: ${e.message}');
    }
  }

  Future<WialonCar> getCarbyId() async {
    try {
      //1.- get the eID from localstorage
      final eID = await AppLocalStorage.getValue<String>('eID');

      //2.- make the request of the car by id
      final response = await _dio.post(
        '/wialon/ajax.html',
        queryParameters: {
          'svc': 'core/search_item',
          'params': jsonEncode({'id': _unitId, 'flags': _flag}),
          'sId': eID,
        },
      );

      // if the response is string, parse it
      final data = response.data is String
          ? jsonDecode(response.data) as Map<String, dynamic>
          : response.data as Map<String, dynamic>;

      // if the response contains an error, throw an exception
      if (data.containsKey('error')) {
        final ex = WialonException(data['error'] as int);
        log(ex.toString());
        throw ex;
      }

      //3.- parse to dart object and return it
      final car = WialonCar.fromJson(data);
      return car;
    } on DioException catch (e) {
      throw Exception('Error de red: ${e.message}');
    }
  }
}
