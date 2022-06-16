import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fuodz/AppIcons/app_icons_icons.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/translations/new_parcel.i18n.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/new_parcel.vm.dart';
import 'package:fuodz/views/pages/parcel/widgets/form_step_controller.dart';
import 'package:fuodz/widgets/list_items/package_type.list_item.dart';
import 'package:fuodz/widgets/list_items/parcel_vendor.list_item.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../constants/app_colors.dart';

class PackageDeliverySummary extends StatelessWidget {
  const PackageDeliverySummary({this.vm, Key key}) : super(key: key);

  final NewParcelViewModel vm;
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        VStack(
          [
            //
            "Summary".i18n.text.xl2.semiBold.make().py20(),
            //package type
            // "Package Type".text.xl.medium.make().py8(),
            // PackageTypeListItem(packageType: vm.selectedPackgeType),
            ListTile(
              title: "Package Type".i18n.text.xl.medium.make(),
              subtitle:
                  vm.selectedPackgeType.name.text.gray500.sm.semiBold.make(),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primaryColor),
                child: Icon(
                  vm.selectedPackgeType.name == "وثائق"
                      ? FlutterIcons.docs_sli
                      : AppIcons.box,
                  color: Colors.white,
                  size: 17,
                ).p12(),
              ),
            ),
            UiSpacer.formVerticalSpace(),
            //
            // "Courier Vendor".text.xl.medium.make().py8(),
            // ParcelVendorListItem(vm.selectedVendor),
            ListTile(
              title: "Carrier Vendor".i18n.text.xl.medium.make(),
              subtitle: vm.selectedVendor.name.text.gray500.sm.semiBold.make(),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primaryColor),
                child: Icon(
                  vm.selectedVendor.name == "عربية"
                      ? AppIcons.car_side
                      : AppIcons.motorcycle,
                  color: Colors.white,
                  size: 17,
                ).pOnly(
                    top: Vx.dp12, bottom: Vx.dp12, right: Vx.dp12, left: 10),
              ),
            ),
            UiSpacer.formVerticalSpace(),

            //
            // "Delivery Details".text.xl.medium.make().py8(),
            // VStack(
            //   [
            //     "FROM".i18n.text.semiBold.make(),
            //     vm.pickupLocation.address.text.make().pOnly(bottom: Vx.dp4),
            //     UiSpacer.verticalSpace(space: 10),
            //     //dropoff location
            //     Visibility(
            //       visible: !AppStrings.enableParcelMultipleStops,
            //       child: VStack(
            //         [
            //           "TO".i18n.text.semiBold.make(),
            //           vm.dropoffLocation.address.text.make(),
            //           UiSpacer.verticalSpace(space: 10),
            //         ],
            //       ),
            //     ),
            //
            //     //stops
            //     Visibility(
            //       visible: AppStrings.enableParcelMultipleStops,
            //       child: (vm.packageCheckout.stopsLocation != null)
            //           ? VStack(
            //               [
            //                 ...(vm.packageCheckout.stopsLocation
            //                     .mapIndexed((stop, index) {
            //                   return VStack(
            //                     [
            //                       ("Stop".i18n + " ${index + 1}")
            //                           .text
            //                           .semiBold
            //                           .make(),
            //                       "${stop?.address}".text.make(),
            //                       UiSpacer.verticalSpace(space: 10),
            //                     ],
            //                   );
            //                 }).toList()),
            //               ],
            //             )
            //           : UiSpacer.emptySpace(),
            //     ),
            //
            //     //
            //     UiSpacer.verticalSpace(space: 10),
            //     HStack(
            //       [
            //         //date
            //         VStack(
            //           [
            //             "DATE".i18n.text.semiBold.make(),
            //             (vm.pickupDate != null ? vm.pickupDate : "ASAP".i18n)
            //                 .text
            //                 .make(),
            //           ],
            //         ).expand(),
            //         UiSpacer.horizontalSpace(),
            //         //time
            //         VStack(
            //           [
            //             "TIME".i18n.text.semiBold.make(),
            //             (vm.pickupTime != null ? vm.pickupTime : "ASAP".i18n)
            //                 .text
            //                 .make(),
            //           ],
            //         ).expand(),
            //       ],
            //     ),
            //   ],
            // )
            //     .p12()
            //     .box
            //     .roundedSM
            //     .border(color: Colors.grey[300], width: 2)
            //     .make(),

            ListTile(
              title: "Drop Off:".i18n.text.xl.medium.make(),
              subtitle:
                  vm.dropoffLocation.address.text.gray500.sm.semiBold.make(),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primaryColor),
                child: Icon(
                  AppIcons.marker__1_,
                  color: Colors.white,
                  size: 17,
                ).pOnly(
                    top: Vx.dp12, bottom: Vx.dp12, right: Vx.dp12, left: 10),
              ),
            ),
            UiSpacer.formVerticalSpace(),

            //

            // HStack(
            //   [
            //     VStack(
            //       [
            //         "Name".i18n.text.semiBold.make(),
            //         vm.recipientNameTEC.text.text.make(),
            //       ],
            //     ).expand(),
            //     UiSpacer.horizontalSpace(),
            //     VStack(
            //       [
            //         "phone".i18n.allWordsCapitilize().text.semiBold.make(),
            //         vm.recipientPhoneTEC.text.text.make(),
            //       ],
            //     ).expand(),
            //   ],
            // )
            //     .p12()
            //     .box
            //     .roundedSM
            //     .border(color: Colors.grey[300], width: 2)
            //     .make()
            //     .wFull(context),
            ListTile(
              title: "Recipient Info".i18n.text.xl.medium.make(),
              subtitle:
                  vm.recipientNameTEC.text.text.gray500.sm.semiBold.make(),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primaryColor),
                child: Icon(
                  AppIcons.user__1_,
                  color: Colors.white,
                  size: 17,
                ).pOnly(
                    top: Vx.dp12, bottom: Vx.dp12, right: Vx.dp12, left: 10),
              ),
            ),
            UiSpacer.formVerticalSpace(),

            //
            // "Package Parameters".text.xl.medium.make().py8(),
            // VStack(
            //   [
            //     HStack(
            //       [
            //         //weight
            //         VStack(
            //           [
            //             "Weight".i18n.text.semiBold.make(),
            //             "${vm.packageWeightTEC.text}kg".text.make(),
            //           ],
            //         ).expand(),
            //         //length
            //         VStack(
            //           [
            //             "Length".i18n.text.semiBold.make(),
            //             "${vm.packageLengthTEC.text}cm".text.make(),
            //           ],
            //         ).expand(),
            //       ],
            //     ),
            //     UiSpacer.verticalSpace(space: 10),
            //     HStack(
            //       [
            //         //width
            //         VStack(
            //           [
            //             "Width".i18n.text.semiBold.make(),
            //             "${vm.packageWidthTEC.text}cm".text.make(),
            //           ],
            //         ).expand(),
            //         //time
            //         VStack(
            //           [
            //             "Height".i18n.text.semiBold.make(),
            //             "${vm.packageHeightTEC.text}cm".text.make(),
            //           ],
            //         ).expand(),
            //       ],
            //     ),
            //   ],
            // )
            //     .p12()
            //     .box
            //     .roundedSM
            //     .border(color: Colors.grey[300], width: 2)
            //     .make()
            //     .wFull(context),
            // UiSpacer.formVerticalSpace(),
          ],
        ).scrollVertical().expand(),

        //
        FormStepController(
          onPreviousPressed: () => vm.nextForm(4),
          onNextPressed: vm.prepareOrderSummary,
        ),
      ],
    );
  }
}
