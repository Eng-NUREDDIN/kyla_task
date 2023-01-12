import 'package:dartz/dartz.dart';
import 'package:kyla_task/core/base_use_case/base_use_case.dart';
import 'package:kyla_task/core/exceptions/exceptions_handiling.dart';
import 'package:kyla_task/feature/home_page/domain/entities/brand_entity.dart';
import 'package:kyla_task/feature/home_page/domain/repositories/home_page_repositoriy.dart';

class BrandUseCase extends BaseUseCases{
final HomePageRepository homePageRepository;

BrandUseCase(this.homePageRepository);

  @override
  Either<ServerException, List<BrandEntity>> call() {
    return homePageRepository.getBrands();
  }

}