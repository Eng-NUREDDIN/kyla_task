import 'package:equatable/equatable.dart';

class MyBagEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String price;
   int quantity;
  final String total;

   MyBagEntity({
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