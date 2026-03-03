// lib/screens/add_item_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../controllers/grocery_controller.dart';
import '../models/grocery_item.dart';

class AddItemScreen extends StatefulWidget{
  const AddItemScreen ({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GroceryController groceryController = Get.find<GroceryController>();


  void saveItem() {
    //validate fields
    if (_formKey.currentState?.saveAndValidate() ?? false) {


      //get the values from the form
      final String itemName = _formKey.currentState!.value['name'];
      final String itemQuantity = _formKey.currentState!.value['quantity'];

      //create and add item
      final GroceryItem newItem = GroceryItem(name: itemName, quantity: int.parse(itemQuantity));
      groceryController.addItem(newItem);

      //reset the form after saving
      Get.back();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add New Item'),
          centerTitle: true,
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(20),      
      child: FormBuilder(
        key: _formKey, 
        child: Column(
          children: [
        // item name
        
        const SizedBox(height:40),
        Center(
          child: SizedBox(
            width: 300,
            child:FormBuilderTextField(name: 'name',
            decoration: const InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Enter item name'),
            ]),
            ),
          ),
          ),

          const SizedBox(height:20),

          //quantity
        Center(
          child: SizedBox(
            width: 300,
            child: FormBuilderTextField(
              name: 'quantity',
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
            
          
              keyboardType: TextInputType.number,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Enter a quantity'),
              FormBuilderValidators.numeric(errorText: 'Quantity must be a number'),
              ]),
           ),)
        ),
        const SizedBox(height: 40),

        // Save Button
        ElevatedButton(
          onPressed: saveItem, 
          child: const Text('Save Item'),
        ),
      ],
    ),
  ),
  ),
  );
}
}
