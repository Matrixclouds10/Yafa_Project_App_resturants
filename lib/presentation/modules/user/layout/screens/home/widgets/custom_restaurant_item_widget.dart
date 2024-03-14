import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cogina/core/global/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'custom_logo_restuarant.dart';

class CustomRestaurantItemWidget extends StatelessWidget {
  const CustomRestaurantItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(right: 8.0,left: 8.0),
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            const CustomLogoRestaurant(),
            Expanded(child: Text('macdonalds',style: TextStyles.font16Black500Weight)),
          ],
        ),
      ),
    );
  }
}