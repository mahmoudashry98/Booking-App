import 'package:booking_app/app/search/domain/entities/search.dart';
import 'package:booking_app/core/utils/app_strings.dart';

class SearchModel extends Search {
  const SearchModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.address,
    required super.longitude,
    required super.latitude,
    required super.rate,
  });
  

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json[AppString.id],
      name: json[AppString.name],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
    );
  }
}
