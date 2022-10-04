import 'package:equatable/equatable.dart';

class GetBookingEntities extends Equatable {
  final int id;

  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String rate;
  final String hotelId;
  final String image;
  final String type;

  const GetBookingEntities({
    required this.DataId,
    required this.hotelId,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.image,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      price,
      address,
      longitude,
      latitude,
      rate,
      hotelId,
      image,
      type
    ];
  }
}
