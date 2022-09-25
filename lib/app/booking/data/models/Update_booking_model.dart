import 'package:booking_app/app/booking/create_booking/domain/entities/create_booking.dart';

class UpdateBookingModel extends CreateBookingEntities {
  UpdateBookingModel(
      {required super.type,
      required super.messageAr,
      required super.messageEn});

  factory UpdateBookingModel.fromJson(Map<String, dynamic> json) {
    return UpdateBookingModel(
      type: json['type'] ?? '0',
      messageAr:
          json['title'] != null ? json['title']['ar'] ?? 'empty' : 'empty',
      messageEn:
          json['title'] != null ? json['title']['en'] ?? 'empty' : 'empty',
    );
  }
}
