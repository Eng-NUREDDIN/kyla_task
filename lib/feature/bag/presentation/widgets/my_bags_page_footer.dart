import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/common/widgets/button.dart';
import 'package:kyla_task/core/extensions/extensions.dart';
import 'package:kyla_task/feature/bag/domain/entities/my_bag_entity.dart';

import 'package:kyla_task/feature/bag/presentation/manager/my_bag_bloc.dart';


class MyBagPageFooter extends StatelessWidget {
  const MyBagPageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("TOTAL", style: TextStyle(fontSize: 15)),
                BlocBuilder<MyBagBloc, MyBagState>(
                  builder: (context, state) {
                    return Text(
                      "\$${calculateTotal(context)}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    );
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: KylaButton(
              onPressed: () {},
              text: 'Next',
              width: context.getWidth() * 0.9,
              height: context.getHeight() * 0.06,
            ),
          )
        ],
      ),
    );
  }

  double calculateTotal(BuildContext context) {
    double total = 0.0;
    for (MyBagEntity item in BlocProvider.of<MyBagBloc>(context).state.bagItems) {
      total += int.parse(item.price) * item.quantity;
    }
    return total;
  }
}
