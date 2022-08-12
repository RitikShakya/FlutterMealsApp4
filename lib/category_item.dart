import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({Key? key}) : super(key: key);

  final String id;
  final String title;
  final Color color;

  void selectorControl(BuildContext context){
    Navigator.of(context).pushNamed('/catergoryMealsScreen',arguments: {'id' : id,'title':title});


  }

  CategoryItem(this.id,this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){selectorControl(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(

        padding: EdgeInsets.all(20),
        child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.7),color],begin: Alignment.topLeft,end:Alignment.bottomRight ),
          borderRadius: BorderRadius.circular(15),

        ),
      ),
    );
  }
}
