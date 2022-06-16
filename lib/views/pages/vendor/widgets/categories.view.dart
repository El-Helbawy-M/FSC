import 'package:flutter/material.dart';
import 'package:fuodz/AppIcons/app_icons_icons.dart';
import 'package:fuodz/view_models/vendor/categories.vm.dart';
import 'package:fuodz/widgets/custom_list_view.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fuodz/translations/vendor/categories.i18n.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  Map<String, IconData> categories = {
    "All": AppIcons.fi_rr_subtitles,
    "Entertainment": AppIcons.fi_rr_ice_skate,
    "Food": AppIcons.fi_rr_cream,
    "Electronics": AppIcons.fi_rr_computer,
  };
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      viewModelBuilder: () => CategoriesViewModel(context),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return VStack(
          [
            //
            "Categories".i18n.text.xl.semiBold.make().p12(),

            //categories list
            CustomListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10),
              dataLength: categories.length,
              isLoading: model.isBusy,
              itemBuilder: (context, index) {
                //
                return GestureDetector(
                  onTap: () {
                    // model.categorySelected(Category(name: categories.keys.elementAt(index)));
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                      width: 110,
                      decoration: BoxDecoration(color: (selectedIndex == index) ? Color(0xff00a284) : Colors.grey[100], borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                categories.values.elementAt(index),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(categories.keys.elementAt(index).i18n, maxLines: 1, style: TextStyle(color: (selectedIndex == index) ? Colors.white : Colors.black)),
                          ),
                        ],
                      )
                      // category: model.categories[index],
                      ),
                );
              },
            ).h(Vx.dp64 * 2),
          ],
        );
      },
    );
  }
}
