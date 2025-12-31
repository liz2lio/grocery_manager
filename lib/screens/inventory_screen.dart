import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:provider/provider.dart';
import '../controllers/add_item_controller.dart';
//import '../widgets/item_card.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});
  //final List<String> items; // final variable must be initialized

  //InventoryScreen({Key? key, required this.items}) : super(key: key);
  final AddItemController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inventory")),
      body: Obx (() => ListView.builder(
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          return ListTile(title: Text(item.name),
          trailing: Text('Qty: ${item.quantity}'),
          );
        },
      ),
    ),
    );
  }
}
