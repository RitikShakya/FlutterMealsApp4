import 'package:flutter/material.dart';

class DrawerData extends StatelessWidget {
  const DrawerData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.amber,
            alignment: Alignment.center,
            child: Text('C o o k i n g   U p !', style: Theme.of(context).textTheme.subtitle1,),
            

          ),
          SizedBox(height: 20,),
          ListTile(leading: Icon(Icons.set_meal_outlined,size: 26,) , title: Text("Meals",style: TextStyle(fontFamily: 'RobotoCondesed',fontWeight: FontWeight.bold,fontSize: 25),),onTap: (){Navigator.of(context).pushReplacementNamed('/');}, ),
          SizedBox(height: 20,),
          ListTile(leading: Icon(Icons.settings,size: 26,) , title: Text("Filters",style: TextStyle(fontFamily: 'RobotoCondesed',fontWeight: FontWeight.bold,fontSize: 25)),onTap:(){Navigator.of(context).pushReplacementNamed('/filters_screen');} ,)
        ],
      ),
    );
  }
}
