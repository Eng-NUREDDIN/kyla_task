import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/service/service_locator.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/navigation_bar.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/page_view.dart';




class HomePage extends  StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(sl(),sl())
      ..add(BrandEvent())..add(ShoeEvent()),
      child: Scaffold(
        bottomNavigationBar:  PageNavigationBar(),
        body:const HomePageView()
      ),
    );
  }
}
