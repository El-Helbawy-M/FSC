import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:fuodz/services/firebase.service.dart';
import '../../constants/app_routes.dart';
import '../../services/auth.service.dart';
import '../../widgets/buttons/custom_button.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LanguageSelectorScreen extends StatefulWidget {
  const LanguageSelectorScreen({Key key}) : super(key: key);

  @override
  State<LanguageSelectorScreen> createState() => _LanguageSelectorScreenState();
}

class _LanguageSelectorScreenState extends State<LanguageSelectorScreen> {
  String code = "en";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(child: Center(child: Text("Chose the app language\nاختر لغة التطبيق", textAlign: TextAlign.center))),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => code = "en"),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: (code == 'en') ? 2 : 0, color: Colors.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  height: 150,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/united-kingdom.png")), borderRadius: BorderRadius.circular(15)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text("English"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => code = "ar"),
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: (code == 'ar') ? 2 : 0, color: Colors.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  height: 150,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/saudi-arabia.png")), borderRadius: BorderRadius.circular(15)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text("اللغة العربية"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    title: (code == "en") ? "Next" : "التالي",
                    onPressed: () async {
                      I18n.of(context).locale = Locale(code ?? "en");
                      await AuthServices.setLocale(I18n.language);
                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcomeRoute, (route) => false);
                      RemoteMessage initialMessage = await FirebaseService.firebaseMessaging.getInitialMessage();
                      if (initialMessage != null) {
                        //
                        FirebaseService.saveNewNotification(initialMessage);
                        FirebaseService.selectNotification('');
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
