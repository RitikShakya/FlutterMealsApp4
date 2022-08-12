import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'dummies/dummy_data.dart';
import 'modals/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String,bool> filters={
   'gluten': false,
   'vegan':false,
   'veg': false,
   'lactose':false


  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouritesList =[];

  void setFilters(Map<String,bool> filterMap){
    setState((){
      filters =filterMap;
      availableMeals=DUMMY_MEALS.where((element) {
        if(filters['gluten'] as bool&& !element.isGlutenFree){
          return false;
        }

        if(filters['vegan'] as bool&& !element.isVegan){
          return false;
        }

        if(filters['veg']as bool && !element.isVegetarian){
          return false;
        }

        if(filters['lactose'] as bool&& !element.isLactoseFree){
          return false;
        }

        return true;
      }).toList();

    });

  }

  void toggleFavourite(String mealId){
    final index = favouritesList.indexWhere((element) => mealId==element.id);
    
    if(index>=0){
      setState((){
        favouritesList.removeAt(index);
      });
          
    }else{
      setState((){
        favouritesList.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      });
    }

  }

  bool isMealFav(String id){
    return favouritesList.any((element) => element.id==id);
  }


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(

        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 255, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
            color: Colors.red
          )
        )
      ),
      home:  TabsScreen(favouritesList),
      routes: {
        '/meals_detail' : (ctx) => MealsDetailScreen(toggleFavourite,isMealFav),
        '/catergoryMealsScreen' : (ctx) => CategoryMealsScreen(availableMeals),
        '/filters_screen' : (ctx) => FiltersScreen(filters,setFilters)
      },
    );
  }
}

