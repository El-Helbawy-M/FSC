import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fuodz/utils/ui_spacer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../models/vendor.dart';

class Menu extends StatelessWidget {
  Menu({this.model, Key key}) : super(key: key);

  final Vendor model;

  List list = [
    {
      "name": "Cheese Burger",
      "category": "Fast Food",
      "price": "₹ 100",
      "pic":
          "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2021%2F08%2F17%2Fcrispy-comte-cheesburgers-FT-RECIPE0921.jpg&q=60",
    },
    {
      "name": "Pizza",
      "category": "Fast Food",
      "price": "₹ 100",
      "pic":
          "https://img.freepik.com/free-photo/mixed-pizza-with-various-ingridients_140725-3790.jpg?w=2000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    log(model.menus.length.toString());
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          ListTile(
            minVerticalPadding: 10,
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    list[index]["pic"],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Here is the code for the title of the list item
            title: Text(model.menus[index].products[index].name,
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyText1.color)),
            // Here is the code for the subtitle of the list item

            subtitle: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Here is the description of the product
                  Text(list[index]["category"],
                      style: TextStyle(fontSize: 12, color: Colors.grey)),

                  // Here is Price
                  Row(
                    children: [
                      Text(list[index]["price"],
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color)),
                      SizedBox(width: 3),
                      Icon(
                        Icons.wallet,
                        size: 15,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add,
                          size: 18,
                          color: Theme.of(context).backgroundColor,
                        ).onTap(() {
                          // on adding item to cart
                          log("add");
                        }),
                        // number of items in cart
                        Text(
                          "0",
                          style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).backgroundColor),
                        ),
                        Icon(
                          Icons.remove,
                          size: 18,
                          color: Theme.of(context).backgroundColor,
                        ).onTap(() {
                          // on remove item from cart
                          log("remove");
                        }),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
          ),
        ],
      ),
      itemCount: model.menus.length,
    );
  }
}
