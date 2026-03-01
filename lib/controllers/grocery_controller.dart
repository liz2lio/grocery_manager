import 'package:get/get.dart';
import '../models/grocery_item.dart';

class GroceryController extends GetxController{
  var groceryList = <GroceryItem>[].obs;

  void addItem(GroceryItem item) {
    groceryList.add(item);
}

  void removeItem(int index) {
    groceryList.removeAt(index);
  }
}
