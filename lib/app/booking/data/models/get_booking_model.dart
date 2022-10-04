import '../../domain/entities/get_booking_entities.dart';

class GetBookingModel extends GetBookingEntities {
  GetBookingModel({
    required super.dataId,
    required super.hotelId,
    required super.dataType,
    required super.nameHotel,
    required super.descHotel,
    required super.priceHotel,
    required super.addressHotel,
    required super.longHotel,
    required super.latHotel,
    required super.rateHotel,
    required super.HotelImages_image,
    required super.HotelImages_id,
    required super.Facilities_name,
    required super.Facilities_image,
    required super.Facilities_id,
  });

  // factory UpdateBookingModel.fromJson(Map<String, dynamic> json) {
  //   return UpdateBookingModel(
  //     type: json['type'] ?? '0',
  //     messageAr:
  //         json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
  //     messageEn:
  //         json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
  //   );
  // }
}

class GetBookingModel {
  Data1? data1;

  GetBookingModel({this.data1});

  GetBookingModel.fromJson(Map<String, dynamic> json) {
    data1 = json['data'] != null ? Data1.fromJson(json['data']) : null;
  }
}

class Data1 {
  List<Data>? data;

  Data1({
    this.data,
  });

  Data1.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? userId;
  String? hotelId;
  String? type;

  Hotel? hotel;

  Data({this.id, this.userId, this.hotelId, this.type, this.hotel});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    type = json['type'];

    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }
}

class Hotel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? address;
  String? longitude;
  String? latitude;
  String? rate;

  List<HotelImages>? hotelImages;
  List<Facilities>? facilities;

  Hotel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.address,
      this.longitude,
      this.latitude,
      this.rate,
      this.hotelImages,
      this.facilities});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    rate = json['rate'];

    if (json['hotel_images'] != null) {
      hotelImages = <HotelImages>[];
      json['hotel_images'].forEach((v) {
        hotelImages!.add(new HotelImages.fromJson(v));
      });
    }
    if (json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add(new Facilities.fromJson(v));
      });
    }
  }
}

class HotelImages {
  int? id;
  String? hotelId;
  String? image;

  HotelImages({
    this.id,
    this.hotelId,
    this.image,
  });

  HotelImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    image = json['image'];
  }
}

class Facilities {
  int? id;
  String? name;
  String? image;

  Facilities({
    this.id,
    this.name,
    this.image,
  });

  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
