import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Center(
      child: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Select how you want to manage your inventory",
          textAlign: TextAlign.center,),

          SizedBox(height:40), //spacing

          ElevatedButton(
            onPressed: () {},
            child: Text("Restock"), //Go to EditScreen
          )
          ]
      )
    );
  }
}