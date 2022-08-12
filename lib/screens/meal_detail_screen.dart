import 'package:flutter/material.dart';

import 'package:meals_app/dummies/dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {

  Function toggleFav;Function isMealFav;
  MealsDetailScreen(this.toggleFav,this.isMealFav);

  //static const routeName = '/meals_detail';
  @override
  Widget build(BuildContext context) {
    final getArgs = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    final mealId = getArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id==mealId);
    return Scaffold(
        appBar: AppBar(title: Text('Details'),),
        body: SingleChildScrollView(
          child: Column(
            children:[
              Container(
              height: 300,
              width: double.infinity,

              child: Image.network(selectedMeal.imageUrl),
            ),
            SizedBox(height: 10,),
            Text("Ingredents", style: Theme.of(context).textTheme.subtitle1,),
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 250,
              decoration: BoxDecoration(color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.grey)

              ,borderRadius: BorderRadius.all(Radius.circular(20),
                  )

              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5) ,child: Card(color: Theme.of(context).accentColor,child: Text(selectedMeal.ingredients[index])));
                },itemCount: selectedMeal.ingredients.length,


              ),


            ),
              SizedBox(height: 10,),
              Text("Steps", style: Theme.of(context).textTheme.subtitle1,),
            Container(margin: EdgeInsets.all(10),
                height: 150,
                width: 250,
                decoration: BoxDecoration(color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey)

                    ,borderRadius: BorderRadius.all(Radius.circular(20),
                    )

                ),child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile(leading: CircleAvatar(child:Text('${index+1}'),backgroundColor: Theme.of(context).primaryColor),title: Text(selectedMeal.steps[index],),);
              },itemCount: selectedMeal.steps.length,
              )
              ,),
              
            ]
                ,

          ),


        ),

        floatingActionButton:
        FloatingActionButton(onPressed: (){toggleFav(mealId);},child:  isMealFav(mealId) ?  Icon(Icons.star,):Icon(Icons.star_border,) )
    );
  }
}
