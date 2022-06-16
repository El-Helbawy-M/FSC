import 'package:flutter/material.dart';
import 'package:fuodz/constants/app_routes.dart';
import 'package:fuodz/models/vendor.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fuodz/models/product.dart';
import 'package:fuodz/requests/vendor.request.dart';
import 'package:fuodz/constants/app_strings.dart';
import 'package:fuodz/view_models/base.view_model.dart';
import 'package:velocity_x/velocity_x.dart';

class VendorDetailsViewModel extends MyBaseViewModel {
  //
  VendorDetailsViewModel(
    BuildContext context,
    this.vendor, {
    this.tickerProvider,
  }) {
    this.viewContext = context;
  }

  //
  VendorRequest _vendorRequest = VendorRequest();

  //
  Vendor vendor;
  TickerProvider tickerProvider;
  TabController tabBarController;
  final currencySymbol = AppStrings.currencySymbol;
  int currentPage = 0;
  PageController pageViewController = PageController(initialPage: 0);

  //
  void getVendorDetails() async {
    //
    setBusy(true);

    try {
      vendor = await _vendorRequest.vendorDetails(vendor.id);
      updateUiComponents();
      clearErrors();
    } catch (error) {
      setError(error);
    }
    setBusy(false);
  }

  //
  updateUiComponents() {
    //
    if (!vendor.hasSubcategories) {
      tabBarController = TabController(
        length: vendor.menus.length,
        vsync: tickerProvider,
      );
    } else {
      //nothing to do yet
    }
  }

  void productSelected(Product product) async {
    await viewContext.navigator.pushNamed(
      AppRoutes.product,
      arguments: product,
    );

    //
    notifyListeners();
  }

  onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  //
  onTabChange(int index) {
    currentPage = index;
    pageViewController.animateToPage(
      currentPage,
      duration: Duration(microseconds: 5),
      curve: Curves.bounceInOut,
    );
    notifyListeners();
  }
}
