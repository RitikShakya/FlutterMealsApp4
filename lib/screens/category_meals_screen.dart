import 'package:flutter/material.dart';

import 'package:meals_app/dummies/dummy_data.dart';
import 'package:meals_app/meal_item.dart';

import '../modals/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  //const CategoryMealsScreen({Key? key}) : super(key: key);
  List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {

    var getArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;

    var getId = getArgs['id'];
    var getTitile = getArgs['title'];

    final categoryMeal = widget.availableMeals.where((element)  {

      return element.categories.contains(getId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Recipes')),
      body: ListView.builder(itemBuilder: (context, index) {
          return MealItem(duration: categoryMeal[index].duration,title: categoryMeal[index].title, categories: categoryMeal[index].categories, imageUrl: categoryMeal[index].imageUrl, complexity: categoryMeal[index].complexity, affordability: categoryMeal[index].affordability, id: categoryMeal[index].id);
        },itemCount: categoryMeal.length,)
      );
  }
}
