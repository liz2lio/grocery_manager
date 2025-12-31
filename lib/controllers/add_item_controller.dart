import 'package:get/get.dart';
import '../models/inventory_item.dart';
import 'package:hive/hive.dart';

Future < void > main() async {
    await Hive.initFlutter();
    await Hive.openBox("storage");


class AddItemController extends GetxController {
    // final service = Get.find < GratefulService > ()
    var items = <InventoryItem>[].obs;

    void addNewItem(String name, int quantity) {
        items.add(InventoryItem(name: name, quantity: quantity),
        );
    }
    void removeItem(int index)  {
      items.removeAt(index);
      }
}
