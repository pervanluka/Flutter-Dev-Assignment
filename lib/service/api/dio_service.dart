import 'package:dio/dio.dart';
import 'package:flutter_dev_assignment/service/api/constants/constants.dart';
import 'package:flutter_dev_assignment/service/api/dio_client.dart';

class DioService {
  final DioClient dioClient;

  DioService({required this.dioClient});

  Future<Response> getDonutApi() async {
    try {
      final Response response = await dioClient.get(AppEndpoits.baseUrl);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}