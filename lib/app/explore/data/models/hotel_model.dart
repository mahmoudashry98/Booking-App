import 'package:booking_app/app/explore/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel(
      {required super.id,
      required super.name,
      required super.disc,
      required super.price,
      required super.address});
  factory HotelModel.fromjson(Map<String, dynamic> json) {
    return HotelModel(
        id: json['id'],
        name: json['name'],
        disc: json['description'],
        price: json['price'],
        address: json['address']);
  }
}
