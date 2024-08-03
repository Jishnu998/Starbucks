import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:starbucks/view/screens/starbucks%20coffeeknowledge.dart';
import '../../utensils/constants.dart';
import '../widgets/starbucks coffee culture.dart';
import '../widgets/starbucks home tile.dart';
import '../widgets/starbucks latest offering tile.dart';
import '../widgets/starbucks recommend tile.dart';
import 'account.dart';
import 'find store.dart';
import 'orderpege.dart';

class starbuckshome extends StatelessWidget {
  var names = [
    "Bestseller",
    "Drinks",
    "Food",
    "Merchandise",
    "Coffee At Home",
    "Ready to Eat"
  ];
  var curations = ["assets/images/bestseller.png", "assets/images/drinks.png",
    "assets/images/food.png", "assets/images/merchandise.png",
    "assets/images/coffee at home.png", "assets/images/ready to eat.png",
  ];

  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(size * 200),
          child: AppBar(
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/manushmalhotra.jpg", height: size * 400,
                    width: double.infinity,
                    fit: BoxFit.cover,)),
              leading: IconButton(onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        find_store()));
              },
                  icon: Icon(
                    Icons.storefront, size: size * 30, color: Colors.white,)),
              actions: [IconButton(onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>
                        starbucks_account()));
              },
                  icon: Icon(Icons.account_circle_outlined, size: size * 30,
                    color: Colors.white,)),
                SizedBox(width: size * 10)],
              bottom: AppBar(
                toolbarHeight: size * 50,
                backgroundColor: appbarcolor,
                elevation: 0,
                title: Text("Enter the world of\nManish Malhotra + Starbucks",
                  style: TextStyle(fontSize: size * 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),),
                actions: [
                  Padding(padding: EdgeInsets.only(
                      right: size * 20, top: size * 12, bottom: size * 12),
                      child: Container(
                          decoration: BoxDecoration(border: Border.all(
                              width: size * 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(size * 30)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(
                                    left: size * 12, right: size * 12),
                                    child: Text("Know More", style: TextStyle(
                                        fontSize: size * 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))
                              ])))
                ],))),
      body: CustomScrollView(
          slivers: [

      SliverList( delegate: SliverChildListDelegate([
      CarouselSlider(items: [
        hometile_slider('carousel slider section 1'),
        hometile_slider('carousel slider section 2'),
    ],
    options: CarouselOptions(enableInfiniteScroll: false,
        autoPlayCurve: Curves.fastOutSlowIn,
    viewportFraction: 1,height: size*500,
    initialPage: 0))])),
    SliverList( delegate: SliverChildListDelegate([
    Container(height: 100,width:double.infinity,color: Colors.white,),])),
    SliverList( delegate: SliverChildListDelegate([
    Stack(children:[
    Container(height: 500,width:double.infinity,color: Colors.blueGrey.shade50,),
    Positioned(right: 0,top: 0,
    child: Image.asset("assets/images/greyleaf.png",
    height: 50,width: 50,))]),])),
    SliverPadding( padding: const EdgeInsets.only(left: 20,top: 30,bottom: 20),
    sliver:SliverList( delegate: SliverChildListDelegate([
    Container(child: Text("Handcrafted Curations",style: TextStyle(fontSize: 30,
    fontWeight: FontWeight.bold))),]))),
    SliverGrid(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3),
    delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
            orderdetailed(num: 1, initialTabIndex: index)));
      },
      child: Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      CircleAvatar(radius:45,
      backgroundImage: AssetImage(curations[index])),
      Text(names[index],style: TextStyle(height: 2,fontWeight: FontWeight.w500),),
      ],),),
    );
    },
    childCount: 6, // Number of grid items
    ),),
    SliverPadding( padding: const EdgeInsets.only(left: 20,top: 30,bottom: 20),
    sliver:SliverList( delegate: SliverChildListDelegate([
    Container(child: Text("Latest Offerings",style: TextStyle(fontSize: 30,
    fontWeight: FontWeight.bold))),]))),
    SliverList( delegate: SliverChildListDelegate([
      Padding(
        padding:  EdgeInsets.only(left: 10,right: 10),
        child: CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return StreamBuilder(
              stream: FirebaseFirestore.instance.collection('latest recommendings').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Placeholder for loading state
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DocumentSnapshot<Map<String, dynamic>> document = snapshot.data!.docs[index];
                  return    starbucks_latest_offering_tile(name: "${document['name']}",
                    image: "${document['image']}",
                    predescription: "${document['calorie']}",
                    description: "${document['description']}",
                    price: "${document['price']}", veg_or_non_veg: "${document['von']}");
                }
              },
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: false, viewportFraction: 0.85,
            height:430,padEnds: false,
            initialPage: 0,
          ),
        ),
      ),
    ])),
    SliverList( delegate: SliverChildListDelegate([
    Stack(children:[
    Container(height: 1000,width:double.infinity,color: Colors.blueGrey.shade50,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Padding(
    padding: const EdgeInsets.only(top: 30,left: 20,bottom: 20),
    child: Text("Barista Recommends",
    style: TextStyle(fontSize: 30,
    fontWeight: FontWeight.bold)),
    ),
    Padding(
      padding:  EdgeInsets.only(left: 10,right: 10),
      child: CarouselSlider.builder(
      itemCount: 5, // Assuming there are always 5 documents
      itemBuilder: (BuildContext context, int index, int realIndex) {
      return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('barita recommends').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(); // Placeholder for loading state
      } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
      } else {
      DocumentSnapshot<Map<String, dynamic>> document = snapshot.data!.docs[index];
      return starbucksrecommendtile(name: "${document['name']}",
          image: "${document['image']}",
          calorie: "${document['calorie']}",
          price: "${document['price']}",
          veg_or_non_veg: "${document['von']}");
      }
      },
      );
      },
      options: CarouselOptions(
      enableInfiniteScroll: false, viewportFraction: 0.85,height: 215,
        padEnds: false,
        initialPage: 0,
      ),
      ),
    ),
    Center(
    child: ElevatedButton(onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
    orderdetailed(num: 1, initialTabIndex: 0,)));
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20))),
    elevation: MaterialStateProperty.all<double>(8), // Elevation
    // You can customize other styles as needed
    ),
    child: Text(" View Full Menu ",style: TextStyle(color: Colors.white),)),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 30,left: 20,bottom: 20),
    child: Text("Learn more about the\nWorld of Coffee",style: TextStyle(fontSize: 30,
    fontWeight: FontWeight.bold)),
    ),
    Padding(
    padding: const EdgeInsets.all(20),
    child: Container(width: double.infinity,height: 370,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
    image: DecorationImage(
    image: AssetImage("assets/images/coffee culture.png"),fit: BoxFit.fill)),
    child: Padding(
    padding: const EdgeInsets.only(top: 20,left: 15,bottom: 20,right: 15),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
    Container(height: 13,width: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),
    color: Colors.white,),
    child: Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text("Coffee Culture",style: TextStyle(fontSize: 7,
    fontWeight: FontWeight.bold,color: Colors.teal),),
    ],
    ),),
    SizedBox(height: 120),
    Text("How Coffee Stirred Revels & \nRebels",style: TextStyle(fontSize: 20,
    fontWeight: FontWeight.bold,color: Colors.white)),
    SizedBox(height: 10),
    Text("Delighted by the jovial character of coffee,\n"
    "everyone was inspired to bring it home-\n"
    "leading to some of the most crucial firsts.",style: TextStyle(fontSize: 15,
    fontWeight: FontWeight.bold,color: Colors.white)),
    SizedBox(height: 10),
    ElevatedButton(onPressed: () async{
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await FirebaseFirestore.instance.collection('coffee knowledge').doc('5.How Coffee Stirred Revels & Rebels').get();

      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
    starbucks_coffee_blog(documentData: documentSnapshot.data()!)));

    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20))),
    elevation: MaterialStateProperty.all<double>(8), // Elevation
    // You can customize other styles as needed
    ),
    child: Text(" Learn More ",style: TextStyle(color: Colors.black),)),
    ],),
    ),),
    ),

    SizedBox(height: 10),
    Center(
    child: ElevatedButton(onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
    starbucks_coffee_knowledge())); },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20))),
    elevation: MaterialStateProperty.all<double>(8), // Elevation
    ),
    child: Text(" Discover More ",style: TextStyle(color: Colors.white),)),
    ),
    ],)),
    Positioned(right: 0,top: 0,
    child: Image.asset("assets/images/greyleaf.png",height: 50,width: 50,))]),])),
    SliverList( delegate: SliverChildListDelegate([
    Container(height: 100,width:double.infinity,color: Colors.white,),]))
    ]
    )
    );
  }
 StreamBuilder<QuerySnapshot<Map<String, dynamic>>> hometile_slider( String ordertilenumber){
    return  StreamBuilder(
      stream: FirebaseFirestore.instance.collection('home tile datas')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Container());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              if (document.id == ordertilenumber) {
                final CollectionReference contentsCollection = document
                    .reference.collection('contents');
                return StreamBuilder(
                  stream: contentsCollection.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> subSnapshot) {
                    if (subSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Container();
                    } else if (subSnapshot.hasError) {
                      return Text('Error: ${subSnapshot.error}');
                    } else {
                      return Column(
                          children: subSnapshot.data!.docs.map((subDocument) {
                            Map<String, dynamic> subData = subDocument.data() as Map<String, dynamic>;
                            return starbuckshometile(tileData: subData);
                          }).toList(),
                      );
                    }
                  },
                );
              } else {
                return Container(); // Return an empty container if the document is not 'Sandwiches & Wraps'
              }
            }).toList(),
          );
        }
      },
    );
 }
}