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
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines:4,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height:4),
                
                // quantity
                Text(
                  'Qty: ${item.quantity}', 
                  style: TextStyle(
                    fontSize:16, 
                    fontWeight: FontWeight.w500)),
              ],),),),

            //delete item
              Positioned(
                bottom: 4,
                right: 4,
                child: IconButton(
                  //constraints: const BoxConstraints(),
                  //padding: EdgeInsets.zero,
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
