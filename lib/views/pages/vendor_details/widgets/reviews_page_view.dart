import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../models/vendor.dart';

class Reviews extends StatelessWidget {
  List list = [
    {
      "name": "Anas Taha",
      "rate": 4.3,
      "description": "my Disc",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV7sChop8HQytOtkGQUf3JfaZ2K8ScJxjreg&usqp=CAU",
      "date": DateTime(2000, 9, 5)
    },
    {
      "name": "Anas Taha",
      "rate": 4.3,
      "description": "my Disc",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRplemEtGrHCxGUTITR_64HFTrqnNsSkwfOmw&usqp=CAU",
      "date": DateTime(2000, 9, 5)
    },
    {
      "name": "Anas Taha",
      "rate": 5,
      "description": "my Disc",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV7sChop8HQytOtkGQUf3JfaZ2K8ScJxjreg&usqp=CAU",
      "date": DateTime(2000, 9, 5)
    },
    {
      "name": "Anas Taha",
      "rate": 4.3,
      "description": "my Disc",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBLq94jSrrW2e3_jpucwE90GNFv5c1qUqdWw&usqp=CAU",
      "date": DateTime(2000, 9, 5)
    },
    {
      "name": "Anas Taha",
      "rate": 3.3,
      "description": "my Disc",
      "pic":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC0QmHF3eJ2ewN9CgeSr_2X4-aKdGyj6pziQ&usqp=CAU",
      "date": DateTime(2000, 9, 5)
    },
  ];
  Reviews({this.model, Key key}) : super(key: key);
  Vendor model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  minVerticalPadding: 10,
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(list[index]["pic"]),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index]["name"]),
                      Row(
                        children: [
                          for (int i = 0; i < list[index]['rate'].toInt(); i++)
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 16,
                            ),
                          Text(
                            list[index]['rate'].toString(),
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  subtitle: Text(list[index]["description"]),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (Jiffy(list[index]['date'])
                            .yMMMMd
                            .i18n // October 18, 2019
                        ),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 80),
                  child: Divider(
                    thickness: 1,
                    height: 10,
                  ),
                ),
              ],
            ),
        itemCount: list.length);
  }
}
