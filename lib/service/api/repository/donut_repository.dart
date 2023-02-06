import 'package:dio/dio.dart';
import 'package:flutter_dev_assignment/model/donut_model.dart';
import 'package:flutter_dev_assignment/service/api/dio_exception.dart';
import 'package:flutter_dev_assignment/service/api/dio_service.dart';

class DonutRepository {
  final DioService donutApi;

  DonutRepository(this.donutApi);

  Future<List<DonutItem>> getDonutRequested() async {
    try {
      List<DonutItem> list = [];
      final response = await donutApi.getDonutApi();
      // print(response.data);
      var data = response.data;
      for (Map<String,dynamic> i in data) {
        // print(i['name']);
        list.add(DonutItem.fromJson(i));
      }
      // print(list.length);
      return list;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
