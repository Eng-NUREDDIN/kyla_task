import 'package:kyla_task/core/dummy%20data/mocked_data.dart';
import 'package:kyla_task/feature/bag/data/remote/models/my_bag_model.dart';

import 'bag_data_source_methods.dart';

class BagDataSourceData extends BagDataSourceMethod{
  @override
  List<MyBagModel> getBagData() {
    final response = MockedData().bagData;
    return List<MyBagModel>.from(
      (response["data"] as List).map((element) => MyBagModel.fromJson(element)),
    );
  }
}