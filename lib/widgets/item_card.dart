import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String itemName;
  final int quantity;

  const ItemCard ( {
    super.key,
    required this.itemName,
    required this.quantity,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //item
          Expanded(
            child: Text(
              itemName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )
            )
          ),
          //quantity
          Text( "Qty:", 
          style: TextStyle(fontSize:16,
          fontWeight: FontWeight.w500))
        ]
      )
    );
  }


}