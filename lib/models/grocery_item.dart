class GroceryItem {
  String name;
  int quantity;

  GroceryItem ({
    required this.name,
    required this.quantity,
   }
  );

  // conver map
  factory GroceryItem.fromJson(Map<String, dynamic> json) {
    return GroceryItem(
      name: json['name'],
      quantity: json['quantity'],
    );
  }

Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }

}  
