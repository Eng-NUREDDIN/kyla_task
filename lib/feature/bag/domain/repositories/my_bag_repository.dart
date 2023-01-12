import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';

abstract class MyBagRepository{
  Either<ServerException, List<MyBagEntity>> getMyBagData();
}