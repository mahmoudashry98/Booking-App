import 'package:booking_app/app/explore/data/models/hotel_model.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:dio/dio.dart';

abstract class ExploreBaseRemoteDataSource {
  Future<List<HotelModel>> getHotelDataSource({
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

class ExploreRemoteDataSource extends ExploreBaseRemoteDataSource {
  @override
  Future<List<HotelModel>> getHotelDataSource(
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

    var response = await dio.get(ApiConstance.getHotelsEndPoint);
    if (response.data['status']['type'] == '1' && response.statusCode == 200) {
      print(response);
      return List<HotelModel>.from((response.data['dat']['data'] as List)
          .map((e) => HotelModel.fromjson(e)));
    } else if (response.data['status']['type'] == '0' &&
        response.statusCode == 200) {
      // statusModel = StatusModel.fromJson(response.data['status']);
      throw Exception();
    } else {
      throw Exception();
    }
  }
}
