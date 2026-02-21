// lib/screens/add_item_screen.dart

import 'package:flutter/material.dart';

/* sample



 */


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final String _selectedCategory = 'Fruits';

/*
  final List<String> _categories = [
    'Fruits',
    'Vegetables',
    'Dairy',
    'Meat',
    'Beverages',
    'Snacks',
    'Bakery',
    'Frozen',
    'Other',
  ];
*/
  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${_nameController.text} added successfully!'),
          backgroundColor: Colors.green[700],
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Item',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shadowColor: Colors.green.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Header
                  Row(
                    children: [
                      Icon(Icons.add_shopping_cart, 
                        color: Colors.green[700], 
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'New Grocery Item',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),

                  // Item Name
                  const Text(
                    'Item Name',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'e.g. Apples',
                      prefixIcon: const Icon(Icons.shopping_bag_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.green[700]!, 
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter an item name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Quantity
                  const Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'e.g. 3',
                      prefixIcon: const Icon(Icons.numbers),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.green[700]!, 
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a quantity';
                      }
                      if (int.tryParse(value) == null || int.parse(value) <= 0) {
                        return 'Please enter a valid quantity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Category Dropdown
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  //DropdownButtonFormField<String>(
                   // value: _selectedCategory,
                    //decoration: InputDecoration(
                      //prefixIcon: const Icon(Icons.category_outlined),
                      //border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(12),
                      //),
                      //focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(12),
                        //borderSide: BorderSide(
                         // color: Colors.green[700]!, 
                         // width: 2,
                        //),
                      //),
                    //),
                    //items: _categories.map((category) {
                      //return DropdownMenuItem(
                        //value: category,
                        //child: Text(category),
                      //);
                    //}).toList(),
                    //onChanged: (value) {
                      //setState(() {
                        //_selectedCategory = value!;
                      //});
                    //},
                 // ),
                 // const SizedBox(height: 30),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: _saveItem,
                      icon: const Icon(Icons.save, size: 24),
                      label: const Text(
                        'Save Item',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}