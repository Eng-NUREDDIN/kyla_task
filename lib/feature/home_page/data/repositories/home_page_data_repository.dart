import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';

import 'package:kyla_task/feature/home_page/data/remote/data_sources/home_page_data_source_method.dart';

import 'package:kyla_task/feature/home_page/domain/entities/brand_entity.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';
import 'package:kyla_task/feature/home_page/domain/repositories/home_page_repositoriy.dart';

class HomePageDataRepository extends HomePageRepository {
  final HomePageDataSourceMethod homePageDataSourceMethod;

  HomePageDataRepository(this.homePageDataSourceMethod);

  @override
  Either<ServerException, List<BrandEntity>> getBrands() {
    final result=homePageDataSourceMethod.getBrandData();
    try{
      return Right(result);
    } on ServerException catch(serverException){
      return Left(serverException);
    }
  }

  @override
  Either<ServerException, List<ShoeInfoEntity>> getShoe() {
final result=homePageDataSourceMethod.getShoeData();
    try{
      return Right(result);
    } on ServerException catch(serverException){
      return Left(serverException);
    }
  }


}