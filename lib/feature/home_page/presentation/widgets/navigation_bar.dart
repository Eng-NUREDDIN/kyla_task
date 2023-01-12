
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';
class PageNavigationBar extends StatelessWidget {
  PageController pageController=PageController(initialPage: 0);
   PageNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return  BottomNavigationBar(
    currentIndex: state.pageIndex,
    elevation: 0.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Theme.of(context).primaryColor,
    backgroundColor: Colors.white,
    onTap: (index) {

      BlocProvider.of<HomePageBloc>(context).add(
          PagesEvent(index: index));


    },
    items: const [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 32,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
            size: 32,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.add_home_work_outlined,
            size: 32,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 32,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.perm_identity,
            size: 32,
          ),
          label: ''),
    ],
  );
      },
    );
  }
}
