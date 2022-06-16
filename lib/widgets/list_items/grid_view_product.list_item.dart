import 'package:flutter/material.dart';
import 'package:fuodz/AppIcons/app_icons_icons.dart';
import 'package:fuodz/models/product.dart';
import 'package:fuodz/widgets/custom_image.view.dart';
import 'package:velocity_x/velocity_x.dart';

class GridViewProductListItem extends StatelessWidget {
  const GridViewProductListItem({this.product, this.onPressed, @required this.qtyUpdated, Key key}) : super(key: key);

  final Function(Product) onPressed;
  final Function(Product, int) qtyUpdated;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        //product image
        Hero(
          tag: product.heroTag,
          child: CustomImage(
            imageUrl: product.photo,
            boxFit: BoxFit.cover,
            width: 80,
            height: 80,
          ).card.rounded.make(),
        ),

        //price
        // HStack(
        //   [
        //     AppStrings.currencySymbol.text.white.make(),
        //     product.showDiscount
        //         ? "${product.price}"
        //             .text
        //             .sm
        //             .lineThrough
        //             .white
        //             .make()
        //             .px2()
        //         : "${product.price}".text.xl.white.make(),
        //     // discount price
        //     product.showDiscount
        //         ? "${product.discountPrice}".text.xl.white.make()
        //         : UiSpacer.emptySpace(),
        //   ],
        // ).py4().box.px8.rounded.color(AppColor.primaryColor).make(),

        //
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product.name.text.semiBold.xl.maxLines(1).overflow(TextOverflow.ellipsis).make(),
              "البائع - ${product.vendor.name}".text.color(Colors.grey).sm.maxLines(1).overflow(TextOverflow.ellipsis).make(),
              Row(
                children: [
                  "${product.price}\$".text.color((!product.showDiscount) ? Colors.green : Colors.red).sm.make(),
                  " / ".text.sm.make(),
                  "${(product.showDiscount) ? "${product.price - product.discountPrice}\$   After discount" : "No discount"}".text.color((product.showDiscount) ? Colors.green : Colors.black).sm.make(),
                ],
              ),
            ],
          ),
        ),

        // plus/min icon here
        // ProductStockState(product, qtyUpdated: qtyUpdated),
      ],
    ).box.p4.color(Colors.transparent).make().onInkTap(
          () => this.onPressed(this.product),
        );
  }
}

class GridViewResturantListItem extends StatelessWidget {
  const GridViewResturantListItem({this.product, this.onPressed, @required this.qtyUpdated, Key key}) : super(key: key);

  final Function(Product) onPressed;
  final Function(Product, int) qtyUpdated;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 260,
        child: Column(
          children: [
            //
            //product image
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Hero(
                    tag: product.heroTag,
                    child: Container(
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/images/R.jpg")), borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Icon(AppIcons.star), Text("4.2")],
                      ),
                    ),
                  )
                ],
              ),
            ),

            //price
            // HStack(
            //   [
            //     AppStrings.currencySymbol.text.white.make(),
            //     product.showDiscount
            //         ? "${product.price}"
            //             .text
            //             .sm
            //             .lineThrough
            //             .white
            //             .make()
            //             .px2()
            //         : "${product.price}".text.xl.white.make(),
            //     // discount price
            //     product.showDiscount
            //         ? "${product.discountPrice}".text.xl.white.make()
            //         : UiSpacer.emptySpace(),
            //   ],
            // ).py4().box.px8.rounded.color(AppColor.primaryColor).make(),

            //
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "مطعم الغازي".text.semiBold.xl.maxLines(1).overflow(TextOverflow.ellipsis).make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "اطعمه جاهزه - بيتزا".text.color(Colors.grey).sm.maxLines(1).overflow(TextOverflow.ellipsis).make(),
                        Row(
                          children: [
                            "50-16\$".text.sm.make(),
                            Icon(
                              AppIcons.icon_ionic_ios_wallet,
                              color: Colors.yellow,
                              size: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // plus/min icon here
            // ProductStockState(product, qtyUpdated: qtyUpdated),
          ],
        ).card.elevation(5).rounded.p4.color(Colors.white).make().onInkTap(
              () => this.onPressed(this.product),
            ),
      ),
    );
  }
}
