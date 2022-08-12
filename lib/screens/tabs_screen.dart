import 'package:flutter/material.dart';
import 'package:meals_app/drawer.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

import '../modals/meals.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  //const TabsScreen({Key? key}) : super(key: key);

  List<Meal> favouriteList;
  TabsScreen(this.favouriteList);


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  late List<Map<String,Object>> pages;
  int selectedPageIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    pages=[{'page':CategoryScreen(),'title':'Meals'},
    {'page':Favourite(widget.favouriteList),'title':'Favourite'},];
    super.initState();
  }



  void selectedIndex(int index){
    setState((){
      selectedPageIndex= index;
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'] as String),),
      drawer: DrawerData(),
      body: pages[selectedPageIndex]['page'] as Widget ,
      bottomNavigationBar:
      BottomNavigationBar(items: [


        BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favourites")

      ],currentIndex: selectedPageIndex,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      backgroundColor: Theme.of(context).primaryColor,
      onTap: selectedIndex),


    );
  }
}
