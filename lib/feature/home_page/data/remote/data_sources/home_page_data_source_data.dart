import 'package:kyla_task/core/dummy%20data/mocked_data.dart';
import 'package:kyla_task/feature/home_page/data/remote/data_sources/home_page_data_source_method.dart';
import 'package:kyla_task/feature/home_page/data/remote/models/brand_model.dart';
import 'package:kyla_task/feature/home_page/data/remote/models/shoe_model.dart';

class HomePageDataSourceData extends HomePageDataSourceMethod {
  @override
  List<BrandModel> getBrandData() {
    final response = MockedData().brandData;
    return List<BrandModel>.from(
      (response["data"] as List).map((element) => BrandModel.fromJson(element)),
    );
  }

  @override
  List<ShoeModel> getShoeData() {
    final response = MockedData().shoeData;
    return List<ShoeModel>.from(
      (response["data"] as List).map((element) => ShoeModel.fromJson(element)),
    );
  }
}