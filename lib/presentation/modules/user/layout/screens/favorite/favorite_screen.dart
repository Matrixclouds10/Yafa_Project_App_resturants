import 'package:cogina/presentation/component/component.dart';
import 'package:cogina/presentation/modules/user/layout/screens/favorite/widgets/custom_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../layout_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  CustomAppBar(
        title: 'Favorite',
        onBackPress: (){
          final LayoutCubit viewModel = BlocProvider.of<LayoutCubit>(context);
          viewModel.setCurrentIndex(0);
        },
      ),
      body:   GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9.w,
          mainAxisSpacing: 15.h,
          mainAxisExtent: 200.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CustomFavoriteItem();
        },
        shrinkWrap: true,
        itemCount: 10,
        padding: EdgeInsets.all(16.w),
      )
    );
  }
}