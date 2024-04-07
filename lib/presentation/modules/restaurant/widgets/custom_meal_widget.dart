import 'package:cogina/core/helpers/spacing.dart';
import 'package:cogina/core/translations/locale_keys.dart';
import 'package:cogina/presentation/component/images/custom_image.dart';
import 'package:cogina/presentation/modules/layout/screens/cart/cart_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/global/styles/colors.dart';
import '../../../../../../core/global/styles/styles.dart';
import '../../../../data/model/response/category_item_model.dart';
import '../../../../domain/request_body/add_item_body.dart';

class CustomMealWidget extends StatelessWidget {
  const CustomMealWidget({super.key,  this.categoriesItemsModelData, required this.storeId});
  final CategoryItemsData? categoriesItemsModelData;
  final String storeId;
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
                width: 140.w,
                height: double.infinity,
                child: CustomImage(image: categoriesItemsModelData!.image!,radius: 20,)),
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
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ],
                   ),
                  FittedBox(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            AddItemBody addItemBody=
                            AddItemBody(itemId: categoriesItemsModelData!.id.toString(), qt: '1', storeId: storeId);
                            CartCubit.get(context).addItemCart(addItemBody: addItemBody, context: context);
                          },
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
                              horizontalSpace(2),
                              Text(
                                LocaleKeys.addCart.tr(),
                                style: TextStyles.font14White500Weight.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
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
               SizedBox(
                 width: 50.w,
                 child: Column(
                   children: [
                     categoriesItemsModelData!.priceDiscount!=null?
                     Text(
                       '\$${categoriesItemsModelData!.price!}',
                       style: TextStyles.font16Black600Weight.copyWith(
                           decoration: TextDecoration.lineThrough,
                           fontSize: 14,
                           fontWeight: FontWeight.w400
                       ),
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                     ):const SizedBox.shrink(),
                     Text(
                         '\$${categoriesItemsModelData!.priceAfterDiscount}',
                       style: TextStyles.font16Black600Weight.copyWith(
                           color:AppColors.redColor
                       ),
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                     ),
                   ],
                 ),
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
