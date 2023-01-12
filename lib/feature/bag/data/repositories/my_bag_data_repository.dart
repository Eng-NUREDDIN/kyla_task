import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';
import 'package:kyla_task/feature/bag/data/remote/data_sources/bag_data_source_methods.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';
import 'package:kyla_task/feature/bag/domain/repositories/my_bag_repository.dart';

class MyBagDataRepository extends MyBagRepository {
  final BagDataSourceMethod bagDataSourceMethod;

  MyBagDataRepository(this.bagDataSourceMethod);

  @override
  Either<ServerException, List<MyBagEntity>> getMyBagData() {
    final result=bagDataSourceMethod.getBagData();
    try{
      return Right(result);
    } on ServerException catch(serverException){
      return Left(serverException);
    }
  }
}