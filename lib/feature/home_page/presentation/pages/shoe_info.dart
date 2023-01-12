import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyla_task/core/service/service_locator.dart';
import 'package:kyla_task/feature/home_page/data/remote/models/shoe_model.dart';
import 'package:kyla_task/feature/home_page/domain/entities/shoe_info_entity.dart';
import 'package:kyla_task/feature/home_page/presentation/manager/home_page_bloc.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/shoe_info_widgets/shoe_images.dart';
import 'package:kyla_task/feature/home_page/presentation/widgets/shoe_info_widgets/shoe_info_widget.dart';

class ShoeInfo extends StatelessWidget {
  final ShoeInfoEntity shoeInfoEntity;


  ShoeInfo(this.shoeInfoEntity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text(shoeInfoEntity.brand),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        //Color(shoeInfoEntity.color),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => HomePageBloc(sl(),sl()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShoeImages(shoeInfoEntity),
              const Divider(thickness: 3, color: Colors.grey,),
              ShoeInfoWidget(shoeInfoEntity),

            ],
          ),
        ),
      ),
    );
  }
}
