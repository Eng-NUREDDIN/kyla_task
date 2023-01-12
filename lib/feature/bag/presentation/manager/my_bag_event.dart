part of 'my_bag_bloc.dart';

abstract class MyBagEvent extends Equatable {
  const MyBagEvent();
}

class AddOneMoreItemEvent extends MyBagEvent{

  final int itemIndex ;

  const AddOneMoreItemEvent(this.itemIndex);
  @override
  List<Object?> get props =>[itemIndex];

}

class RemoveOneItemEvent extends MyBagEvent{
  final int itemIndex;

  const RemoveOneItemEvent(this.itemIndex);
  @override
  List<Object?> get props =>[itemIndex];

}

