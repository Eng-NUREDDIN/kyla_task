import 'package:kyla_task/feature/bag/data/remote/models/my_bag_model.dart';

abstract class BagDataSourceMethod {
  List<MyBagModel> getBagData();
}