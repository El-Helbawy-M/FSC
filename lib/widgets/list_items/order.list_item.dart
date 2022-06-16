import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/models/order.dart';
import 'package:fuodz/constants/app_strings.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/order.i18n.dart';
import 'package:expandable/expandable.dart';

import '../../AppIcons/app_icons_icons.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    this.order,
    this.onPayPressed,
    this.orderPressed,
    Key key,
  });

  final Order order;
  final Function onPayPressed;
  final Function orderPressed;
  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    ExpandableController _controller = ExpandableController();
    return VStack(
      [
        ExpandablePanel(
          controller: _controller,
          header: HStack(
            [
              //vendor image
              // CustomImage(
              //   imageUrl: order.vendor.featureImage,
              //   width: context.percentWidth * 20,
              //   boxFit: BoxFit.cover,
              //   height: context.percentHeight * 12,
              // ),
              order.isPackageDelivery
                  ? Container(
                      width: context.percentWidth * 14,
                      height: context.percentWidth * 14,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: Image.network(
                        order.vendor.featureImage,
                      )).p(16)
                  : Container(
                      width: context.percentWidth * 14,
                      height: context.percentWidth * 14,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(360),
                      ),
                      child: CircleAvatar(
                        child: Image.network(
                          order.orderProducts[0]?.product?.photo ?? "",
                        ),
                      )).p(16),

              //
              VStack(
                [
                  //
                  "order id"
                      .i18n
                      .text
                      .fontFamily(GoogleFonts.cairo().fontFamily)
                      .lg
                      .gray500
                      .make(),
                  "#${order.code}"
                      .text
                      .fontFamily(GoogleFonts.cairo().fontFamily)
                      .medium
                      .lowercase
                      .make(),

                  //amount and total products
                  // HStack(
                  //   [
                  //     (order.isPackageDelivery
                  //             ? order.packageType.name
                  //             : "%s Product(s)"
                  //                 .i18n
                  //                 .fill([order.orderProducts.length]))
                  //         .text
                  //         .medium
                  //         .make()
                  //         .expand(),
                  //     "${AppStrings.currencySymbol} ${order.total.numCurrency}"
                  //         .text
                  //         .xl
                  //         .semiBold
                  //         .make(),
                  //   ],
                  // ),
                  //time & status
                ],
              ).px2().pOnly(top: 12).expand(),
              // time
              VStack(
                [
                  Icon(
                    AppIcons.clock,
                    color: AppColor.primaryColor,
                  ).centered().p8(),
                  HStack(
                    [
                      //time
                      order.formattedDate.text
                          .fontFamily(GoogleFonts.cairo().fontFamily)
                          .sm
                          .make(),
                    ],
                  ).centered()
                ],
                crossAlignment: CrossAxisAlignment.center,
              ).px8(),

              Container(
                constraints: BoxConstraints(
                  minWidth: context.percentWidth * 24,
                ),
                height: context.percentWidth * 24,
                child: order.status.i18n
                    .allWordsCapitilize()
                    .text
                    .fontFamily(GoogleFonts.cairo().fontFamily)
                    .align(TextAlign.center)
                    .xl
                    .color(AppColor.getStausColor(order.status))
                    .medium
                    .make()
                    .px12()
                    .centered(),
                color: AppColor.getStausColor(order.status).withOpacity(0.1),
              ),
            ],
          ).wFull(context),
          expanded: VStack(
            [
              HStack(
                [
                  Row(
                    children: [
                      Container(
                        width: context.percentWidth * 14,
                        height: context.percentWidth * 14,
                      ).px16(),
                      // type
                      VStack(
                        [
                          //
                          "order type"
                              .i18n
                              .text
                              .fontFamily(GoogleFonts.cairo().fontFamily)
                              .lg
                              .gray500
                              .make(),
                          "${order.type}"
                              .i18n
                              .text
                              .fontFamily(GoogleFonts.cairo().fontFamily)
                              .medium
                              .make(),
                          // VStack([
                          //   MaterialButton(
                          //     onPressed: orderPressed,
                          //     child: "details".i18n.text.lg.white.make(),
                          //     color: AppColor.primaryColor,
                          //   ).centered(),
                          // ])

                          //time & status
                        ],
                        alignment: MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                  // price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VStack(
                        [
                          Icon(
                            AppIcons.icon_ionic_ios_wallet,
                            color: AppColor.primaryColor,
                            size: 20,
                          ).py4(),
                          HStack([
                            "${AppStrings.currencySymbol}${order.total}"
                                .text
                                .fontFamily(GoogleFonts.cairo().fontFamily)
                                .sm
                                .make(),
                          ]),
                        ],
                        crossAlignment: CrossAxisAlignment.center,
                        alignment: MainAxisAlignment.start,
                      ).px8(),
                      VStack(
                        [
                          Container(
                            constraints: BoxConstraints(
                              minWidth: context.percentWidth * 24,
                            ),
                            height: context.percentWidth * 17,
                            child: order.status.i18n
                                .allWordsCapitilize()
                                .text
                                .align(TextAlign.center)
                                .fontFamily(GoogleFonts.cairo().fontFamily)
                                .xl
                                .color(AppColor.getStausColor(order.status)
                                    .withOpacity(0))
                                .medium
                                .make()
                                .px12()
                                .centered(),
                            color: AppColor.getStausColor(order.status)
                                .withOpacity(0.1),
                          ),
                        ],
                        // alignment: MainAxisAlignment.start,
                        // crossAlignment: CrossAxisAlignment.start,
                      ),
                    ],
                  ),
                ],
                alignment: MainAxisAlignment.spaceBetween,
                crossAlignment: CrossAxisAlignment.start,
              ),
              HStack(
                [
                  Container(
                    width: context.percentWidth * 14,
                    height: context.percentWidth * 14,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: orderPressed,
                    child: "details"
                        .i18n
                        .text
                        .fontFamily(GoogleFonts.cairo().fontFamily)
                        .lg
                        .white
                        .make(),
                    color: AppColor.primaryColor,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minWidth: context.percentWidth * 24,
                    ),
                    height: context.percentWidth * 17,
                    child: order.status.i18n
                        .allWordsCapitilize()
                        .text
                        .fontFamily(
                            Theme.of(context).textTheme.bodyText1.fontFamily)
                        .align(TextAlign.center)
                        .xl
                        .color(
                            AppColor.getStausColor(order.status).withOpacity(0))
                        .make()
                        .px12()
                        .centered(),
                    color:
                        AppColor.getStausColor(order.status).withOpacity(0.1),
                  ),
                ],
                alignment: MainAxisAlignment.spaceBetween,
              ),
            ],
            alignment: MainAxisAlignment.spaceAround,
            crossAlignment: CrossAxisAlignment.stretch,
          ).onInkTap(() {
            _controller.toggle();
          }),
          theme: ExpandableThemeData(
              hasIcon: false,
              alignment: Alignment.center,
              tapBodyToCollapse: true),
          //
          collapsed: VStack([])
          // .onInkTap(() => _controller.toggle())
          // .card
          // .elevation(1)
          // .clip(Clip.antiAlias)
          // .roundedLg
          // .make(),
          ,
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
            );
          },
        )
      ],
    )
        .onInkTap(() => isExpanded = !isExpanded)
        .card
        .elevation(1)
        .clip(Clip.antiAlias)
        .roundedLg
        .make();
  }
}
