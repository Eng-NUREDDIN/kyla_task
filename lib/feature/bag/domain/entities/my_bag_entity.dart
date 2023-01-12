import 'package:equatable/equatable.dart';

class MyBagEntity extends Equatable {
  final String id;
  final String name;
  final String image;
  final String price;
  final int quantity;
  final String total;

  const MyBagEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.total,
  });

  @override
  List<Object> get props => [
        id,
        name,
        image,
        price,
        quantity,
        total,
      ];
}