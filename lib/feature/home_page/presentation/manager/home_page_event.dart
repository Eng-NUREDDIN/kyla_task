part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}
// class changePageEvent extends HomePageEvent{
//   final int index;
//   const changePageEvent({required this.index});
// }
class HomeEvent extends HomePageEvent {}
class FavoriteEvent extends HomePageEvent {}
class LocationEvent extends HomePageEvent {}
class BasketEvent extends HomePageEvent {}
class MyAccountEvent extends HomePageEvent {}
class NavigationButtonEvent extends HomePageEvent{}
class BrandEvent extends HomePageEvent {}
class BrandButtonEvent extends HomePageEvent{
  final int index;
  const BrandButtonEvent({required this.index});
}
class ShoeEvent extends HomePageEvent {}
class SizeSelectedEvent extends HomePageEvent{
  final int index;
  const SizeSelectedEvent({required this.index});
}
class PagesEvent extends HomePageEvent{
  final int index;
  const PagesEvent({required this.index});
}