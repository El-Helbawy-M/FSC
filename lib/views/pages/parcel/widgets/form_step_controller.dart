import 'package:flutter/material.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/widgets/buttons/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/new_parcel.i18n.dart';

class FormStepController extends StatelessWidget {
  const FormStepController({
    this.onPreviousPressed,
    this.onNextPressed,
    this.showPrevious = true,
    this.showNext = true,
    this.nextTitle,
    this.nextBtnWidth,
    Key key,
  }) : super(key: key);

  final Function onPreviousPressed;
  final bool showPrevious;
  final Function onNextPressed;
  final bool showNext;
  final String nextTitle;
  final double nextBtnWidth;
  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        //prev
        showPrevious
            ? CustomButton(
                color: Colors.grey[400],
                height: Vx.dp64,
                shapeRadius: 10,
                // height: Vx.dp40,
                child: "PREVIOUS".i18n.text.make().centered(),
                onPressed: onPreviousPressed,
              ).py20().w(context.percentWidth * 35)
            : UiSpacer.emptySpace(),
        showPrevious ? Spacer() : SizedBox(width: 1),
        //next
        showNext
            ? showPrevious
                ? CustomButton(
                    shapeRadius: 10,
                    height: Vx.dp64,
                    title: nextTitle ?? "NEXT".i18n,
                    onPressed: onNextPressed,
                  ).py20().w(nextBtnWidth ?? (context.percentWidth * 35))
                : Center(
                    child: CustomButton(
                      shapeRadius: 10,
                      height: Vx.dp64,
                      title: nextTitle ?? "NEXT".i18n,
                      onPressed: onNextPressed,
                    ).py20().wThreeForth(context),
                  )
            : UiSpacer.emptySpace(),
      ],
      alignment: MainAxisAlignment.center,
    ).wFull(context);
  }
}
