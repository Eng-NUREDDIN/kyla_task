import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/dummy%20data/mocked_data.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/bag/presentation/pages/my_bag_page.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';


class ShoeInfoWidget extends StatelessWidget {
  final ShoeInfoEntity shoeInfoEntity;

  ShoeInfoWidget(this.shoeInfoEntity);

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.getHeight() * 0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    shoeInfoEntity.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    shoeInfoEntity.price,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 65,
                child: Text(
                  shoeInfoEntity.description,
                  style: const TextStyle(color: Colors.grey, height: 1.4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: const Text(
                  'MORE DETAILS',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    "Size",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "UK",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text("USA",
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              //state.sizeIndex= index;
                              BlocProvider.of<HomePageBloc>(context)
                                  .add(SizeSelectedEvent(index: index));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:state.sizeIndex==index?  Colors.black.withOpacity(0.7):Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              width: context.getWidth() * 0.2,
                              height: context.getHeight() * 0.2,
                              child: Text(
                                  MockedData().shoeSizes[index].toString()),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 20),
                        itemCount: MockedData().shoeSizes.length),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextButton(
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyBagPage(),
                  ));},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                      alignment: Alignment.center,
                      width: context.getWidth() * 0.8,
                      child: const Text("ADD TO BAG")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
