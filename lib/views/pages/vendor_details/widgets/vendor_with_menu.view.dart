import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fuodz/models/vendor.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/vendor_details.vm.dart';
import 'package:fuodz/views/pages/vendor_details/widgets/about_page_view.dart';
import 'package:fuodz/views/pages/vendor_details/widgets/reviews_page_view.dart';
import 'package:fuodz/views/pages/vendor_details/widgets/vendor_details_header.view.dart';
import 'package:fuodz/widgets/busy_indicator.dart';
import 'package:fuodz/widgets/custom_list_view.dart';
import 'package:fuodz/widgets/list_items/horizontal_product.list_item.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:jiffy/jiffy.dart';

import 'menu_page_view.dart';

class VendorDetailsWithMenuPage extends StatefulWidget {
  VendorDetailsWithMenuPage({this.vendor, Key key}) : super(key: key);

  final Vendor vendor;

  @override
  _VendorDetailsWithMenuPageState createState() =>
      _VendorDetailsWithMenuPageState();
}

class _VendorDetailsWithMenuPageState extends State<VendorDetailsWithMenuPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VendorDetailsViewModel>.reactive(
      viewModelBuilder: () =>
          VendorDetailsViewModel(context, widget.vendor, tickerProvider: this),
      onModelReady: (model) {
        model.tabBarController = TabController(length: 3, vsync: this);
        model.getVendorDetails();
      },
      builder: (context, model, child) {
        return Column(
          children: [
            //
            SizedBox(
              height: 340,
              child: VendorDetailsHeader(model),
            ),

            Container(
              height: 30,
              child: BottomNavigationBar(
                  selectedItemColor:
                      Theme.of(context).textTheme.bodyText1.color,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  iconSize: 0,
                  backgroundColor: Theme.of(context).backgroundColor,
                  elevation: 0,
                  currentIndex: model.currentPage,
                  onTap: model.onTabChange,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.space_bar),
                      label: 'Menu',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart),
                      label: 'Reviews',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'About',
                    ),
                  ]),
            ).expand(),

            PageView(
              onPageChanged: model.onPageChanged,
              controller: model.pageViewController,
              children: [
                Menu(model: model.vendor),
                Reviews(model: model.vendor),
                About(model: model.vendor),
              ],
            ).expand(flex: 5),
          ],
        );
      },
    );
  }
}
