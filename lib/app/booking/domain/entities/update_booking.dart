// import 'package:equatable/equatable.dart';

// class CreateBookingEntities extends Equatable {
//   final int type;
//   final String en;

//   const CreateBookingEntities({
//     required this.type,
//     required this.en,
//   });

//   @override
//   List<Object> get props {
//     return [
//       en,
//       type,
//     ];
//   }
// }

import 'package:equatable/equatable.dart';

class CreateBookingEntities extends Equatable {
  final String type;
  final String messageAr;
  final String messageEn;

  const CreateBookingEntities({
    required this.type,
    required this.messageAr,
    required this.messageEn,
  });

  @override
  List<Object> get props => [type, messageAr, messageEn];
}
