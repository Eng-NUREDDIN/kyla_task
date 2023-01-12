part of 'my_bag_bloc.dart';

abstract class MyBagState extends Equatable {
  const MyBagState();
}

class MyBagInitial extends MyBagState {
  final List<MyBagItemEntity> items = List.generate(20, (index) =>
      MyBagItemEntity(
          id: 'id',
          name: 'name',
          price: 1000 * (index + 1),
          imageUrl: 'assets/images/sneaker_0${index % 4.toInt()}.png',
          count: 40));
  @override
  List<Object> get props => [items];
}

class RebuildListState extends MyBagState {
  final String tag;

  const RebuildListState(this.tag);

  @override
  List<Object?> get props => [tag];
}
