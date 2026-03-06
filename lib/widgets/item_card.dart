import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/grocery_item.dart';
import '../controllers/grocery_controller.dart';

class ItemCard extends StatelessWidget {
  final GroceryItem item;
  final int index;

  //constructor
  const ItemCard ( {
    super.key,
    required this.item,
    required this.index,
    }
  );

  @override
  Widget build(BuildContext context) {
    final GroceryController groceryController = Get.find<GroceryController>();


    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal:12, vertical:6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack (
        children: [
          Center(
            child: Padding (
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.name, 
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines:4,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height:6),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 18,
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => groceryController.decrementQuantity(index),
                    ),
                    
                    // Obx listens to the specific item index for changes
                    Obx(() => Text(
                      '${groceryController.groceryList[index].quantity}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                    
                    IconButton(
                      iconSize: 18,
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => groceryController.incrementQuantity(index),
                    ),
                  ],
                ),

              ],),),),

            //delete item
              Positioned(
                bottom: 4,
                right: 4,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent, size:20),
                  onPressed:() {
                    groceryController.removeItem(index);},
                  ),
                ), 
              ],
            ),
    );
  }
}
