import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';
import '../widgets/starbucks gifttile.dart';

class starbucksgift extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                centerTitle: true,
                backgroundColor: appbarcolor,
                title: Text(
                  "Gift Card", style: TextStyle(color: Colors.white),),
                actions: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: size*24,
                      height: size*24,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: size*10)
                ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(size*50),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F0EB),
                  ),
                  child: TabBar(
                    tabs: [
                      tabcontainer(context, "FEATURED"),
                      tabcontainer(context, "CONGRATULATIONS"),
                      tabcontainer(context, "THANK YOU"),
                      tabcontainer(context, "ANYTIME"),
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
              ),),
            body:   TabBarView(
                    children: [
                // Your tab content for Tab 1
                CustomScrollView(
                slivers: [
                SliverList( delegate: SliverChildListDelegate([
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                    padding: EdgeInsets.all(size*20),
                child: Text("Congratulations",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: size*30,
                          fontWeight: FontWeight.bold),
                    ))),
                                Divider(color: Colors.grey.withOpacity(0.5),
                                  height: 1, thickness: 1,),
                              ],
                            ),
                            ])),
                    SliverPadding(
                    padding: EdgeInsets.only(left: size*5,top: size*20,bottom: size*20),
                    sliver: gift_content('gift congratulations')
                    ),
                    SliverList( delegate: SliverChildListDelegate([
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                    padding: EdgeInsets.all(size*20),
                    child: Text("Anytime",
                    style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                    fontSize: size*30,
                    fontWeight: FontWeight.bold),
                    ))),
                    Divider(color: Colors.grey.withOpacity(0.5),
                    height: 1,thickness: 1,),
                    ],
                    ),
                    ])),
                    SliverPadding(
                    padding: EdgeInsets.only(left: size*5,top: size*20,bottom: size*20),
                    sliver: gift_content('gift featured anytime')
                    ),
                    SliverList( delegate: SliverChildListDelegate([
                    SizedBox(height: size*130)]))
                    ]),
                      CustomScrollView(
                          slivers: [
                            SliverPadding(
                                padding: EdgeInsets.zero,
                                sliver:gift_content('gift congratulations')
                            ),
                            SliverList( delegate: SliverChildListDelegate([
                              SizedBox(height: size*130)]))
                          ]),
                      CustomScrollView(
                          slivers: [
                            SliverPadding(
                                padding: EdgeInsets.zero,
                                sliver:gift_content('gift thankyou')
                            ),
                            SliverList( delegate: SliverChildListDelegate([
                              SizedBox(height: size*130)]))
                          ]),
                    CustomScrollView(
                    slivers: [
                    SliverPadding(
                    padding: EdgeInsets.only(left: size*5,top: size*20,bottom: size*20),
                    sliver:gift_content('gift anytime')
                    ),
                      SliverList( delegate: SliverChildListDelegate([
                        SizedBox(height: size*130)]))
                    ]),
                    ],
                    ),

        )  );
  }
  FutureBuilder<QuerySnapshot<Map<String, dynamic>>> gift_content(content_name){
   return FutureBuilder(
     future: FirebaseFirestore.instance.collection('$content_name').get(),
     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return SliverToBoxAdapter(
           child: Center(child: Container()),
         );
       } else if (snapshot.hasError) {
         return SliverToBoxAdapter(
           child: Center(child: Text('Error: ${snapshot.error}')),
         );
       } else {
         return SliverList(
           delegate: SliverChildBuilderDelegate(
                 (BuildContext context, int index) {
               DocumentSnapshot document = snapshot.data!.docs[index];
               return starbucksgifttile(
                   name: "${document['name']}",
                   image: "${document['photo']}",
                   description: "${document['z']}",
                   onClick: () {});
             },
             childCount: snapshot.data!.docs.length,
           ),
         );
       }
     },
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
            ),Text("|",style: TextStyle(color: Colors.grey,fontSize: size*14),)
          ],
        ));
  }
}