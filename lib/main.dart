import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
//import 'controllers/add_item_controller.dart';
//import 'package:hive_ce_flutter/hive_flutter.dart';

//Future < void > main() async {
//    await Hive.initFlutter();
//    await Hive.openBox("storage");


void main()  {
  //Get.put(AddItemController());
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( title: 'Grocery Manager',
    home: const MainScreen(),
    );
 }
}   

class MainScreen extends StatelessWidget {
  const MainScreen ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text(
        'A+ Grocery Manager'),
      centerTitle: true,
      //backgroundColor: Colors.green,
      //elevation: 2,
       ),
       body: const HomeScreen(),
       );
  }
}