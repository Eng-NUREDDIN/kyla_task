import 'package:equatable/equatable.dart';

class ShoeInfoEntity extends Equatable {
  final int id;
  final String brand;
  final String name;
  final String description;
  final String image;
  final String price;
  final bool isFavorite;
  final int color;

  const ShoeInfoEntity(this.id, this.brand, this.name, this.description, this.image,
      this.price, this.isFavorite, this.color);

  @override
  List<Object> get props =>
      [id, brand, name, description, image, price, isFavorite, color,];
}