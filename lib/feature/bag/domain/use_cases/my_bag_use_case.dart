import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/base_use_case/base_use_case.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';
import 'package:kyla_task/feature/bag/domain/repositories/my_bag_repository.dart';


class MyBagUseCase extends BaseUseCases {
  final MyBagRepository myBagRepository;


  MyBagUseCase(this.myBagRepository);

  @override
  Either<ServerException, List<MyBagEntity>> call() {
    return myBagRepository.getMyBagData();
  }
}