import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'controllers/grocery_controller.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';


Future <void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox("storage");
    Get.put(GroceryController());

    
    runApp(
      GetMaterialApp(
        title: 'Grocery Manager',
        home: const MainScreen(),
      ),
    );

}


class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( title: 'Grocery Manager',
    initialRoute: '/',
    //home: const MainScreen(),
    getPages: [
      GetPage(name: '/', page:() => MainScreen()),
    ]
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

       ),
       body: const HomeScreen(),
       );
  }
}
