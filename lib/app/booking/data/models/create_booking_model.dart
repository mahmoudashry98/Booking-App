import 'package:booking_app/app/booking/create_booking/domain/entities/create_booking.dart';

class CreateBookingModel extends CreateBookingEntities {
  CreateBookingModel(
      {required super.type,
      required super.messageAr,
      required super.messageEn});

  factory CreateBookingModel.fromJson(Map<String, dynamic> json) {
    return CreateBookingModel(
      type: json['type'] ?? '0',
      messageAr:
          json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
      messageEn:
          json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
    );
  }
}
