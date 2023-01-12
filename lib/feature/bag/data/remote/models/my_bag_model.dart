import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';

class MyBagModel extends MyBagEntity{
  MyBagModel({
    required String id,
    required String name,
    required String image,
    required String price,
    required int quantity,
    required String total,
  }) : super(
    id: id,
    name: name,
    image: image,
    price: price,
    quantity: quantity,
    total: total,
  );

  factory MyBagModel.fromJson(Map<String, dynamic> json) {
    return MyBagModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'image': image,
  //     'price': price,
  //     'quantity': quantity,
  //     'total': total,
  //   };
  // }
}