import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BannerListItem extends StatelessWidget {
  const BannerListItem({
    this.imageUrl,
    this.onPressed,
    this.text,
    Key key,
  }) : super(key: key);

  final String imageUrl;
  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xfff1cb37)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: this.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Image.asset(
            "assets/images/Flash Sale.png",
            scale: 5 / 3,
          ),
          // .onInkTap(this.onPressed)
          // .box
          // .roundedSM
          // .clip(Clip.antiAlias)
          // .margin(
          //   EdgeInsets.symmetric(horizontal: 5.0),
          // )
          // .make(),
        ],
      ),
    );
  }
}
