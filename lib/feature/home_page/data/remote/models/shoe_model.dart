import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';

class ShoeModel extends ShoeInfoEntity {
  const ShoeModel({
    required int id,
    required String brand,
    required String name,
    required String description,
    required String image,
    required String price,
    required bool isFavorite,
    required int color,
  }) : super(id, brand, name, description, image, price, isFavorite, color);

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      isFavorite: json['isFavorite'],
      color: json['color'],
    );
  }
}