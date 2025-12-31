import 'package:flutter/material.dart';
import 'package:grocery_manager/screens/add_item_screen.dart';
import 'package:grocery_manager/screens/inventory_screen.dart';
import 'package:get/get.dart';
//import 'screens/add_item_screen.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
  
   //final List<String> myItems = ['Apple', 'Bread', 'Milk'];
   //final List<String> myItems = [];
   
    return Center(
      child: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Select how you want to manage your inventory",
          textAlign: TextAlign.center,),

          SizedBox(height:40), //spacing

          ElevatedButton(
            onPressed: () {
              Get.to(() => AddItemScreen());
            },
            child: Text("Add New Item"), //Go to add_item_screen
          ),

          SizedBox(height:20), //spacing

         
          ElevatedButton(
            onPressed: () {
              Get.to(() => InventoryScreen());
            },
            child: Text("View All Items"), //Go to InventoryScreen
          ),
        ]
      )
    );
  }
}