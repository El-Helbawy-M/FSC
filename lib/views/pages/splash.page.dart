import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_images.dart';
import 'package:fuodz/view_models/splash.vm.dart';
import 'package:fuodz/widgets/base.page.dart';
import 'package:stacked/stacked.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 7), () {
      SplashViewModel(context).initialise();
    });
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(width: 120, height: 120, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/logo.png")), borderRadius: BorderRadius.circular(15)), margin: EdgeInsets.only(bottom: 20)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 130.0,
                  width: 130.0,
                ),
              ),
            ),
            Image.asset(
              "assets/images/familystaff.png",
              scale: 5 / 3.5,
            ),
          ],
        ),
      ),
    );
  }
}

// VStack(
//             [
//               //
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), image: DecorationImage(image: AssetImage("assets/images/logo.png"))),
//               ),
//               Image.asset("assets/images/familystaff.png")
//             ],
//           ).centered()