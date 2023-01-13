
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyla_task/core/utils/enum_state.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';

import 'package:kyla_task/feature/bag/domain/use_cases/my_bag_use_case.dart';


part 'my_bag_event.dart';
part 'my_bag_state.dart';

class MyBagBloc extends Bloc<MyBagEvent, MyBagState> {
final MyBagUseCase myBagUseCase;

  MyBagBloc(this.myBagUseCase) : super(const MyBagState()) {
    on<BagEvent> ((event, emit) {});
    on<BagItemEvent>(_getBagItemData);
    on<RemoveOneItemEvent>(_removeItem);
    on<AddOneMoreItemEvent>(_addOneMoreItem);
  }
FutureOr<void> _removeItem(RemoveOneItemEvent event, Emitter<MyBagState> emit) {
    int quantity = event.quantity-1;
    if(quantity>0){
      state.bagItems[event.itemIndex].quantity--;
    }else{
      state.bagItems.removeAt(event.itemIndex);
    }
emit( state.copyWith(index: (event.quantity)));
  }

FutureOr<void> _addOneMoreItem(AddOneMoreItemEvent event, Emitter<MyBagState> emit) {
    int quantity = event.quantity+1;
    state.bagItems[event.itemIndex].quantity++;
    emit( state.copyWith(index: (event.quantity)));
  }



FutureOr<void> _getBagItemData(BagItemEvent event, Emitter<MyBagState> emit) async {
  final result = myBagUseCase();
  result.fold(
          (l) => emit(state.copyWith(
          bagMessage: l.errorModel.errorMessage,
              bagState: RequestState.error)),
          (r) => emit(
          state.copyWith(bagState: RequestState.loaded, bagItems: r)));
  }
}
