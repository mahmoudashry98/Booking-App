import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String rate;

  const Search({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    address,
    latitude,
    longitude,
    rate,
  ];
}
