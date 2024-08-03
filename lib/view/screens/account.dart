import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utensils/constants.dart';
class starbucks_account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(backgroundColor: Color(0xFFFAF6ED),
      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
    },
            icon: Icon(Icons.arrow_back_ios,color: Colors.grey)),
        centerTitle: true,
        backgroundColor: Color(0xFFFAF6ED),
        title: Text("Account",style: TextStyle(color: Colors.black,
            fontSize: size*18,fontWeight: FontWeight.w600),),
        actions: [Padding(
          padding:  EdgeInsets.all(size*7),
          child: Icon(Icons.notifications_none_rounded,size: size*30,),
        ),
        Padding(
          padding:  EdgeInsets.all(size*7),
          child: Icon(Icons.settings_outlined,size: size*30,),
        ),
        SizedBox(width: size*15,)],),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children:[
            Container(width:double.infinity,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size*40),
              CircleAvatar(radius: size*105,
                backgroundColor: Colors.white,
                child: CircleAvatar(radius: size*100,
                  backgroundColor: Color(0xFFCCA258),
                  child: CircleAvatar(radius: size*95,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(radius: size*85,
                      child: Image.asset("assets/images/account logo.png"),),
                  ),
                ),
              ),
              SizedBox(height: size*15),
              Padding(
                padding:  EdgeInsets.all(size*8),
                child: Text("Welcome to Starbucks",
                  textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.black,fontSize: size*30,fontWeight: FontWeight.bold))),
              Container(height: size*50,
                child: ElevatedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size*20))),
                      elevation: MaterialStateProperty.all<double>(size*8), // Elevation
                      // You can customize other styles as needed
                    ),
                    child: Text(" Login or Sign Up ",style: TextStyle(color: Colors.white,
                    fontSize: size*14),)),
              ),
              SizedBox(height: size*55),
            ],),),
            Positioned(top:0,left: -size*35,
                child: Image.asset("assets/images/brown leaf.png",
                  height: size*120,
                  width: size*120,)),
            Positioned(right: -size*20,
                top: size*100,
                child: Image.asset("assets/images/gold bubble.png",
                  height: size*40,
                  width: size*50,)),
          ]),
            Container(height: size*500,
              width:double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size*30),
                topRight: Radius.circular(size*30)),
                border: BorderDirectional(top: BorderSide(color: Colors.grey.withOpacity(.3),)),
                color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.3),
                  spreadRadius: size,blurRadius: size)], ),
            child: Column(children: [
              SizedBox(height: size*20),
                      Padding(
                        padding:  EdgeInsets.all(size*25),
                        child: Column(
                          children: [
                            ListTile(leading: Image.asset("assets/images/account help logo.PNG",
                              height: size*30,width: size*30,),
                                title: Text("HELP CENTER",style: TextStyle(
                                    fontSize: size*15,fontWeight: FontWeight.bold),),
                                trailing: Icon(Icons.arrow_forward_ios,color: widgetcolor)),
                            Divider(color: Colors.grey,),
                            SizedBox(height: size*25),
                            ListTile(leading: Image.asset("assets/images/account rate logo.PNG",
                              height: size*30,width: size*30,),
                              title: Text("RATE US ON THE APP STORE",style: TextStyle(
                                  fontSize: size*15,fontWeight: FontWeight.bold),),
                              trailing: Icon(Icons.arrow_forward_ios,color: widgetcolor)),
                            Divider(color: Colors.grey,),
                          ],
                        )
                      ),
              SizedBox(height: size*45),
              Container(height: size*20,
                  width: size*120,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(size*5),
                    color: Colors.white,
                      border: Border.all(color: Colors.black,width: size)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText( text: TextSpan( children: <TextSpan>[
                          TextSpan( text: "Starbucks version ",style: GoogleFonts.lato(
                              decoration: TextDecoration.none, fontSize: size*10,color: Colors.grey),),
                          TextSpan( text: "5.1.0",style: GoogleFonts.lato(color: Colors.black54,
                              decoration: TextDecoration.none,fontSize: size*10, fontWeight: FontWeight.w900),
                          )])),
                        ])),

            ],),),

        ],),),
    );}}