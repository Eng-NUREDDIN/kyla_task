import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';
import 'package:kyla_task/feature/home_page/domain/entities/brand_entity.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';

abstract class HomePageRepository {
  Either<ServerException, List<BrandEntity>> getBrands();
  Either<ServerException, List<ShoeInfoEntity>> getShoe();

}