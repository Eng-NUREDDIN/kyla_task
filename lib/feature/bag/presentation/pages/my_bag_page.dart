import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/service/service_locator.dart';
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
      create: (context) => MyBagBloc(sl())..add(BagItemEvent()),
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
                      return Text("total ${state.bagItems.length} items");
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

                    return state.bagItems.isEmpty? const Center(child: Text("No Item"),) : AnimatedList(
                      key: _key,
                        initialItemCount: state.bagItems.length,
                        controller: _animatedListController,
                        itemBuilder: (c, index, animation) {

                          return ScaleTransition(
                              scale: animation,
                              child: MyBagItemWidget(entity: state.bagItems[index],
                                onAddPressed: () {
                                  BlocProvider
                                      .of<MyBagBloc>(context)
                                      .add(AddOneMoreItemEvent(index, state.bagItems[index].quantity));
                                },
                                onRemovePressed: () {

                                if( state.bagItems[index].quantity-1<=0){

                                  var tempEntity=state.bagItems[index];
                                  _key.currentState!.removeItem(
                                      index, (context, animation) =>
                                      ScaleTransition(
                                          alignment: const Alignment(
                                              -0.5, -0.2),
                                          scale: animation,
                                          child: MyBagItemWidget(
                                            entity: tempEntity)),
                                      duration: const Duration(
                                          milliseconds: 800));
                                }
                                  BlocProvider
                                      .of<MyBagBloc>(context)
                                      .add(RemoveOneItemEvent(index, state.bagItems[index].quantity));
                                },),
                            );
                        },
                      );

                  },
                )),
            const MyBagPageFooter()
          ],
        ),
      ),
    );
  }
}
