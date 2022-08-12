import 'package:flutter/material.dart';
import 'package:meals_app/modals/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;

  String get complexityData{
    switch(complexity){
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'HArd';
        break;
      default :
        return 'UnKnown';
    }

  }


  String get affordabilityData{
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default :
        return 'UnKnown';
    }

  }
  MealItem({required this.duration,required this.title,required this.categories,required this.imageUrl,required this.complexity,required this.affordability,required this.id});

  void selectMeal(BuildContext context){

    Navigator.of(context).pushNamed('/meals_detail', arguments: {'id': id} );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){selectMeal(context);},

        child : Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
                  child: Image.network(imageUrl, width: double.infinity,height: 250,fit: BoxFit.cover,),
                ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black54),
                   // margin: EdgeInsets.only(top: 25, left: 25),

                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(title ,style:TextStyle(color: Colors.white,fontSize: 20),
                ),
                    )),
              )
              ],

            ),


           Padding(
             padding: EdgeInsets.all(10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Row(
                   children: [
                     Icon(Icons.schedule),
                     SizedBox(width: 5),
                     Text('${duration} min')

                   ],
                 ),

                 Row(
                   children: [
                     Icon(Icons.work),
                     SizedBox(width: 5),
                     Text('${complexityData} ')

                   ],
                 ),

                 Row(
                   children: [
                     Icon(Icons.wallet),
                     SizedBox(width: 5),
                     Text('${affordabilityData} ')

                   ],
                 )
               ],
             ),
           )
          ],
        ),
      )
    );
  }
}
