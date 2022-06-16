import 'package:flutter/material.dart';
import 'package:fuodz/AppIcons/app_icons_icons.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/models/vendor.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/widgets/buttons/route.button.dart';
import 'package:fuodz/widgets/custom_image.view.dart';
import 'package:fuodz/widgets/tags/close.tag.dart';
import 'package:fuodz/widgets/tags/delivery.tag.dart';
import 'package:fuodz/widgets/tags/open.tag.dart';
import 'package:fuodz/widgets/tags/pickup.tag.dart';
import 'package:velocity_x/velocity_x.dart';

class VendorListItem extends StatelessWidget {
  const VendorListItem({
    this.vendor,
    this.onPressed,
    Key key,
  }) : super(key: key);

  final Vendor vendor;
  final Function(Vendor) onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        //product image
        Hero(
          tag: vendor.heroTag,
          child: CustomImage(
            imageUrl: vendor.featureImage,
            boxFit: BoxFit.cover,
            width: 90,
            height: 90,
          ).card.rounded.make(),
        ),

        //price
        // HStack(
        //   [
        //     AppStrings.currencySymbol.text.white.make(),
        //     product.showDiscount
        //         ? "${product.price}"
        //             .text
        //             .sm
        //             .lineThrough
        //             .white
        //             .make()
        //             .px2()
        //         : "${product.price}".text.xl.white.make(),
        //     // discount price
        //     product.showDiscount
        //         ? "${product.discountPrice}".text.xl.white.make()
        //         : UiSpacer.emptySpace(),
        //   ],
        // ).py4().box.px8.rounded.color(AppColor.primaryColor).make(),

        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  vendor.name.text.semiBold.xl.maxLines(1).overflow(TextOverflow.ellipsis).make(),
                  SizedBox(width: 10),
                  vendor.isOpen ? OpenTag() : CloseTag(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(children: [
                  vendor.description.text.color(Colors.grey).sm.maxLines(1).overflow(TextOverflow.ellipsis).make(),
                  SizedBox(
                      height: 17,
                      child: VerticalDivider(
                        thickness: 1.5,
                      )),
                  Icon(AppIcons.star),
                  double.parse(vendor.rating.toString()).text.sm.make()
                ]),
              ),
              Row(
                children: [
                  if (vendor.delivery == 1) DeliveryTag().pOnly(right: 10),
                  if (vendor.pickup == 1) PickupTag().pOnly(right: 10),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),

        // plus/min icon here
        // ProductStockState(product, qtyUpdated: qtyUpdated),
      ],
    ).box.p4.color(Colors.transparent).make().onInkTap(
          () => this.onPressed(this.vendor),
        );
    // VStack(
    //   [
    //     //
    //     // Stack(
    //     //   children: [
    //     //     //
    //     //     Hero(
    //     //       tag: vendor.heroTag,
    //     //       child: CustomImage(
    //     //         imageUrl: vendor.featureImage,
    //     //         height: Vx.dp64 * 2,
    //     //         width: context.percentWidth * 100,
    //     //       ),
    //     //     ),
    //     //     //location routing
    //     //     (vendor.latitude.isNotBlank && vendor.longitude.isNotBlank)
    //     //         ? Positioned(
    //     //             child: RouteButton(vendor),
    //     //             bottom: 10,
    //     //             right: 10,
    //     //           )
    //     //         : UiSpacer.emptySpace(),
    //     //   ],
    //     // ),

    //     //
    //     //
    //     VStack(
    //       [
    //         //name
    //         vendor.name.text.xl.medium
    //             .maxLines(1)
    //             .overflow(TextOverflow.ellipsis)
    //             .make(),
    //         //description
    //         vendor.description.text.sm.light
    //             .maxLines(1)
    //             .overflow(TextOverflow.ellipsis)
    //             .make(),
    //         //rating
    //         VxRating(
    //           maxRating: 5.0,
    //           value: double.parse(vendor.rating.toString()),
    //           isSelectable: false,
    //           onRatingUpdate: null,
    //           selectionColor: AppColor.ratingColor,
    //         ),
    //       ],
    //     ).p8(),

    //     //tags
    //     HStack(
    //       [
    //         //is open
    //         vendor.isOpen
    //             ? OpenTag().pOnly(right: 10)
    //             : CloseTag().pOnly(right: 10),

    //         //can deliver
    //         vendor.delivery == 1
    //             ? DeliveryTag().pOnly(right: 10)
    //             : UiSpacer.emptySpace(),

    //         //can pickup
    //         vendor.pickup == 1
    //             ? PickupTag().pOnly(right: 10)
    //             : UiSpacer.emptySpace(),
    //       ],
    //     ).p8(),
    //   ],
    // )
    //     .onInkTap(
    //       () => this.onPressed(this.vendor),
    //     )
    //     .wThreeForth(context)
    //     .card
    //     .clip(Clip.antiAlias)
    //     .roundedSM
    // .make();
  }
}
