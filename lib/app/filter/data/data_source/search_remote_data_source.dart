import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/api_constance.dart';
import '../../../explore/data/models/hotel_model.dart';
import '../models/search_model.dart';

abstract class SearchBaseRemoteDataSource {
  Future<List<HotelModel>> getSearchHotelDataSource({
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

class SearchRemoteDataSource extends SearchBaseRemoteDataSource {
  @override
  Future<List<HotelModel>> getSearchHotelDataSource({
    String? base,
    String? endPoint,
    data,
    query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }
    debugPrint('URL => ${dio.options.baseUrl + ApiConstance.searchEndPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');
    var response = await dio.get(ApiConstance.searchEndPoint);
    if (response.data['status']['type'] == '1' && response.statusCode == 200) {
      print(response);

      return List<SearchModel>.from((response.data['data']['data'] as List)
          .map((e) => HotelModel.fromjson(e)));
    } else if (response.data['status']['type'] == '0' &&
        response.statusCode == 200) {
      throw Exception();
    } else {
      throw Exception();
    }
  }
}
