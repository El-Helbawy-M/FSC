import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:fuodz/constants/app_colors.dart';
import 'package:fuodz/widgets/busy_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomWebviewPage extends StatefulWidget {
  const CustomWebviewPage({
    Key key,
    this.selectedUrl,
  }) : super(key: key);

  final String selectedUrl;

  @override
  State<CustomWebviewPage> createState() => _CustomWebviewPageState();
}

class _CustomWebviewPageState extends State<CustomWebviewPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Platform.supportsSimd) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.selectedUrl,
      // appBar: new AppBar(
      //   leading: IconButton(
      //     icon: Icon(
      //       FlutterIcons.arrow_left_fea,
      //       color: Colors.white,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      javascriptMode: JavascriptMode.disabled,
      zoomEnabled: true,
      // withJavascript: true,
      // withLocalStorage: true,
      // withLocalUrl: true,
      // initialChild: BusyIndicator(
      //   color: AppColor.primaryColor,
      // ).centered(),
    );
  }
}
