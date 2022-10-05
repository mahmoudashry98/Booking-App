import 'package:booking_app/app/explore/domain/entities/hotel.dart';

class HotelModel extends Hotel {
  const HotelModel({
    required super.id,
    required super.name,
    required super.disc,
    required super.price,
    required super.rate,
    required super.address,
    required super.hotelImages,
    required super.hotelFacilities,
  });
  factory HotelModel.fromjson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['name'],
      disc: json['description'],
      price: json['price'],
      address: json['address'],
      rate: json['rate'],
      hotelImages: List<HotelImageModel>.from(json["hotel_images"].map((x) => HotelImageModel.fromJson(x))),
        hotelFacilities: List<HotelFacilityModel>.from(json["hotel_facilities"].map((x) => HotelFacilityModel.fromJson(x))),
    );
  }
}

class HotelImageModel extends HotelImage {
  const HotelImageModel({
    required super.hotelId,
    required super.image,
  });

  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(
      hotelId: json["hotel_id"],
      image: json["image"],
    );
  }
}

class HotelFacilityModel extends HotelFacility {
  const HotelFacilityModel({
    required super.hotelId,
    required super.facilityId,
  });

  factory HotelFacilityModel.fromJson(Map<String, dynamic> json) {
    return HotelFacilityModel(
      hotelId: json["hotel_id"],
      facilityId: json["facility_id"],
    );
  }
}


