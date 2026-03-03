import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_item_screen.dart';
import '../controllers/grocery_controller.dart';
import '../widgets/item_card.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});
  final GroceryController groceryController = Get.find<GroceryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inventory"),
      centerTitle: true,),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000), // Max Width Requirement
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Breakpoint: Mobile vs Tablet
              int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;

              return Obx(() {
                if (groceryController.groceryList.isEmpty) {
                  return const Center(child: Text("No items found."));
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: groceryController.groceryList.length,
                  itemBuilder: (context, index) {
                    final item = groceryController.groceryList[index];
                    return GestureDetector(
                      onTap: () => Get.toNamed('/item/$index'), 
                      child: ItemCard(item: item, index: index),
                    );
                  },
                );
              });
            },
          ),
        ),
        ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Get.to(() => const AddItemScreen()),
                child: const Icon(Icons.add),
            ),
      
    );
  }
}


