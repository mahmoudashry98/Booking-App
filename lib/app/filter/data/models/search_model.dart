import 'package:booking_app/app/explore/data/models/hotel_model.dart';

class SearchModel extends HotelModel {
  const SearchModel({
    required super.id,
    required super.name,
    required super.disc,
    required super.price,
    required super.address,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      name: json['name'],
      disc: json['description'],
      price: json['price'],
      address: json['address'],
    );
  }
}
