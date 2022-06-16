import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/constants/app_images.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/welcome.vm.dart';
import 'package:fuodz/widgets/list_items/welcome.list_item.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/welcome.i18n.dart';

import '../../AppIcons/app_icons_icons.dart';
import '../../views/pages/parcel/widgets/form_step_controller.dart';

int selectedMethod = 0;

class EmptyWelcome extends StatelessWidget {
  const EmptyWelcome({this.vm, Key key}) : super(key: key);

  final WelcomeViewModel vm;
  @override
  Widget build(BuildContext context) {
    return
        // VxBox(
        //   child: SafeArea(
        //     child: VStack(
        //       [
        //         // "Welcome".i18n.text.white.xl3.semiBold.make(),
        //         // "How can I help you today?".i18n.text.white.xl.medium.make(),
        //       ],
        //     ).py12(),
        //   ),
        // ).color(AppColor.primaryColor).p20.make().wFull(context),
        // //

        VStack(
      [
        "Order Delivery Service".i18n.text.xl.make().pOnly(top: 20).centered(),
        "How can I help you today?"
            .i18n
            .text
            .lg
            .gray500
            .make()
            .centered()
            .pOnly(bottom: 60),
        "I want to:".i18n.text.lg.semiBold.make().py64().centered(),
        //
        Container(
          child: Row(
            children: [
              AppStrings.enableFood
                  ? Container(
                      width: context.percentWidth * 40,
                      height: context.percentHeight * 22,
                      child: VStack(
                        [
                          Container(
                            child: Icon(
                              AppIcons.mask_group_4,
                              color: Colors.white,
                              size: 25,
                            ).p12(),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor,
                            ),
                          ).centered().pOnly(top: 20),
                          "Get Needs".i18n.text.lg.make(),
                          "Order for food, grocery \nand more from nearby vendors"
                              .i18n
                              .text
                              .align(TextAlign.center)
                              .sm
                              .medium
                              .make(),
                        ],
                        crossAlignment: CrossAxisAlignment.center,
                      ),
                      decoration: BoxDecoration(
                        color: vm.selectedMethod == 2
                            ? Theme.of(context).cardColor
                            : Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: vm.selectedMethod == 2
                                ? AppColor.primaryColor
                                : Colors.grey.withOpacity(0.5),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: vm.selectedMethod == 2
                                ? Offset(0.0, 0.0)
                                : Offset(
                                    0.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ).onInkTap(() {
                      vm.selectedMethod = 2;
                      vm.methodSelected(2);
                      // vm.pageSelected(2, "Market".i18n);
                    }).p8()
                  : UiSpacer.emptySpace(),
              //
              //
              AppStrings.enableParcel
                  ? Container(
                      height: context.percentHeight * 22,
                      width: context.percentWidth * 40,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: vm.selectedMethod == 1
                                  ? AppColor.primaryColor
                                  : Colors.grey.withOpacity(0.5),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: vm.selectedMethod == 1
                                  ? Offset(0.0, 0.0)
                                  : Offset(0.0,
                                      2.0), // shadow direction: bottom right
                            )
                          ],
                          color: vm.selectedMethod == 1
                              ? Theme.of(context).cardColor
                              : Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: VStack(
                        [
                          Container(
                            child: Icon(
                              AppIcons.box,
                              size: 25,
                              color: Colors.white,
                            ).p12(),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primaryColor,
                            ),
                          ).centered().pOnly(top: 20),
                          "Send packages".i18n.text.lg.make(),
                          "Send packages to anyone\n anywhere at anytime"
                              .i18n
                              .text
                              .align(TextAlign.center)
                              .sm
                              .medium
                              .make(),
                        ],
                        crossAlignment: CrossAxisAlignment.center,
                      ),
                    ).onInkTap(() {
                      vm.selectedMethod = 1;
                      vm.methodSelected(1);
                      // vm.pageSelected(2, "Market".i18n);
                    }).p8()
                  : UiSpacer.emptySpace(),

              //
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ).expand(),

        FormStepController(
          onNextPressed: vm.selectedMethod == null
              ? null
              : vm.selectedMethod == 1
                  ? () {
                      vm.pageSelected(1, title: '');
                    }
                  : () {
                      vm.pageSelected(2, title: '');
                    },
          showPrevious: false,
        )
      ],
      // alignment: MainAxisAlignment.spaceBetween,
    ).expand();
  }
}
