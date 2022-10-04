import 'package:booking_app/core/network/api_constance.dart';
import 'package:dio/dio.dart';

import '../models/create_booking_model.dart';

abstract class UpdateBookingBaseRemoteDataSource {
  Future<UpdateBookingModel> UpdateBookingDataSource({
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

class UpdateBookingRemoteDataSource extends UpdateBookingBaseRemoteDataSource {
  @override
  Future<UpdateBookingModel> UpdateBookingDataSource(
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
      return UpdateBookingModel.fromJson(response.data['status']);
    } else {
      throw Exception();
    }
  }
}
