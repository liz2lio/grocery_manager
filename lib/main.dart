import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main()  {
  runApp (
    MaterialApp(
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