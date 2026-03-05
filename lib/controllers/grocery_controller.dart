import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../models/grocery_item.dart';


class GroceryController extends GetxController{
  var groceryList = <GroceryItem>[].obs;
  final storage = Hive.box("storage");

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  // load data
  void loadData() {
    var storedItems = storage.get('items');
    if (storedItems != null) {
      // Convert the stored dynamic list back into GroceryItem objects
      groceryList.value = List<GroceryItem>.from(
        storedItems.map((item) => GroceryItem.fromJson(Map<String, dynamic>.from(item)))
      );
    }
  }

  // save
  void save() {
    // Convert our objects into a list of JSON maps for Hive storage
    List<Map<String, dynamic>> jsonList = groceryList.map((item) => item.toJson()).toList();
    storage.put('items', jsonList);
  }

  void addItem(GroceryItem item) {
    groceryList.add(item);
    save();
}

  void removeItem(int index) {
    groceryList.removeAt(index);
    save();
  }
}
