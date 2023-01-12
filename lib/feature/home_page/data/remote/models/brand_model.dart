import 'package:kyla_task/feature/home_page/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      name: json['name'],
    );
  }
}