part of 'my_bag_bloc.dart';

class MyBagState extends Equatable {
  final List<MyBagEntity> bagItems;
  final RequestState bagState;
  final String bagMessage;
  final int index;
  final bool isRebuildListState;
  final bool isBagItemState;

  const MyBagState({
    this.bagItems = const [],
    this.bagState = RequestState.loading,
    this.bagMessage = "",
    this.index = 0,
    this.isRebuildListState = false,
    this.isBagItemState = false,

  });

  MyBagState copyWith({
    List<MyBagEntity>? bagItems,
    RequestState? bagState,
    String? bagMessage,
    int? index,
    bool? isRebuildListState,
    bool? isBagItemState,
  }) {
    return MyBagState(
      bagItems: bagItems ?? this.bagItems,
      bagState: bagState ?? this.bagState,
      bagMessage: bagMessage ?? this.bagMessage,
      index: index ?? this.index,
      isRebuildListState: isRebuildListState ?? this.isRebuildListState,
      isBagItemState: isBagItemState ?? this.isBagItemState,
    );
  }

  @override
  List<Object> get props => [
        bagItems,
        index,
        bagState,
        bagMessage,
        isRebuildListState,
        isBagItemState,
      ];
}
