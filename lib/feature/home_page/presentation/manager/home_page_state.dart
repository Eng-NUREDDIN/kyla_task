part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  int pageIndex = 0;
  int pageViewIndex = -1;
  final List<BrandEntity> brandData;
  final RequestState brandState;
  final String brandMessage;
  int brandIndex = 0;
  final List<ShoeInfoEntity> shoeData;
  final RequestState shoeState;
  final String shoeMessage;
  int sizeIndex = 0;
  bool swapFromPageView = false;

  HomePageState({
    this.pageIndex = 0,
    this.pageViewIndex = -1,
    this.brandData = const [],
    this.brandState = RequestState.loading,
    this.brandMessage = "",
    this.brandIndex = 0,
    this.shoeData = const [],
    this.shoeState = RequestState.loading,
    this.shoeMessage = "",
    this.sizeIndex = 0,
    this.swapFromPageView = false,
  });

  HomePageState copyWith({
    int? pageIndex,
    int? pageViewIndex,
    List<BrandEntity>? brandData,
    RequestState? brandState,
    String? brandMessage,
    int? brandIndex,
    List<ShoeInfoEntity>? shoeData,
    RequestState? shoeState,
    String? shoeMessage,
    int? sizeIndex,
    bool? swapFromPageView,
  }) {
    return HomePageState(
      pageIndex: pageIndex ?? this.pageIndex,
      pageViewIndex: pageViewIndex ?? this.pageViewIndex,
      brandData: brandData ?? this.brandData,
      brandState: brandState ?? this.brandState,
      brandMessage: brandMessage ?? this.brandMessage,
      brandIndex: brandIndex ?? this.brandIndex,
      shoeData: shoeData ?? this.shoeData,
      shoeState: shoeState ?? this.shoeState,
      shoeMessage: shoeMessage ?? this.shoeMessage,
      sizeIndex: sizeIndex ?? this.sizeIndex,
      swapFromPageView: swapFromPageView ?? this.swapFromPageView,
    );
  }
  @override
  List<Object> get props => [pageIndex, pageViewIndex, brandData, brandState, brandMessage, brandIndex, shoeData, shoeState, shoeMessage, sizeIndex, swapFromPageView];
}


