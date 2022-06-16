import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/vendor.vm.dart';
import 'package:fuodz/views/pages/vendor/widgets/banners.view.dart';
import 'package:fuodz/views/pages/vendor/widgets/best_selling_products.view.dart';
import 'package:fuodz/views/pages/vendor/widgets/categories.view.dart';
import 'package:fuodz/views/pages/vendor/widgets/for_you_products.view.dart';
import 'package:fuodz/translations/vendor/categories.i18n.dart';
import 'package:fuodz/views/pages/vendor/widgets/top_vendors.view.dart';
import 'package:fuodz/widgets/base.page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({Key key}) : super(key: key);

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> with AutomaticKeepAliveClientMixin<VendorPage> {
  GlobalKey pageKey = GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasePage(
      key: pageKey,
      body: ViewModelBuilder<VendorViewModel>.reactive(
        viewModelBuilder: () => VendorViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: VStack(
              [
                //
                // VendorHeader(model: model),

                SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: false,
                  controller: model.refreshController,
                  onRefresh: () {
                    model.refreshController.refreshCompleted();
                    setState(() {
                      pageKey = GlobalKey<State>();
                    });
                  }, // model.reloadPage,
                  child: VStack(
                    [
                      //
                      Banners(),
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search here......".i18n,
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    prefixIcon: Icon(Icons.search),
                                    suffixIcon: Container(
                                      width: 35,
                                      margin: EdgeInsets.all(17),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/filter.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Categories(),

                      //best selling
                      BestSellingProducts(),

                      //For you
                      ForYouProducts(),

                      //nearby vendors
                      // AppStrings.enableSingleVendor ? UiSpacer.emptySpace() : NearByVendors(),
                      //
                      AppStrings.enableSingleVendor ? UiSpacer.verticalSpace() : TopVendors(),
                    ],
                  ).scrollVertical(),
                ).expand(),
              ],
              // key: model.pageKey,
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
