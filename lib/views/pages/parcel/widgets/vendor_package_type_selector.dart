import 'package:flutter/material.dart';
import 'package:fuodz/translations/new_parcel.i18n.dart';
import 'package:fuodz/view_models/new_parcel.vm.dart';
import 'package:fuodz/views/pages/parcel/widgets/form_step_controller.dart';
import 'package:fuodz/widgets/custom_list_view.dart';
import 'package:fuodz/widgets/list_items/parcel_vendor.list_item.dart';
import 'package:fuodz/widgets/states/vendor.empty.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../AppIcons/app_icons_icons.dart';
import '../../../../constants/app_colors.dart';
import '../../../../utils/ui_spacer.dart';
import '../../../../widgets/busy_indicator.dart';
import '../../welcome/welcome.page.dart';

class VendorPackageTypeSelector extends StatelessWidget {
  const VendorPackageTypeSelector({this.vm, Key key}) : super(key: key);

  final NewParcelViewModel vm;
  @override
  Widget build(BuildContext context) {
    return vm.busy(vm.vendors)
        ? BusyIndicator().centered()
        : VStack(
            [
              UiSpacer.verticalSpace(space: 100),
              //
              "Select Courier Vendor"
                  .i18n
                  .text
                  .xl
                  .medium
                  .make()
                  .py20()
                  .centered(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: vm.selectedVendor == vm.vendors.first
                          ? Theme.of(context).cardColor
                          : Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: vm.selectedVendor == vm.vendors.first
                              ? AppColor.primaryColor
                              : Colors.grey.withOpacity(0.5),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: vm.selectedVendor == vm.vendors.first
                              ? Offset(0.0, 0.0)
                              : Offset(
                                  0.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: context.percentHeight * 17,
                    width: context.percentWidth * 40,
                    child: VStack(
                      [
                        Container(
                          child: Icon(
                            AppIcons.car_side,
                            color: Colors.white,
                            size: 30,
                          ).pOnly(top: 20, left: 15, right: 20, bottom: 20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor,
                          ),
                        ).centered().pOnly(top: 20),
                        vm.vendors.first.name.i18n.text.xl2.make(),
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                    ),
                  ).onInkTap(() {
                    vm.selectedVendor == vm.vendors.first;
                    vm.changeSelectedVendor(vm.vendors.first);
                  }).p8(),
                  //
                  // UiSpacer.horizontalSpace(),
                  //
                  vm.vendors.length == 2
                      ? Container(
                          decoration: BoxDecoration(
                            color: vm.selectedVendor == vm.vendors.last
                                ? Theme.of(context).cardColor
                                : Theme.of(context).backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: vm.selectedVendor == vm.vendors.last
                                    ? AppColor.primaryColor
                                    : Colors.grey.withOpacity(0.5),
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: vm.selectedVendor == vm.vendors.last
                                    ? Offset(0.0, 0.0)
                                    : Offset(0.0,
                                        2.0), // shadow direction: bottom right
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: context.percentHeight * 17,
                          width: context.percentWidth * 40,
                          child: VStack(
                            [
                              Container(
                                child: Icon(
                                  AppIcons.motorcycle,
                                  color: Colors.white,
                                  size: 30,
                                ).pOnly(
                                    top: 20, left: 13, right: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor,
                                ),
                              ).centered().pOnly(top: 20),
                              vm.vendors.last.name.i18n.text.xl2.make(),
                            ],
                            crossAlignment: CrossAxisAlignment.center,
                          ),
                        ).onInkTap(() {
                          vm.selectedPackgeType = vm.packageTypes.last;
                          vm.changeSelectedPackageType(vm.packageTypes.last);
                        }).p8()
                      : UiSpacer.emptySpace(),
                ],
              ).expand(),
              //package type
              // CustomListView(
              //   isLoading: vm.busy(vm.vendors),
              //   dataSet: vm.vendors,
              //   emptyWidget: EmptyVendor(showDescription: false),
              //   itemBuilder: (context, index) {
              //     //
              //     final vendor = vm.vendors[index];
              //     return ParcelVendorListItem(
              //       vendor,
              //       selected: vm.selectedVendor == vendor,
              //       onPressed: () => vm.changeSelectedVendor(vendor),
              //     );
              //   },
              // ).expand(),

              //
              FormStepController(
                onPreviousPressed: () => vm.nextForm(0),
                onNextPressed:
                    vm.selectedVendor != null ? () => vm.nextForm(2) : null,
              ),
              // "Back To Home"
              //     .i18n
              //     .text
              //     .lg
              //     .medium
              //     .gray500
              //     .make()
              //     .pOnly(bottom: 20)
              //     .onInkTap(() {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => WelcomePage()));
              // }).centered(),
            ],
          );
  }
}
