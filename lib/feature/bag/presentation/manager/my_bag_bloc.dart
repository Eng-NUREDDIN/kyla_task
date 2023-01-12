
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_item_entity.dart';


part 'my_bag_event.dart';
part 'my_bag_state.dart';

class MyBagBloc extends Bloc<MyBagEvent, MyBagState> {


     List<MyBagItemEntity> items =List.generate(20, (index) =>
         MyBagItemEntity(
             id: 'id',
             name: 'name',
             price: 1000 * (index + 1),
             imageUrl: 'assets/images/sneaker_0${index % 4.toInt()}.png',
             count: 4));

  MyBagBloc() : super(MyBagInitial()) {
    on<MyBagEvent>((event, emit) {
      if(event is AddOneMoreItemEvent){
        items[event.itemIndex].count++;
        emit(  RebuildListState(items[event.itemIndex].count.toString()));
      }else if(event is RemoveOneItemEvent){
        items[event.itemIndex].count--;
        if(items[event.itemIndex].count<=0){
          items.removeAt(event.itemIndex);
        }
        emit( RebuildListState(items[event.itemIndex].count.toString()));
      }
    });
  }
}
