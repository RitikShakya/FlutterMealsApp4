import 'package:flutter/material.dart';
import 'package:meals_app/drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({Key? key}) : super(key: key);
  final Map<String,bool> filters;
  final Function setFilters;
  const FiltersScreen(this.filters, this.setFilters);


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   bool isGlutenFree= false;
   bool isVegan= false;
   bool isVegetarian= false;
   bool isLactoseFree=false;


  //
   @override
  void initState() {

     isGlutenFree= widget.filters['gluten'] as bool;
     isVegan=widget.filters['vegan'] as bool;
         isVegetarian=widget.filters['veg'] as bool;
         isLactoseFree=widget.filters['lactose']  as bool;



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'),
      actions: [
        IconButton(onPressed: (){
          final filtersMap={
            'gluten': isGlutenFree,
            'vegan':isVegan,
            'veg': isVegetarian,
            'lactose':isLactoseFree
          };widget.setFilters(filtersMap);}, icon: Icon(Icons.save)),

      ],
      ),
      drawer: DrawerData(),
      body: Column(
        children: [

          Container(
            margin: EdgeInsets.all(15),
            height: 50,
            width: double.infinity,
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text('Adjus Your Meals', style: TextStyle(fontSize: 25,),),
          ),
          Expanded(child: ListView(
            children: [
              SwitchListTile(title: Text('Is Gluteen Free'),subtitle: Text('only include gluteen free meals'),value: isGlutenFree, onChanged: (setValue){
                setState((){
                  isGlutenFree= setValue;
                });
              }),
              SizedBox(height: 10,)
              , SwitchListTile(title: Text('Is Vegan '),subtitle: Text('only include vegan meals'),value: isVegan, onChanged: (setValue){
                setState((){
                  isVegan= setValue;
                });
              }),
              SizedBox(height: 10,),
              SwitchListTile(activeColor: Theme.of(context).accentColor,title: Text('Is Vegetarina'),subtitle: Text('only include vegetarian meals'),value: isVegetarian, onChanged: (setValue){
                setState((){
                  isVegetarian= setValue;
                });
              }),SizedBox(height: 10,)
              , SwitchListTile(title: Text('Is Lactose Free'),subtitle: Text('only include lactose free meals'),value: isLactoseFree, onChanged: (setValue){
                setState((){
                  isLactoseFree= setValue;
                });
              })


            ],

          ))

        ],
      ),
    );
  }
}
