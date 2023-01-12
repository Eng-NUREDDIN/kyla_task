import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kyla_task/core/utils/enum_state.dart';
import 'package:kyla_task/feature/home_page/domain/entities/brand_entity.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';
import 'package:kyla_task/feature/home_page/domain/use_cases/brand_use_case.dart';
import 'package:kyla_task/feature/home_page/domain/use_cases/shoe_info_use_case.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final BrandUseCase brandUseCase;
  final ShoeInfoUseCase shoeInfoUseCase;

  HomePageBloc(this.brandUseCase,this.shoeInfoUseCase) : super(HomePageState()) {
    on<HomePageEvent>((event, emit) {
if (event is NavigationButtonEvent) {
        emit(state.copyWith(pageViewIndex: state.pageIndex));
      }else if(event is BrandButtonEvent){
        emit(state.copyWith(brandIndex: event.index));
      }else if(event is SizeSelectedEvent){
        emit(state.copyWith(sizeIndex: event.index));
      }else if(event is PagesEvent){

        emit(state.copyWith(pageIndex: event.index, pageViewIndex: event.index));
      }



    });
    on<BrandEvent>(_getBrandData);
    on<ShoeEvent>(_getShoeInfoData);
  }

  FutureOr<void> _getBrandData(BrandEvent event, Emitter<HomePageState> emit) {
    final result = brandUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            brandMessage: l.errorModel.errorMessage,
            brandState: RequestState.error)),
        (r) => emit(
            state.copyWith(brandState: RequestState.loaded, brandData: r)));
  }
  FutureOr<void> _getShoeInfoData(ShoeEvent event, Emitter<HomePageState> emit) {
    final result = shoeInfoUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            shoeMessage: l.errorModel.errorMessage,
            shoeState: RequestState.error)),
        (r) => emit(
            state.copyWith(shoeState: RequestState.loaded, shoeData: r)));
  }
  void changeBrandIndex(int index){
    emit(state.copyWith(brandIndex: index));
  }
}
