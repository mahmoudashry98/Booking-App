import 'package:booking_app/app/auth/data/models/login_model.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/network/status.dart';
import 'package:dio/dio.dart';

abstract class AuthBaseRemoteDataSource {
  Future<LoginModel> postLogin({
    String? base,
    String? endPoint,
    dynamic data,
    required LoginParameters loginParameters,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class AuthRemoteDataSource extends AuthBaseRemoteDataSource {
  @override
  Future<LoginModel> postLogin({
    String? base,
    String? endPoint,
    data,
    required LoginParameters loginParameters,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'token': token,
    };

    var response = await dio.post(ApiConstance.loginEndPoint, queryParameters: {
      'email': loginParameters.email,
      'password': loginParameters.password,
    });
    if (response.statusCode == 200) {
      statusModel = StatusModel.fromJson(response.data['status']);
      return LoginModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
