import 'package:flutter/material.dart';
import 'package:fuodz/requests/auth.request.dart';
import 'package:fuodz/services/auth.service.dart';
import 'package:fuodz/view_models/profile.vm.dart';
import 'package:fuodz/widgets/base.page.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/profile.i18n.dart';

import '../../../AppIcons/app_icons_icons.dart';
import '../../../widgets/buttons/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin<ProfilePage> {
  bool isEditing = false;
  String email = "", phone = "", location = "", language = "";
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        if (!isEditing) {
          phone = model.currentUser.phone;
          location = model.deliveryaddress.address;
          language = (AuthServices.getLocale() == "ar") ? "العربية" : "English";
        }
        if (model.currentUser != null)
          return BasePage(
            body: SafeArea(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    //
                    // "Settings".i18n.text.xl2.semiBold.make(),
                    // "Profile & App Settings".i18n.text.lg.light.make(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: (model.currentUser.photo == null || model.currentUser.photo.isEmpty) ? AssetImage("assets/images/user.png") : NetworkImage(model.currentUser.photo)), shape: BoxShape.circle),
                          ),
                          if (isEditing)
                            Positioned(
                              right: -5,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 1, color: Color(0xfff1cb37)), shape: BoxShape.circle),
                                  child: Icon(Icons.edit, color: Color(0xfff1cb37), size: 20),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        model.currentUser.name,
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                    ),

                    SittingItem("Email", model.currentUser.email, isEditing, (value) {
                      setState(() => email = value);
                    }, Icons.email_outlined),
                    SittingItem("Phone", phone, isEditing, (value) {
                      setState(() => phone = value);
                      print(phone);
                    }, AppIcons.smartphone),
                    SittingItem("Location", "الدمام, شارع الملك فيصل المنطقه الثالثه", false, (value) {
                      setState(() => location = value);
                    }, AppIcons.marker__1_),
                    SittingItem("Language", language, isEditing, (value) {
                      setState(() => language = value);
                    }, AppIcons.fi_rr_subtitles, isLanguage: true),
                    // SittingItem("Profits", "3000", isEditing, (value) {}, Icons.attach_money_outlined),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      child: CustomButton(
                        child: Center(child: Text(isEditing ? "Save" : "Edit")),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Color(0xfff1cb37),
                        onPressed: () async {
                          if (isEditing) {
                            await AuthRequest().updateProfile(email: email, phone: phone);
                            I18n.of(context).locale = Locale(language == "English" ? "en" : "ar");
                            await AuthServices.setLocale(I18n.language);
                          }
                          setState(() {
                            isEditing = !isEditing;
                          });
                        },
                      ),
                    ),
                    if (isEditing)
                      InkWell(
                        onTap: () {
                          setState(() {
                            isEditing = !isEditing;
                          });
                        },
                        child: Text("cansel".i18n, style: TextStyle(color: Colors.red)),
                      )
                    //profile card
                    // ProfileCard(model).py12(),

                    //menu
                    // // VxBox(
                    // //   child: VStack(
                    // //     [
                    // //       //
                    // //       Minu.MenuItem(
                    // //         title: "Notifications".i18n,
                    // //         onPressed: model.openNotification,
                    // //       ),

                    // //       //
                    // //       Minu.MenuItem(
                    // //         title: "Rate & Review".i18n,
                    // //         onPressed: model.openReviewApp,
                    // //       ),

                    // //       //
                    // //       Minu.MenuItem(
                    // //         title: "Verison".i18n,
                    // //         suffix: model.appVersionInfo.text.make(),
                    // //       ),

                    // //       //
                    // //       Minu.MenuItem(
                    // //         title: "Privacy Policy".i18n,
                    // //         onPressed: model.openPrivacyPolicy,
                    // //       ),
                    // //       //
                    // //       Minu.MenuItem(
                    // //         title: "Language".i18n,
                    // //         divider: false,
                    // //         suffix: Icon(
                    // //           FlutterIcons.language_ent,
                    // //         ),
                    // //         onPressed: model.changeLanguage,
                    // //       ),
                    // //     ],
                    // //   ),
                    // // )
                    // //     .border(color: Theme.of(context).cardColor)
                    // //     .color(Theme.of(context).cardColor)
                    // //     .shadow
                    // //     .roundedSM
                    // //     .make(),

                    // // //
                    // "Copyright ©%s %s all right reserved"
                    //     .i18n
                    //     .fill([
                    //       "${DateTime.now().year}",
                    //       AppStrings.companyName,
                    //     ])
                    //     .text
                    //     .center
                    //     .sm
                    //     .makeCentered()
                    //     .py20(),
                  ],
                ).p20().scrollVertical(),
              ),
            ),
          );
        else
          return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SittingItem extends StatelessWidget {
  const SittingItem(
    this.title,
    this.content,
    this.isEditing,
    this.onChange,
    this.icon, {
    this.isLanguage = false,
    Key key,
  }) : super(key: key);
  final String title, content;
  final IconData icon;
  final bool isEditing;
  final Function(String) onChange;
  final bool isLanguage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Icon(icon, color: Color(0xfff1cb37)), SizedBox(width: 10), Text(title.i18n, style: TextStyle(fontSize: 18, color: Color(0xfff1cb37)))],
          ),
          if (isEditing && !isLanguage)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                onChanged: (isLanguage) ? (value) {} : onChange,
                initialValue: content,
              ),
            ),

          if (isEditing && isLanguage)
            DropdownButton<String>(
              value: content,
              items: [
                DropdownMenuItem(child: Text("العربية"), value: "العربية"),
                DropdownMenuItem(child: Text("English"), value: "English"),
              ],
              onChanged: onChange,
              isExpanded: true,
            ),

          // DropdownButton<String>(
          //               items: [
          //                 DropdownMenuItem(child: Text("العربية"), value: "العربية"),
          //                 DropdownMenuItem(child: Text("English"), value: "English"),
          //               ],
          //               icon: Icon(Icons.keyboard_arrow_down_outlined),
          //               onChanged: onChange,
          //             )
          if (!isEditing)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(content, style: TextStyle(color: Colors.grey)),
            ),
          if (!isEditing) Divider(),
        ],
      ),
    );
  }
}
