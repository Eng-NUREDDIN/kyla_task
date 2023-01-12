import 'package:kyla_task/feature/home_page/data/remote/models/brand_model.dart';
import 'package:kyla_task/feature/home_page/data/remote/models/shoe_model.dart';

abstract class HomePageDataSourceMethod {
  List<BrandModel> getBrandData();
  List<ShoeModel> getShoeData();

}