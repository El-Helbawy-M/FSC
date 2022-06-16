import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_images.dart';
import 'package:fuodz/services/validator.service.dart';
import 'package:fuodz/view_models/login.view_model.dart';
import 'package:fuodz/widgets/base.page.dart';
import 'package:fuodz/widgets/buttons/custom_button.dart';
import 'package:fuodz/widgets/custom_text_form_field.dart';

import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/login.i18n.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    print("object");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int y;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return BasePage(
          body: SafeArea(
              child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 130, height: 130, margin: EdgeInsets.symmetric(vertical: 40), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(fit: BoxFit.cover, image: AssetImage(AppImages.app_icon)))),
                    //
                    Image.asset(
                      "assets/images/familystaff.png",
                      scale: 5 / 3.5,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          // "Welcome Back".i18n.text.xl2.semiBold.make(),
                          // "Login to continue".i18n.text.light.make(),

                          //form
                          Form(
                            key: model.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //
                                CustomTextFormField(
                                  labelText: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                  textEditingController: model.emailTEC,
                                  validator: FormValidator.validateEmail,
                                  underline: true,
                                ).py12(),
                                CustomTextFormField(
                                  labelText: "Password".i18n,
                                  obscureText: true,
                                  textEditingController: model.passwordTEC,
                                  validator: FormValidator.validatePassword,
                                  underline: true,
                                ).py12(),
                                //
                                "Forgot Password ?".i18n.text.underline.make().onInkTap(
                                      model.openForgotPassword,
                                    ),
                                //
                              ],
                            ),
                          ).py20(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: CustomButton(
                        color: Color(0xfff1cb37),
                        title: "Login".i18n,
                        loading: model.isBusy,
                        onPressed: model.processLogin,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ).centered().py12(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: ["You don't have an account ? ".i18n.text.make(), InkWell(onTap: () => model.openRegister(), child: "Sign Up".i18n.text.bold.make())],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
