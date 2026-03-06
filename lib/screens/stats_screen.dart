import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/grocery_controller.dart';


class StatsScreen extends StatelessWidget {
  final GroceryController groceryController = Get.find<GroceryController>();
  StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // mediaQuery to check screen
    double screenWidth = MediaQuery.of(context).size.width;
    bool isWide = screenWidth > 600; // Breakpoint: Mobile vs Tablet

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Stats"),
        centerTitle: true),
      body: Obx(() {
        // Calculate items
        int totalItems = groceryController.groceryList.length;
    int totalQuantity = groceryController.groceryList.fold(
      0, (sum, item) => sum + item.quantity);

        return Center(
          child: ConstrainedBox(
            // maximum width limit
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: isWide 
                ? Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statsCard("Total Unique Items", totalItems.toString(), Colors.blue),
                      _statsCard("Total Stock Quantity", totalQuantity.toString(), Colors.green),
                    ],
                  )
                : Column( // Mobile Layout
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _statsCard("Total Unique Items", totalItems.toString(), Colors.blue),
                      const SizedBox(height: 20),
                      _statsCard("Total Stock Quantity", totalQuantity.toString(), Colors.green),
                    ],
                  ),
            ),
          ),
        );
      }),
    );
  }


  // card widget
  Widget _statsCard(String title, String value, Color color) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: color.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    ); 
  }
}
