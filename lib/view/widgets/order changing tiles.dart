import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/menu controller.dart';
import 'order expanded tile.dart';
import 'order tile.dart';

class ordertileexchange extends StatelessWidget {
  final MenuControllerex menuController = Get.put(MenuControllerex());
  final Map<String, dynamic> tileData;
  final String index;
  ordertileexchange({required this.tileData,required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      bool isSelected = menuController.isSelected(index);

      return isSelected
          ?  order_expanded_tile(image: "${tileData['image']}",
          veg_or_nonVeg: "${tileData['von']}",
          name: "${tileData['name']}",
          predescription: "${tileData['calorie']}",
          description: "${tileData['description']}",
          price: "${tileData['price']}", soy: "${tileData['soy']}",
        milk: "${tileData['milk']}", wheat: "${tileData['wheat']}",
        brewed_coffee: "${tileData['brewed coffee']}", onClick: () { menuController.toggleTile(index); },) :

      order_tile(image: "${tileData['image']}",
          veg_or_nonVeg: "${tileData['von']}",
          name: "${tileData['name']}",
          predescription: "${tileData['calorie']}",
          description: "${tileData['description']}",
          price: "${tileData['price']}", onClick: () { menuController.toggleTile(index); },
      );
    });
  }
}

