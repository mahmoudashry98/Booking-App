import 'package:booking_app/core/network/api_constance.dart';
import 'package:dio/dio.dart';

import '../models/create_booking_model.dart';

abstract class CreateBookingBaseRemoteDataSource {
  Future<CreateBookingModel> CreateBookingDataSource({
    String? base,
    String? endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class CreateBookingRemoteDataSource extends CreateBookingBaseRemoteDataSource {
  @override
  Future<CreateBookingModel> CreateBookingDataSource(
      {String? base,
      String? endPoint,
      data,
      query,
      String? token,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };

    var response = await dio.post(ApiConstance.createBookingEndPoint);
    if (response.statusCode == 200) {
      return CreateBookingModel.fromJson(response.data['status']);
    } else {
      throw Exception();
    }
  }
}
