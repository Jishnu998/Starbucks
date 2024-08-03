import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:starbucks/view/screens/starbucks%20bottom%20nav.dart';
import '../../controller/menu controller.dart';
import '../../utensils/constants.dart';
import '../widgets/order changing tiles.dart';
import '../widgets/starbucks home tile.dart';

class orderdetailed extends StatelessWidget {
  int num ;
  int initialTabIndex;
  orderdetailed({ required this.num,required this.initialTabIndex});
  final MenuControllerex menuController = Get.put(MenuControllerex());
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading:IconButton(onPressed: (){if(num==1){
            Navigator.pop(context);
          }else{
            Navigator.pushReplacement(
                context,MaterialPageRoute(builder: (context)=>
                starbucks_bottom_nav()));
          }
          },
              icon: Icon(Icons.arrow_back_ios,color: Colors.white)
          ),          backgroundColor: appbarcolor,
          title: Text("Mobile Order and Pay",style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              onPressed: () {
              },
            ),
          ],
        ),
        body: DefaultTabController(
          length: 6,
            initialIndex: initialTabIndex,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    color: appbarcolor,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                            'assets/icons/Location icon.svg',
                            width: size*32,
                            height: size*32,
                            ),
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.only(left: 15,right: 15),
                                child: Container(height: 35,
                                  child:TextField(
                                    decoration: InputDecoration(
                                      hintText: 'No Store Found!',
                                      hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.green.shade700, // Change the color as needed
                                          ),
                                        ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green.shade700, //// Change the color as needed
                                        ),)
                                    ),
                                  )
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              width: size*22,
                              height: size*22,
                            ),
                            SizedBox(width: 10),
                            Text("00mins",style: TextStyle(color: Colors.grey,fontSize:18,fontWeight: FontWeight.w400),)
                          ],),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 20,right: 20,top: 30),
                        child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                menuController.selected1();
                              },
                              child:Obx(()=> Container(
                                  decoration: BoxDecoration(
                                      color:  menuController.isSelected1.value ?
                                      Colors.white : appbarcolor,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                                  height: 50,
                                  width: MediaQuery.sizeOf(context).width/2-22,
                                  alignment: Alignment.center,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Dinein.svg',
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(menuController.isSelected1.value ?
                                        appbarcolor : Colors.white
                                            , BlendMode.srcIn),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Dine In',
                                        style: TextStyle(
                                          color: menuController.isSelected1.value ?
                                          appbarcolor : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 2,
                              color: Colors.grey,
                            ),
                            GestureDetector(
                              onTap: () {
                                menuController.selected2();
                              },
                              child: Obx(()=>
                                 Container(
                                  decoration: BoxDecoration(
                                      color: menuController.isSelected2.value ? Colors.white : appbarcolor,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  height: 50,
                                  width: MediaQuery.sizeOf(context).width/2-22,
                                  alignment: Alignment.center,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/takeaway.svg',
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(menuController.isSelected2.value ?
                                        appbarcolor : Colors.white
                                            , BlendMode.srcIn),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Takeaway',
                                        style: TextStyle(
                                          color: menuController.isSelected2.value ?
                                          appbarcolor : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                                            ),
                      ),
                    Obx(()=> menuController.isContainerSelected.value
                          ? Padding(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 15),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1D3DB),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              width: MediaQuery.sizeOf(context).width,
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
                                            Text("No store found!",style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.w700,color: Color(0xFFBC322F)),),
                                            SizedBox(height: 5),
                                            Text("Please enter a different location to find the nearest Starbucks.",
                                              style: TextStyle(fontSize: 12,
                                                color: Colors.grey.shade700),),
                                          ],),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){menuController.iscontainer();},
                                      child: SvgPicture.asset(
                                          'assets/icons/closebutton.svg',
                                          width: size*25,
                                          height: size*25,
                                          colorFilter: ColorFilter.mode(Color(0xFFBC322F),
                                              BlendMode.srcIn
                                    )))
                                ],),
                              )
                            ),
                          )
                          : SizedBox()),
                      Container(
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('home tile datas').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error: ${snapshot.error}'));
                            } else {
                              final docs = snapshot.data!.docs;
                              if (docs.isNotEmpty) {
                                final orderTileData = docs.firstWhere((doc) => doc.id == 'order tile data');
                                final contentsCollection = orderTileData.reference.collection('contents');
                                return StreamBuilder(
                                  stream: contentsCollection.snapshots(),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> subSnapshot) {
                                    if (subSnapshot.connectionState == ConnectionState.waiting) {
                                      return Center(child: Container());
                                    } else if (subSnapshot.hasError) {
                                      return Center(child: Text('Error: ${subSnapshot.error}'));
                                    } else {
                                      final subDocs = subSnapshot.data!.docs;
                                      return Column(
                                        children: subDocs.map((subDocument) {
                                          Map<String, dynamic> subData = subDocument.data() as Map<String, dynamic>;
                                          return starbuckshometile(tileData: subData);
                                        }).toList(),
                                      );
                                    }
                                  },
                                );
                                                            } else {
                                return Container(); // Return an empty container if the snapshot has no documents
                              }
                            }
                          },
                        ),

                      ),


                    ],)
                  ),
                ),
                SliverAppBar(
                  pinned: true,backgroundColor: appbarcolor,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F0EB),
                      ),
                      child: TabBar(
                        tabs: [
                          tabcontainer(context, "Bestseller"),
                          tabcontainer(context, "Drinks"),
                          tabcontainer(context, "Food"),
                          tabcontainer(context, "Merchandise"),
                          tabcontainer(context, "Coffee At Home"),
                          tabcontainer(context, "Ready to Eat"),
                        ],
                        tabAlignment: TabAlignment.start,
                        unselectedLabelColor: Colors.grey.shade700,
                        labelPadding: EdgeInsets.zero,
                        labelColor: Colors.teal.shade900,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.teal.shade900,
                        indicatorPadding: EdgeInsets.only(left: size*20,right: size*20),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                contentbuilder("Bestseller"),
                contentbuilder("drinks"),
                contentbuilder("food"),
                contentbuilder("merchandise"),
                contentbuilder("Coffee At Home"),
                contentbuilder("Ready to Eat")
              ],
            ),
          ),
        ),
    );
  }
  SingleChildScrollView contentbuilder( String order){
    return SingleChildScrollView(
      child: Column(children: [
          StreamBuilder(
        stream: FirebaseFirestore.instance.collection('$order').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Container());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final docs = snapshot.data!.docs;
            return Column(
              children: docs.expand((doc) {
                final contentsCollection = doc.reference.collection('contents');
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return [
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20),
                        child: Text("${data['name']}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                      ),
                      data['subtitle']!=null?
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10,left: 20),
                          child: Text("${data['subtitle']}",style: TextStyle(fontSize: 15),)): Container(),
                      StreamBuilder(
                        stream: contentsCollection.snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> subSnapshot) {
                          if (subSnapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: Container());
                          } else if (subSnapshot.hasError) {
                            return Center(child: Text('Error: ${subSnapshot.error}'));
                          } else {
                            final subDocs = subSnapshot.data!.docs;
                            return Column(
                              children: subDocs.map((subDocument) {
                                Map<String, dynamic> subData = subDocument.data() as Map<String, dynamic>;
                                return ordertileexchange(tileData: subData, index: "${subDocument['name']}");                                        }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ];
              }).toList(),
            );
          }
        },
      ),
      SizedBox(height: 20),
      Container(width: double.infinity,height: 50,
          color: Colors.grey.shade200,
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.info_outline,color: Colors. blue,size: 20,)), Expanded(
              child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
              child: Text("An average active adult requires 2,000 kcal energy per day, however, "
                  "calorie needs may vary.",style: TextStyle(fontSize: 12),)),
            )
          ],),
        ),
      ]),
    );
  }
  Container tabcontainer(BuildContext context, String tabname){
    double size = constantsize(context);
    return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size*20,right: size*20),
              child: Tab(text: "$tabname"),
            ),Text("|",style: TextStyle(color: Colors.grey),)
          ],
        ));
  }
}
