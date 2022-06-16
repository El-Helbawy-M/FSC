import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:i18n_extension/default.i18n.dart';

import '../../../../models/vendor.dart';

class About extends StatelessWidget {
  About({this.model, Key key}) : super(key: key);

  Vendor model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ListTile(
          leading:
              Icon(Icons.access_alarm, color: Theme.of(context).primaryColor),
          title: Text(
            "Appointments".i18n,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          subtitle: Text("مفتوح  12:00 - 23:00",
              style: TextStyle(textBaseline: TextBaseline.alphabetic)),
        ),
        ListTile(
          leading: Icon(Icons.mobile_friendly,
              color: Theme.of(context).primaryColor),
          title: Text(
            "Phone".i18n,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          subtitle: Text(model.phone,
              style: TextStyle(textBaseline: TextBaseline.alphabetic)),
        ),
        ListTile(
          leading: Icon(Icons.pin_drop, color: Theme.of(context).primaryColor),
          title: Text(
            "Location".i18n,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          subtitle: Text(model.address,
              style: TextStyle(textBaseline: TextBaseline.alphabetic)),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            height: 200,
            child: GoogleMap(
              markers: Set.from([
                Marker(
                  markerId: MarkerId("1"),
                  position: LatLng(double.parse(model.latitude.toString()),
                      double.parse(model.longitude.toString())),
                ),
              ]),
              initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(model.latitude.toString()),
                    double.parse(model.longitude.toString())),
                zoom: 15,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
