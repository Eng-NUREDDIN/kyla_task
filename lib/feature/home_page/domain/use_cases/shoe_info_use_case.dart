import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/base_use_case/base_use_case.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';
import 'package:kyla_task/feature/home_page/domain/repositories/home_page_repositoriy.dart';

class ShoeInfoUseCase extends BaseUseCases{
  final HomePageRepository homePageRepository;

  ShoeInfoUseCase(this.homePageRepository);

  @override
  Either<ServerException, List<ShoeInfoEntity>> call() {
return homePageRepository.getShoe();
  }
}