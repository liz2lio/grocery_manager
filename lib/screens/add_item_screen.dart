import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:flutter_form_validators/flutter_form_validators.dart';
import 'package:get/get.dart';
//import 'item_card.dart'; //move this line at the viewscreen

// ---------AddEntryScreen-----------------
class AddItemScreen extends StatelessWidget {

    static final _formKey = GlobalKey<FormBuilderState>();
    //final controller = Get.find<GratefulController>();
    //final controller = Get.find<InventoryController>(); 
    //final service = Get.find<InventroyService>();
    //AddItemScreen ({super.key}); //move

      //@override
      //State<AddItemScreen> createState() => _AddItemScreenState();
    

    void _submit() {
        if (_formKey.currentState!.saveAndValidate()) {
            final newValue = _formKey.currentState?.value['item_name'] ?? '';
            //controller.addNewItem(newValue);
            print("New item: $newValue");
            Get.back();
        } else {
          print("Validation Failed");
        }
        }





    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add New Item"),
            centerTitle: true,
          ),

            body: Center(
              //child: Column(
                //constraints: BoxConstraints(

                  //maxWidth: 350,
                //),
                //child: FormBuilder (
                //key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,                
                    children: [
                        //add item
                        SizedBox(
                          width:300,
                          child: FormBuilderTextField(
                            name: 'item_name',
                            //initialValue: service.entry.value,
                            decoration: const InputDecoration(
                                labelText: 'Item Name',
                                border: OutlineInputBorder(),
                            )
                         ),
                        ),
                        SizedBox(height:20),

                        //Qty input
                        SizedBox(
                          width: 120,
                          child: FormBuilderTextField(
                            name: 'quantity',
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Quantity',
                              border: OutlineInputBorder(),
                          ),
                          //insert validators related to numbers
                        ),
                        ),
                        SizedBox(height:30),

                        ElevatedButton(
                            onPressed: _submit,
                            child:Text("Save"),
                            )
                            
                    ]
                )
                              )
            );
            
        }
}
