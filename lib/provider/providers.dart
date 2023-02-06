import 'package:dio/dio.dart';
import 'package:flutter_dev_assignment/model/sort_view_model.dart';
import 'package:flutter_dev_assignment/service/api/dio_client.dart';
import 'package:flutter_dev_assignment/service/api/dio_service.dart';
import 'package:flutter_dev_assignment/service/api/repository/donut_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(),
);

final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(ref.watch(dioProvider)),
);

final dioServiceProvider = Provider<DioService>(
  (ref) => DioService(dioClient: ref.watch(dioClientProvider)),
);

final donutProvider = Provider<DonutRepository>(
    (ref) => DonutRepository(ref.watch(dioServiceProvider)));

final sortProvider = ChangeNotifierProvider((ref) => SortViewModel());
