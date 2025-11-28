import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';

void main()  {
  runApp (
    GetMaterialApp(
      home: Scaffold (
        appBar: AppBar(
          title: Text("A+ Grocery Inventory Manager"),
          centerTitle: true,
        ),
        body: const HomeScreen(),
          
      )
    )
  );
}