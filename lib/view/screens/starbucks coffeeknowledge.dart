import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';
import '../widgets/starbucks coffee culture.dart';
import '../widgets/starbucks coffeeknowledge tile.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, home: starbucks_coffee_knowledge()));
}

class starbucks_coffee_knowledge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                  "Coffee Knowledge", style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w500, fontSize: 18)),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                onPressed: () {},
              ),
                SizedBox(width: 10)],
              bottom:
              PreferredSize(preferredSize: Size.fromHeight(50),
                child: Container( width: 250,
                  child: TabBar(tabs: [
                    Tab(child: Text("Popular", style: TextStyle(fontSize: 15))),
                    Tab(child: Text("Recent", style: TextStyle(fontSize: 15),)),
                  ],
                      dividerHeight: 0,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.teal.shade900,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.teal.shade900),
                ),
              ),),
            body: TabBarView(
                children: [ coffee_knowledge_popular(),
                  coffee_data()


                ])));
  }
}

class coffee_knowledge_popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
        body: DefaultTabController(
        length: 2, // Number of tabs
        child: NestedScrollView(
        headerSliverBuilder: (context, _)
    {
      return [
      SliverToBoxAdapter(
          child: Container(
          height: 450, // Height of your scrollable container
          child: Padding(padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 40)
    ,
    child
    :
    StreamBuilder < DocumentSnapshot> ( stream:FirebaseFirestore.instance.collection('coffee knowledge'
    ).doc('5.How Coffee Stirred Revels & Rebels').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: Container());
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    return Stack(
      children:[ Container(width: double.infinity,height: size*420,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
      image: NetworkImage(data['coverphoto']),fit: BoxFit.fill))),

      Positioned( top: 20,left:20,
        child: Container(height: 20,width: 75,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        color: Colors.white,),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Coffee Culture",style: TextStyle(fontSize: 10,
        fontWeight: FontWeight.bold,color: Colors.teal),),
        ],
        ),),
      ),
      Positioned(bottom: 75,left:20,
        child: Container(width:300,
          child: Text("${data['name']}",style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold,color: Colors.white),overflow: TextOverflow.ellipsis,
          maxLines: 1,),
        ),
      ),

      Positioned(bottom: 30,left:20,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
        children:[
        CircleAvatar(radius: size*15,
        child:Image.network(data['logophoto'])),
        SizedBox(width: 10),
        RichText( text: TextSpan(
        children: <TextSpan>[
        TextSpan( text: data['publisher'],
        style: GoogleFonts.lato(decoration: TextDecoration.none,
        fontSize: size*14,color: Colors.white,fontWeight: FontWeight.bold),),
        TextSpan( text: " . ${data['readtime']}",
        style: GoogleFonts.lato(decoration: TextDecoration.none,
        fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold),
        )])),
        ]),
      ),
    ]);}})))
    ),
    SliverAppBar(
    pinned: true,
    bottom: PreferredSize(
    preferredSize: Size.fromHeight(0),
    child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
    color: Color(0xFFF1F0EB),
    ),
    child: TabBar(
    tabs: [
    Container(

        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Tab(text: "All"),
            ),Text("|",style: TextStyle(color: Colors.grey),)
          ],
        )),

    Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Tab(text: "Coffee Culture"),
        )),
    ],
    tabAlignment: TabAlignment.start,
    unselectedLabelColor: Colors.grey.shade700,
    labelPadding: EdgeInsets.zero,
    labelColor: Colors.teal.shade900,
    isScrollable: true,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: Colors.teal.shade900,
      indicatorPadding: EdgeInsets.only(left: 20,right: 20),
    ),
    ),
    ),
    ),

    ];
    },
    body: TabBarView(
    children: [
    coffee_data(),
      coffee_data()
    ])
    ))
    );
  }
  }

  class coffee_data extends StatelessWidget {
 var name=["all","articles"];
  @override
  Widget build(BuildContext context) {
  return CustomScrollView(
      slivers: [
  SliverList(
  delegate: SliverChildListDelegate(
  [StreamBuilder(
            stream: FirebaseFirestore.instance.collection('coffee knowledge').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
            } else {
            return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return starbuckscoffeeknowledgetile(
            image: "${document['coverphoto']}",
            name: "${document['name']}",
            published_ago: "${document['publish']}",
            icon: "${document['logophoto']}",
            publisher: "${document['publisher']}",
            time_taken_to_read: "${document['readtime']}",
            onClick: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => starbucks_coffee_blog(documentData: data)));
            });
            }).toList(),
            );
            }
            },
            )]))]);
  }
  }

