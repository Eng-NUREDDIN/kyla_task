import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';


abstract class BaseUseCases<T>{
  Either<ServerException,List<T>> call ();
}