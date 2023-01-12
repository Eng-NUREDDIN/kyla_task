import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';

class Brand extends StatelessWidget {


  @override
  Widget build(BuildContext context) { return Container(
            width: double.infinity,
            height: context.getHeight() * 0.07,
            child:BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: () {
                     BlocProvider.of<HomePageBloc>(context).add(
                          BrandButtonEvent(index: index));
                    },
                    child:  Container(
                          width: context.getWidth() * 0.2,
                          height: context.getHeight() * 0.07,
                          child: Center(
                            child: Text(state.brandData[index].name,
                              style: TextStyle(
                                  color: state.brandIndex== index
                                      ? Colors.black
                                      : Colors.grey),),
                          ),
                        )
                  );},
                      separatorBuilder: (context, index) => const SizedBox(width: 5,),
                      itemCount: 5);
                },
              )
        );


  }
}
