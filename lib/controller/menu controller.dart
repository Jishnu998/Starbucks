import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
class MenuControllerex extends GetxController {
  var selectedTileIndices = <String>[].obs;
  RxBool isSelected1 =false.obs;
  RxBool isSelected2 =true.obs;
  RxBool isContainerSelected =true.obs;
  RxBool isContainerSelected2 =true.obs;
  RxBool searchscreenvalue = false.obs;
  void toggleTile(String index) {
    if (selectedTileIndices.contains(index)) {
      selectedTileIndices.remove(index); // Deselect if already selected
    } else {
      selectedTileIndices.add(index); // Select if not selected
    }
  }
  void searchscreen(String text) {
    if (text=='') {
       searchscreenvalue.value=false;
    } else {
       searchscreenvalue.value=true;
    }
  }

  bool isSelected(String index) {
    return selectedTileIndices.contains(index);
  }
  void selected1() {
    isSelected1.value = true;
    isSelected2.value = false;
  }
  void selected2() {
    isSelected1.value = false;
    isSelected2.value = true;
  }
  void iscontainer(){
    isContainerSelected.value = false;
  }
  void iscontainer2(){
    isContainerSelected2.value = false;
  }
}