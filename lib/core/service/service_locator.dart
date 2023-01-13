import 'package:get_it/get_it.dart';
import 'package:kyla_task/feature/bag/data/remote/data_sources/bag_data_source_data.dart';
import 'package:kyla_task/feature/bag/data/remote/data_sources/bag_data_source_methods.dart';
import 'package:kyla_task/feature/bag/data/repositories/my_bag_data_repository.dart';
import 'package:kyla_task/feature/bag/domain/repositories/my_bag_repository.dart';
import 'package:kyla_task/feature/bag/domain/use_cases/my_bag_use_case.dart';
import 'package:kyla_task/feature/home_page/data/remote/data_sources/home_page_data_source_data.dart';
import 'package:kyla_task/feature/home_page/data/remote/data_sources/home_page_data_source_method.dart';
import 'package:kyla_task/feature/home_page/data/repositories/home_page_data_repository.dart';
import 'package:kyla_task/feature/home_page/domain/repositories/home_page_repositoriy.dart';
import 'package:kyla_task/feature/home_page/domain/use_cases/brand_use_case.dart';
import 'package:kyla_task/feature/home_page/domain/use_cases/shoe_info_use_case.dart';

final sl=GetIt.instance;
class ServiceLocator{
  void init() {
    //data source
    sl.registerLazySingleton<HomePageDataSourceMethod>(() => HomePageDataSourceData());
    sl.registerLazySingleton<BagDataSourceMethod>(() => BagDataSourceData());

    //repository
    sl.registerLazySingleton<HomePageRepository>(() => HomePageDataRepository(sl()));
    sl.registerLazySingleton<MyBagRepository>(() => MyBagDataRepository(sl()));

    //use cases
    sl.registerLazySingleton(() => BrandUseCase(sl()));
    sl.registerLazySingleton(() => ShoeInfoUseCase(sl()));
    sl.registerLazySingleton(() => MyBagUseCase(sl()));

  }
}