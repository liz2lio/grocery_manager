import 'package:flutter/material.dart';
import 'inventory_screen.dart';
import 'package:get/get.dart';
import 'add_item_screen.dart';
import 'stats_screen.dart';


class HomeScreen extends StatelessWidget {
   const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
  
 //MediaQuery to get screen info
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600; //breakpoint

    return Center(
      //maxWidth constraint
      child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Select how you want to manage your inventory",
              textAlign: TextAlign.center,),
              
              SizedBox(height:40), //spacing

              isTablet
                ? Column(mainAxisAlignment: MainAxisAlignment.center,
                children:  _buttons(), 
               )
                : Column (
                children:  _buttons(),
                )
       
          ],
          ),
        ),
        ),
      );
} 
List <Widget> _buttons() {  
          return [
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

            SizedBox(height:20), //spacing

             ElevatedButton(
              onPressed: () { 
                Get.to(() => StatsScreen());
                },
                child: Text("View Stats"), //Go to InventoryScreen
            ),
            ];
          }
}