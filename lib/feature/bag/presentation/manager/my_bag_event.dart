part of 'my_bag_bloc.dart';

abstract class MyBagEvent extends Equatable {
  const MyBagEvent();

  @override
  List<Object> get props => [];
}

// class AddOneMoreItemEvent extends MyBagEvent {
//
//   final int itemIndex;
//
//   const AddOneMoreItemEvent(this.itemIndex);
//
//   @override
//   List<Object?> get props => [itemIndex];
//
// }
class BagEvent extends MyBagEvent {}
class BagItemEvent extends MyBagEvent {}
class RemoveOneItemEvent extends MyBagEvent {
  final int itemIndex;
  int quantity;

   RemoveOneItemEvent(this.itemIndex, this.quantity);
}
class AddOneMoreItemEvent extends MyBagEvent {
  final int itemIndex;
  int quantity;

   AddOneMoreItemEvent(this.itemIndex, this.quantity);
}

