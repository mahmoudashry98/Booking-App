import 'package:booking_app/app/search/data/model/model.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/api_constance.dart';
import '../../domain/usecase/get_search_usecase.dart';

abstract class SearchBaseRemoteDataSource {
  Future<List<SearchModel>> getSearchDataSource({
    String? base,
    String? endPoint,
    dynamic data,
    dynamic query,
    required SearchParameters searchParameters,
    String? token,
    int? timeOut,
    bool isMultipart = false,
  });
}

class SearchRemoteDataSource extends SearchBaseRemoteDataSource {
  @override
  Future<List<SearchModel>> getSearchDataSource({
    String? base,
    String? endPoint,
    data,
    query,
    required SearchParameters searchParameters,
    String? token,
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
    debugPrint(
        'URL => ${dio.options.baseUrl + ApiConstance.searchHotelPath(searchParameters)}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    var response = await dio.get( 
      ApiConstance.searchEndPoint,
      queryParameters: {
        'name':'With images'
      },
    );
    if (response.data['status']['type'] == '1' && response.statusCode == 200) {
      print(response);
      return List<SearchModel>.from((response.data['data']['data'] as List)
          .map((e) => SearchModel.fromJson(e)));
    } else if (response.data['status']['type'] == '0' &&
        response.statusCode == 200) {
      // statusModel = StatusModel.fromJson(response.data['status']);
      throw Exception();
    } else {
      throw Exception();
    }
  }
}
