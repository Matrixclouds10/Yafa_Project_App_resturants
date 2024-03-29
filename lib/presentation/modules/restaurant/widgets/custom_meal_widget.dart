import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_constant/images.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../data/model/response/category_all_items_model.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../component/custom_rate.dart';

class CustomMealWidget extends StatelessWidget {
  const CustomMealWidget({super.key,  this.categoriesItemsModelData});
  final CategoryItemsData? categoriesItemsModelData;
  @override
  Widget build(BuildContext context) {
    double rating = 3;
    return
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black26,blurRadius: 3)]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomImage(image: categoriesItemsModelData!.image!,radius: 20,),
            SizedBox(width: 5.w,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 1.h,),
                   Column(
                     children: [
                       Text(categoriesItemsModelData!.name!,
                         style: TextStyles.font16Black600Weight,
                       ),
                       Text(categoriesItemsModelData!.description!,
                         style: TextStyles.font15CustomGray400Weight.copyWith(
                             fontSize: 13
                         ),
                         textAlign: TextAlign.center,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ],
                   ),
                  // Center(
                  //   child: StatefulBuilder(builder: (context,setState){
                  //     return Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         RatingWidget(
                  //           filledStar: Icons.star,
                  //           halfStar: Icons.star_half,
                  //           emptyStar: Icons.star_border,
                  //           rating: rating,
                  //           onChanged: (rating) {
                  //             setState(() {
                  //               rating = rating;
                  //             });
                  //           },
                  //         ),
                  //         SizedBox(width: 10.w,),
                  //         Text(
                  //           '$rating',
                  //           style: TextStyles.font16Black600Weight.copyWith(
                  //               fontSize: 13
                  //           ),
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ],
                  //     );
                  //   },),
                  // ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size(20, 30), // Set your desired width and height
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.shopping_cart_checkout_sharp, color: Colors.white, size: 12),
                            Text(
                              '  Add to Cart',
                              style: TextStyles.font14White500Weight.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(width: 5.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.h,),
                const Icon(Icons.favorite,color: Colors.red,),
                SizedBox(height: 5.h,),
               Column(
                 children: [
                   categoriesItemsModelData!.priceDiscount!=null?
                   Text(
                     '\$${categoriesItemsModelData!.price!}',
                     style: TextStyles.font16Black600Weight.copyWith(
                         decoration: TextDecoration.lineThrough,
                         fontSize: 14,
                         fontWeight: FontWeight.w400
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ):const SizedBox.shrink(),
                   Text(
                       '\$${categoriesItemsModelData!.priceAfterDiscount}',
                     style: TextStyles.font16Black600Weight.copyWith(
                         color:AppColors.redColor
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ],
               ),
                SizedBox(height: 10.h,),
              ],
            ),
            SizedBox(width: 10.w,),
          ],
        ),
      ),
    );
  }
}
