import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/models/cart.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/widgets/custom_image.view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../AppIcons/app_icons_icons.dart';

class CartListItem extends StatelessWidget {
  const CartListItem(
    this.cart, {
    this.onQuantityChange,
    this.deleteCartItem,
    Key key,
  }) : super(key: key);

  final Cart cart;
  final Function(int) onQuantityChange;
  final Function deleteCartItem;

  @override
  Widget build(BuildContext context) {
    //
    final currencySymbol = AppStrings.currencySymbol;

    return HStack(
      [
        //
        //PRODUCT IMAGE
        CustomImage(
          imageUrl: cart.product.photo,
          width: context.percentWidth * 18,
          height: context.percentWidth * 18,
        ).box.clip(Clip.antiAlias).rounded.make(),

        //
        UiSpacer.horizontalSpace(),
        VStack(
          [
            //product name
            Row(
              children: [
                "${cart.selectedQty} x ".text.semiBold.xl.make(),
                cart.product.name.text.semiBold.xl.make(),
              ],
            ),
            UiSpacer.verticalSpace(space: 0),
            //product options
            cart.optionsSentence.isNotEmpty
                ? cart.optionsSentence.text.lg.gray600.medium.make()
                : UiSpacer.emptySpace(),
            cart.optionsSentence.isNotEmpty
                ? UiSpacer.verticalSpace(space: 10)
                : UiSpacer.verticalSpace(space: 5),
            //

            Row(
              children: [
                cart.product.vendor.name.text.lg.gray500.medium.make(),
                UiSpacer.horizontalSpace(),
                "$currencySymbol ${(cart.selectedQty * cart.price).toInt()}"
                    .text
                    .lg
                    .gray500
                    .make(),
                Icon(
                  AppIcons.icon_ionic_ios_wallet,
                  size: context.percentWidth * 3,
                  color: AppColor.primaryColor,
                ).p8(),
              ],
            ),

            // VxStepper(
            //   defaultValue: cart.selectedQty ?? 1,
            //   min: 1,
            //   max: cart.product.availableQty ?? 20,
            //   disableInput: true,
            //   onChange: onQuantityChange,
            // ),
          ],
        ).expand(),

        //
        UiSpacer.horizontalSpace(),
        HStack(
          [
            Icon(
              AppIcons.edit__2_,
              size: 20,
              color: AppColor.primaryColor,
            )
                .centered()
                .p8()
                .onInkTap(
                  () {
                    onQuantityChange(cart.selectedQty);
                  },
                )
                .box
                .roundedSM
                .color(AppColor.primaryColor.withOpacity(0.1))
                .make(),
            //
            UiSpacer.horizontalSpace(space: 10),

            //delete icon
            Icon(
              AppIcons.trash,
              size: 20,
              color: AppColor.primaryColor,
            )
                .centered()
                .p8()
                .onInkTap(
                  this.deleteCartItem,
                )
                .box
                .roundedSM
                .color(AppColor.primaryColor.withOpacity(0.1))
                .make(),

            //cart item price
            UiSpacer.verticalSpace(),
          ],
          alignment: MainAxisAlignment.end,
        )
      ],
    );
  }
}
