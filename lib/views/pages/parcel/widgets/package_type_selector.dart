import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/translations/new_parcel.i18n.dart';
import 'package:fuodz/view_models/new_parcel.vm.dart';
import 'package:fuodz/views/pages/parcel/widgets/form_step_controller.dart';
import 'package:fuodz/views/pages/welcome/welcome.page.dart';
import 'package:fuodz/widgets/custom_list_view.dart';
import 'package:fuodz/widgets/list_items/package_type.list_item.dart';
import 'package:fuodz/widgets/states/welcome.empty.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../AppIcons/app_icons_icons.dart';
import '../../../../constants/app_colors.dart';
import '../../../../view_models/welcome.vm.dart';
import '../../../../widgets/busy_indicator.dart';

class PackageTypeSelector extends StatelessWidget {
  const PackageTypeSelector({this.vm, Key key}) : super(key: key);

  final NewParcelViewModel vm;
  @override
  Widget build(BuildContext context) {
    return vm.busy(vm.packageTypes)
        ? BusyIndicator().centered()
        : VStack(
            [
              "Order Delivery Service"
                  .i18n
                  .text
                  .xl
                  .make()
                  .pOnly(top: 20)
                  .centered(),
              "How can I help you today?"
                  .i18n
                  .text
                  .lg
                  .make()
                  .centered()
                  .pOnly(bottom: 60),

              //
              "Select Package Type"
                  .i18n
                  .text
                  .xl
                  .medium
                  .make()
                  .py32()
                  .centered(),

              //package type

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: vm.selectedPackgeType == vm.packageTypes.first
                          ? Theme.of(context).cardColor
                          : Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: vm.selectedPackgeType == vm.packageTypes.first
                              ? AppColor.primaryColor
                              : Colors.grey.withOpacity(0.5),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: vm.selectedPackgeType == vm.packageTypes.first
                              ? Offset(0.0, 0.0)
                              : Offset(
                                  0.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: context.percentHeight * 20,
                    width: context.percentWidth * 40,
                    child: VStack(
                      [
                        Container(
                          child: Icon(
                            AppIcons.box,
                            color: Colors.white,
                            size: 16,
                          ).p12(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor,
                          ),
                        ).centered().pOnly(top: 20),
                        vm.packageTypes.first.name.i18n.text.lg.make(),
                        vm.packageTypes.first.description.i18n.text
                            .align(TextAlign.center)
                            .sm
                            .medium
                            .make()
                            .px8(),
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                    ),
                  ).onInkTap(() {
                    vm.selectedPackgeType = vm.packageTypes.first;
                    vm.changeSelectedPackageType(vm.packageTypes.first);
                  }).p8(),

                  //second package type
                  Container(
                    decoration: BoxDecoration(
                      color: vm.selectedPackgeType == vm.packageTypes.last
                          ? Theme.of(context).cardColor
                          : Theme.of(context).backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: vm.selectedPackgeType == vm.packageTypes.last
                              ? AppColor.primaryColor
                              : Colors.grey.withOpacity(0.5),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: vm.selectedPackgeType == vm.packageTypes.last
                              ? Offset(0.0, 0.0)
                              : Offset(
                                  0.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: context.percentHeight * 20,
                    width: context.percentWidth * 40,
                    child: VStack(
                      [
                        Container(
                          child: Icon(
                            AppIcons.box,
                            color: Colors.white,
                            size: 16,
                          ).p12(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.primaryColor,
                          ),
                        ).centered().pOnly(top: 20),
                        vm.packageTypes.last.name.i18n.text.lg.make(),
                        vm.packageTypes.last.description.i18n.text
                            .align(TextAlign.center)
                            .sm
                            .medium
                            .make(),
                      ],
                      crossAlignment: CrossAxisAlignment.center,
                    ),
                  ).onInkTap(() {
                    vm.selectedPackgeType = vm.packageTypes.last;
                    vm.changeSelectedPackageType(vm.packageTypes.last);
                  }).p8(),
                ],
              ).expand(),
              // CustomListView(
              //   isLoading: vm.busy(vm.packageTypes),
              //   dataSet: vm.packageTypes,
              //   itemBuilder: (context, index) {
              //     //
              //     final packageType = vm.packageTypes[index];
              //     return PackageTypeListItem(
              //       packageType: packageType,
              //       selected: vm.selectedPackgeType == packageType,
              //       onPressed: () => vm.changeSelectedPackageType(packageType),
              //     );
              //   },
              // ).expand(),

              //
              FormStepController(
                showPrevious: false,
                onNextPressed: vm.selectedPackgeType != null
                    ? () => vm.nextForm(
                          AppStrings.enableSingleVendor ? 2 : 1,
                        )
                    : null,
              ).pOnly(top: 40),
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
