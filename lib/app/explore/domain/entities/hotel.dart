import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String disc;
  final String price;
  final String address;

  const Hotel(
      {required this.id,
      required this.name,
      required this.disc,
      required this.price,
      required this.address});

  @override
  List<Object> get props {
    return [
      id,
      name,
      disc,
      price,
      address,
    ];
  }
}
