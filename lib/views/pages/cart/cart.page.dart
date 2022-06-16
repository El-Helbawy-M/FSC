import 'package:flutter/material.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:fuodz/view_models/cart.vm.dart';
import 'package:fuodz/views/pages/cart/widgets/amount_tile.dart';
import 'package:fuodz/views/pages/cart/widgets/apply_coupon.dart';
import 'package:fuodz/widgets/base.page.dart';
import 'package:fuodz/widgets/buttons/custom_button.dart';
import 'package:fuodz/widgets/custom_list_view.dart';
import 'package:fuodz/widgets/list_items/cart.list_item.dart';
import 'package:fuodz/widgets/states/cart.empty.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fuodz/translations/cart.i18n.dart';

import '../../../constants/app_colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(context),
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return BasePage(
            body: SafeArea(
                child: VStack(
              [
                //title
                "The Placed Items".i18n.text.xl.make().pOnly(bottom: Vx.dp10),
                //
                if (model.cartItems.isEmpty)
                  EmptyCart().centered().expand()
                else
                  VStack(
                    [
                      //cart items list
                      UiSpacer.verticalSpace(),
                      CustomListView(
                        noScrollPhysics: true,
                        dataLength: model.cartItems.length,
                        itemBuilder: (context, index) {
                          //
                          final cart = model.cartItems[index];
                          return CartListItem(
                            cart,
                            onQuantityChange: (qty) => model.updateCartItemQuantity(qty, index),
                            deleteCartItem: () => model.deleteCartItem(index),
                          );
                        },
                        separatorBuilder: (context, index) => UiSpacer.divider(height: 20).pOnly(top: 30, bottom: 15),
                      ),

                      //
                      UiSpacer.divider(height: 20).pOnly(top: 30),
                      ApplyCoupon(model),
                      UiSpacer.verticalSpace(),
                      // AmountTile(
                      //     "Total Item".i18n, model.totalCartItems.toString()),
                      AmountTile("Sub-Total".i18n, "${model.currencySymbol} ${model.subTotalPrice.numCurrency}"),
                      // AmountTile("Delivery Fee".i18n,
                      //     "${model.currencySymbol} ${model.deliveryFee.numCurrency}"),
                      AmountTile("Tax".i18n,
                          "${model.currencySymbol} ${'0.00'.numCurrency}"),
                      AmountTile("Discount".i18n,
                          "${model.currencySymbol} ${model.discountCartPrice.numCurrency}"),

                      UiSpacer.verticalSpace(),
                      HStack([
                        "Total".i18n.text.lg.semiBold.make().expand(),
                        UiSpacer.horizontalSpace(),
                        "${model.currencySymbol} ${model.totalCartPrice.numCurrency}".text.color(AppColor.primaryColor).xl4.extraBold.make(),
                      ]).p4(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            title: "Complete Order".i18n,
                            onPressed: model.checkoutPressed,
                            shapeRadius: 15,
                          ).h(Vx.dp56).wTwoThird(context).pOnly(top: 30),
                        ],
                      ).wFull(context)
                      //
                    ],
                  ).scrollVertical().expand(),
              ],
            ).p20()),
          );
        });
  }
}
