import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:provider/provider.dart';
import '../controllers/grocery_controller.dart';
//import '../widgets/item_card.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});
  //final List<String> items; // final variable must be initialized

  //InventoryScreen({Key? key, required this.items}) : super(key: key);
  final GroceryController groceryController = Get.find<GroceryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inventory"),
      ),

      //message if the list is empty
      body: Obx(() {
        if (groceryController.groceryList.isEmpty) {
          return Center(
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( 'No items yet!'),
                Text( 'Add groceries to get started'),
              ],
            ),
          );
      }
      
      //show items
      return ListView.builder(itemCount: groceryController.groceryList.length,
      itemBuilder: (context,index) {
        final item = groceryController.groceryList[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text('Quantity: ${item.quantity}'),
          trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            groceryController.removeItem(index);
          
          },
          ),
          );
          },
          );
      }),
        );
  }
}