import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../controllers/item_controller.dart';
import '../widgets/item_card.dart';

class InventoryScreen extends StatelessWidget {
  final List<String> items; // final variable must be initialized

  InventoryScreen({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inventory")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(title: Text(item));
        },
      ),
    );
  }
}
