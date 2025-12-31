import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'controllers/add_item_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future < void > main() async {
    await Hive.initFlutter();
    await Hive.openBox("storage");



//void main()  {
  Get.put(AddItemController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold (
        appBar: AppBar(
          title: Text("A+ Grocery Inventory Manager"),
          centerTitle: true,
        ),
        body: const HomeScreen(),  
      )
    );
}
}