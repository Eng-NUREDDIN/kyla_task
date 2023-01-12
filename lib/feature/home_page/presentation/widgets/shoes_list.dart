import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';

class ShoesList extends StatelessWidget {
  const ShoesList({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight() * 0.25,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return shoesCard(context, index);
        },
        separatorBuilder: (context, index) =>
        const SizedBox(
          width: 25,
        ),
        itemCount: 5,
      ),
    );
  }

  Widget shoesCard(BuildContext context, int index) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Card(
          child: Stack(
            children: [
              Container(
                height: 50,
                width: context.getWidth() * 0.40,

              ),
              Positioned(
                top: 4,
                left: 0,
                child: RotatedBox(quarterTurns: 3,
                  child: Container(
                      color: Colors.red, child: const Text("    New    ",)),),
              ),
              const Positioned(
                top: 4,
                right: 0,
                child: Icon(Icons.favorite_border),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: context.getWidth() * 0.40,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("${state.shoeData[index].brand} ${state.shoeData[index].name}", style: const TextStyle(fontSize: 12),),
                        Text(state.shoeData[index].price, style: const TextStyle(fontSize: 12),),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: context.getHeight() * 0.15,
                  width: context.getWidth() * 0.40,
                  child: Image.asset(state.shoeData[index].image),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
