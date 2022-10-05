import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String disc;
  final String price;
  final String address;
  final String rate;
  final List<HotelImage> hotelImages;
  final List<HotelFacility> hotelFacilities;

  const Hotel({
    required this.id,
    required this.name,
    required this.disc,
    required this.price,
    required this.address,
    required this.rate,
    required this.hotelImages,
    required this.hotelFacilities,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      disc,
      price,
      address,
      rate,
      hotelImages,
      hotelFacilities,
    ];
  }
}

class HotelImage extends Equatable {
  final String hotelId;
  final String image;

  const HotelImage({
    required this.hotelId,
    required this.image,
  });

  @override
  List<Object?> get props => [
        hotelId,
        image,
      ];
}

class HotelFacility extends Equatable {
  final String hotelId;
  final String facilityId;

  const HotelFacility({
    required this.hotelId,
    required this.facilityId,
  });

  @override
  List<Object?> get props => [
        hotelId,
        facilityId,
      ];
}
