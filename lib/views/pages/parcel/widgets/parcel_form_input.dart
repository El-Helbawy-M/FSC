import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/widgets/custom_text_form_field.dart';
import 'package:velocity_x/velocity_x.dart';

class ParcelFormInput extends StatelessWidget {
  const ParcelFormInput({
    this.prefix,
    this.iconColor,
    this.labelText,
    this.hintText,
    this.isReadOnly = true,
    this.onInputTap,
    this.tec,
    this.keyboardType,
    this.content,
    this.suffix,
    this.centered = false,
    this.formValidator,
    Key key,
  }) : super(key: key);

  final Color iconColor;
  final String labelText;
  final String hintText;
  final bool isReadOnly;
  final Function onInputTap;
  final TextEditingController tec;
  final TextInputType keyboardType;

  //
  final Widget prefix;
  final Widget suffix;

  final Widget content;
  final bool centered;
  final Function(String) formValidator;
  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        //
        // icon ??
        //     Icon(
        //       iconData,
        //       color: iconColor,
        //       size: 20,
        //     ),
        // UiSpacer.horizontalSpace(),

        //
        VStack(
          [
            labelText != null
                ? labelText.text
                    .color(AppColor.primaryColor)
                    .make()
                    .pOnly(right: 41)
                : UiSpacer.emptySpace(),
            content ??
                CustomTextFormField(
                  prefixIcon: prefix.pOnly(
                    bottom: 25,
                  ),
                  hintText: hintText,
                  isReadOnly: isReadOnly,
                  underline: false,
                  onTap: onInputTap,
                  textEditingController: tec,
                  textInputAction: TextInputAction.next,
                  keyboardType: keyboardType,
                  validator: formValidator,
                ),
          ],
        ).expand(),

        //
        suffix ?? UiSpacer.emptySpace(),
      ],
      crossAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.end,
    );
  }
}
