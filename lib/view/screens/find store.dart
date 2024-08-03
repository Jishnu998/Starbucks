import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utensils/constants.dart';
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: find_store()));}
class find_store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading:IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        backgroundColor: Colors.teal.shade900,
        title: Text("Find a Store",style: TextStyle(color: Colors.white,
        fontSize: size*18,fontWeight: FontWeight.bold),),
        bottom: PreferredSize(preferredSize: Size.fromHeight(size*70),
          child: Padding(
            padding:  EdgeInsets.all(size*25),
            child: Container(height: size*35,width: double.infinity,
                decoration: BoxDecoration(color: Colors.green.shade900),
                child:TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Find a store near you',
                      hintStyle: TextStyle(color: Colors.grey.shade500,
                        fontSize: size*13),
                      prefixIcon: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          width: size*20,
                          height: size*20,
                          colorFilter: ColorFilter.mode(Colors.tealAccent.shade700,
                              BlendMode.srcIn),
                        ),
                        onPressed: () {
                        },
                      ),
                      focusedBorder: OutlineInputBorder( borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(size*30)),
                      enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(size*20)),
                    ))),
          ),
        ),),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size*100),
        Padding(
          padding:  EdgeInsets.all(size*8),
          child: Image.asset("assets/images/find store.png",
            height: size*250,width: size*250,),
        ),
          SizedBox(height: size*30),
          Padding(
          padding: EdgeInsets.all(size*8),
          child: Text("Sorry, we can't seem to spot you!",
            textAlign: TextAlign.center,style: TextStyle(
              color: Colors.black,fontSize: size*20,fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding:  EdgeInsets.all(size*8),
          child: Text("please enable your location to find the nearest Starbucks.",
            textAlign: TextAlign.center,style: TextStyle(
                color: Colors.black,fontSize: size*15),),
        ),
        Padding(
          padding:  EdgeInsets.only(left: size*20,right: size*20,top: size*20),
          child: Container( width: double.infinity,height: size*45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom( backgroundColor: widgetcolor,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(size*40))),
                child: Text("Enable device location",style:TextStyle(
                    fontSize: size*15,color: Colors.white)),),),
        ),
        Padding(
          padding:  EdgeInsets.only(left: size*20,right: size*20,top: size*10),
          child: Container( width: double.infinity,height: size*45,
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () { },
                style: ElevatedButton.styleFrom( backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(side: BorderSide(color: widgetcolor),
                      borderRadius: BorderRadius.circular(size*40))),
                child: Text("Enter Location Manually",style:TextStyle(
                    fontSize: size*15,color: widgetcolor)),),),
        ),
      ],),),
    );}
 }