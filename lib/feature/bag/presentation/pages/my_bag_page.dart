import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/feature/bag/presentation/manager/my_bag_bloc.dart';
import 'package:kyla_task/feature/bag/presentation/widgets/my_bags_page_footer.dart';



import '../widgets/my_bag_item_widget.dart';


class MyBagPage extends StatelessWidget {
  MyBagPage({Key? key}) : super(key: key);
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final ScrollController _animatedListController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyBagBloc(),
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:  BackButton(onPressed: () => Navigator.pop(context),
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const  Text("My Bag", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                  BlocBuilder<MyBagBloc, MyBagState>(
                    builder: (context, state) {
                      return Text("total ${BlocProvider
                          .of<MyBagBloc>(context)
                          .items
                          .length} items");
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Expanded(
                child:
                BlocBuilder<MyBagBloc, MyBagState>(
                  builder: (context, state) {
                    if (state is RebuildListState) {
                      return AnimatedList(
                        key: _key,
                        initialItemCount: BlocProvider
                            .of<MyBagBloc>(context)
                            .items
                            .length,
                        controller: _animatedListController,
                        itemBuilder: (c, index, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: MyBagItemWidget(entity: BlocProvider
                                  .of<MyBagBloc>(context)
                                  .items[index],
                                onAddPressed: () {
                                  BlocProvider
                                      .of<MyBagBloc>(context)
                                      .add(AddOneMoreItemEvent(index));
                                },
                                onRemovePressed: () {
                                  if (BlocProvider
                                      .of<MyBagBloc>(context)
                                      .items[index].count <= 1) {
                                    _key.currentState!.removeItem(
                                        index, (context, animation) =>
                                        ScaleTransition(
                                            alignment: const Alignment(
                                                -0.5, -0.2),
                                            scale: animation,
                                            child: MyBagItemWidget(
                                              entity: BlocProvider
                                                  .of<MyBagBloc>(context)
                                                  .items[index],)),
                                        duration: const Duration(
                                            milliseconds: 800));
                                  }
                                  BlocProvider
                                      .of<MyBagBloc>(context)
                                      .add(RemoveOneItemEvent(index));
                                },),
                            ),
                      );
                    } else if (state is MyBagInitial) {
                      return AnimatedList(
                        initialItemCount: BlocProvider
                            .of<MyBagBloc>(context)
                            .items
                            .length,
                        controller: _animatedListController,
                        itemBuilder: (c, index, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: MyBagItemWidget(entity: BlocProvider
                                  .of<MyBagBloc>(context)
                                  .items[index],
                                onAddPressed: () {
                                  BlocProvider
                                      .of<MyBagBloc>(context)
                                      .add(AddOneMoreItemEvent(index));
                                },
                                onRemovePressed: () {
                                  BlocProvider
                                      .of<MyBagBloc>(context)
                                      .add(RemoveOneItemEvent(index));
                                },),
                            ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
            const MyBagPageFooter()
          ],
        ),
      ),
    );
  }
}
