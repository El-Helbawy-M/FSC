import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/vendor_details.vm.dart';
import 'package:fuodz/widgets/buttons/call.button.dart';
import 'package:fuodz/widgets/buttons/route.button.dart';
import 'package:fuodz/widgets/custom_image.view.dart';
import 'package:fuodz/widgets/tags/close.tag.dart';
import 'package:fuodz/widgets/tags/delivery.tag.dart';
import 'package:fuodz/widgets/tags/open.tag.dart';
import 'package:fuodz/widgets/tags/pickup.tag.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/vendor_details.i18n.dart';

import '../../../../AppIcons/app_icons_icons.dart';

class VendorDetailsHeader extends StatelessWidget {
  const VendorDetailsHeader(this.model, {Key key}) : super(key: key);

  final VendorDetailsViewModel model;
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        SizedBox(
          height: 320,
          child: Stack(
            children: [
              //vendor image
              Hero(
                tag: model.vendor.heroTag,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(
                          model.vendor.featureImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              //vendor header
              Positioned(
                bottom: 0,
                left: context.percentHeight * 6,
                right: context.percentHeight * 6,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        spreadRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VStack(
                      [
                        model.vendor.name.text.xl3.make(),
                        UiSpacer.verticalSpace(space: 2),

                        model.vendor.address.text.gray400.light.base
                            .maxLines(1)
                            .make(),
                        UiSpacer.verticalSpace(space: 2),

                        HStack(
                          [
                            Text(
                              model.vendor.isOpen ? "Open".i18n : "Closed".i18n,
                              style: context.textTheme.bodyText1.copyWith(
                                color: model.vendor.isOpen
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            // Text(
                            //   " 8:00 - 10:00 ",
                            //   style: context.textTheme.bodyText1.copyWith(
                            //     color: model.vendor.isOpen
                            //         ? Colors.green
                            //         : Colors.red,
                            //   ),
                            // ),
                          ],
                          alignment: MainAxisAlignment.center,
                        ),
                        UiSpacer.verticalSpace(space: 2),
                        HStack(
                          [
                            for (var tag in model.vendor.categories)
                              tag.name.text.gray400.light.base.make(),
                            "-".text.gray400.light.base.make(),
                            UiSpacer.horizontalSpace(space: 2),
                          ],
                        ),

                        model.vendor.description.text.light.base
                            .maxLines(1)
                            .make(),
                        UiSpacer.verticalSpace(space: 2),

                        HStack(
                          [
                            Text(
                              "\$".i18n,
                              style: context.textTheme.headline6.copyWith(
                                fontSize: context.percentWidth * 4,
                              ),
                            ),
                            Text(
                              model.vendor.baseDeliveryFee.toInt().toString() +
                                  " - " +
                                  model.vendor.deliveryFee.toInt().toString() +
                                  " ",
                              style: context.textTheme.headline6.copyWith(
                                fontSize: context.percentWidth * 4,
                              ),
                            ),
                            Icon(
                              AppIcons.icon_ionic_ios_wallet,
                              color: AppColor.primaryColor,
                              size: context.percentWidth * 4,
                            ),
                            Text(
                              "   |   ",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              model.vendor.rating.toString(),
                              style: context.textTheme.headline6.copyWith(
                                fontSize: context.percentWidth * 4,
                              ),
                            ),
                            Icon(
                              AppIcons.star,
                              color: AppColor.primaryColor,
                              size: context.percentWidth * 4,
                            ),
                          ],
                          alignment: MainAxisAlignment.center,
                        ),

                        // "Open".i18n.text.green600.light.base.make(),
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //
        //
        // VStack(
        //   [
        //     UiSpacer.verticalSpace(space: 10),

        //     //description
        //     "Description".i18n.text.sm.bold.uppercase.make(),
        //     model.vendor.description.text.make(),
        //     UiSpacer.verticalSpace(space: 10),

        //     //address
        //     HStack(
        //       [
        //         //
        //         VStack(
        //           [
        //             "Address".i18n.text.sm.bold.uppercase.make(),
        //             model.vendor.address.text.make(),
        //           ],
        //         ).expand(),

        //         //location routing
        //         (model.vendor.latitude.isNotBlank &&
        //                 model.vendor.longitude.isNotBlank)
        //             ? RouteButton(model.vendor)
        //             : UiSpacer.emptySpace(),
        //       ],
        //     ),
        //     UiSpacer.verticalSpace(space: 10),

        //     //PHONE
        //     HStack(
        //       [
        //         //
        //         VStack(
        //           [
        //             "Phone".i18n.text.sm.bold.uppercase.make(),
        //             model.vendor.phone.text.make(),
        //           ],
        //         ).expand(),
        //         //location routing
        //         (model.vendor.latitude.isNotBlank &&
        //                 model.vendor.longitude.isNotBlank)
        //             ? CallButton(model.vendor)
        //             : UiSpacer.emptySpace(),
        //       ],
        //     ),
        //   ],
        // ).p20(),
        UiSpacer.verticalSpace(space: 20),
      ],
    );
  }
}
