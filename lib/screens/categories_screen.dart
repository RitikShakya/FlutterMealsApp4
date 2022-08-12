import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/dummies/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  //const CategoryScreen({Key? key}) : super(key: key);

  // final String title;
  //
  // CategoryScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(12),
      child: GridView(children: DUMMY_CATEGORIES.map((e) {
        return CategoryItem(e.id,e.title, e.color);
      }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,childAspectRatio: 3/2,mainAxisSpacing: 20,crossAxisSpacing: 20),

      ),
    );

  }
}
