import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controller/menu controller.dart';
import '../../utensils/constants.dart';
import '../widgets/starbucks recommend tile.dart';

class starbuckssearchpage extends StatelessWidget {
  final MenuControllerex menuController = Get.put(MenuControllerex());
  final searchname=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);

    return Scaffold(
      appBar:AppBar(backgroundColor: appbarcolor,
    title:
      Container(height: 30,width: double.infinity,
             child:TextField(
               cursorColor: appbarcolor,
                 controller: searchname,
                 onChanged: (value) {
                   menuController.searchscreen(searchname.text);
                 },
                 cursorWidth: 3,
                 decoration: InputDecoration(
                         filled: true,
             fillColor: Colors.white,
             hintText: 'Looking for something specific?',
              hintStyle: TextStyle(color: Colors.grey,fontSize: 10),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              prefixIcon: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
                onPressed: () {
                },
              ),
              focusedBorder: OutlineInputBorder( borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)),
                    )))),
    body: normalview()
  );}

  SingleChildScrollView normalview() {
    return SingleChildScrollView(
  child: Padding(
  padding: const EdgeInsets.all(10),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Padding(
  padding: const EdgeInsets.all(15),
  child: Container(child: Text("You may enjoy",style: TextStyle(fontSize: 30,
  fontWeight: FontWeight.bold))),
  ),
  SizedBox(height:10),
  Padding(
  padding: const EdgeInsets.all(15),
  child: Container(child: Text("Drinks",style: TextStyle(fontSize: 20,
  fontWeight: FontWeight.bold))),
  ),
  StreamBuilder(
  stream: FirebaseFirestore.instance.collection('Bestseller').doc('whole data').
  collection('contents').doc('1.Java Chip Frappuccino').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return CircularProgressIndicator(); // Placeholder for loading state
  } else if (snapshot.hasError) {
  return Text('Error: ${snapshot.error}');
  } else {
  if (snapshot.hasData && snapshot.data!.exists) {
  Map<String, dynamic> data = snapshot.data!.data()!;
  return starbucksrecommendtile(
  name: "${data['name']}",
  image: "${data['image']}",
  calorie: "${data['calorie']}",
  price: "${data['price']}",
  veg_or_non_veg: "${data['von']}",
  );
  } else {
  return Text("no data");
  }
  }
  },
  ),
  ],),
  ),
  );
}
  SingleChildScrollView SearchNotFoundview(String searchitem) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(()=> menuController.isContainerSelected2.value
                ? Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 15),
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF1D3DB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15,right: 10,top: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/searchresult.png",
                            height: 35,width: 35),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Container(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("This one's a blank.",style: TextStyle(fontSize: 18,
                                      fontWeight: FontWeight.w700,color: Color(0xFFBC322F)),),
                                  SizedBox(height: 5),
                                  Text("We can't find a match for ${searchname.text} ",
                                    style: TextStyle(fontSize: 12,
                                        color: Colors.grey.shade700),),
                                ],),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: (){menuController.iscontainer2();},
                            child: SvgPicture.asset(
                                'assets/icons/closebutton.svg',
                                width: 25,
                                height: 25,
                                colorFilter: ColorFilter.mode(Color(0xFFBC322F),
                                    BlendMode.srcIn
                                )))
                      ],),
                  )
              ),
            )
                : SizedBox()),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(child: Text("You may enjoy",style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold))),
            ),
            SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(child: Text("Drinks",style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold))),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Bestseller').doc('whole data').
              collection('contents').doc('1.Java Chip Frappuccino').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Placeholder for loading state
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.hasData && snapshot.data!.exists) {
                    Map<String, dynamic> data = snapshot.data!.data()!;
                    return starbucksrecommendtile(
                      name: "${data['name']}",
                      image: "${data['image']}",
                      calorie: "${data['calorie']}",
                      price: "${data['price']}",
                      veg_or_non_veg: "${data['von']}",
                    );
                  } else {
                    return Text("no data");
                  }
                }
              },
            ),
          ],),
      ),
    );
  }
}
