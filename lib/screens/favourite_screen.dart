import 'package:flutter/material.dart';

import '../meal_item.dart';
import '../modals/meals.dart';

class Favourite extends StatelessWidget {
  //const Favourite({Key? key}) : super(key: key);
  List<Meal> favouriteList;

  Favourite(this.favouriteList);
  @override
  Widget build(BuildContext context) {
    if(favouriteList.isEmpty){
      return Center(child: Text('No Favourite meals assigned'),);
    }else {
      return
      ListView.builder(itemBuilder: (context, index) {
        return MealItem(duration: favouriteList[index].duration,title: favouriteList[index].title, categories: favouriteList[index].categories, imageUrl: favouriteList[index].imageUrl, complexity: favouriteList[index].complexity, affordability: favouriteList[index].affordability, id: favouriteList[index].id);
      },itemCount: favouriteList.length);
    }
  }
}
