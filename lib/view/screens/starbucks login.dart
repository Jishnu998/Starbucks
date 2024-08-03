import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks/view/screens/starbucks%20bottom%20nav.dart';
class starbuckslogin extends StatelessWidget {
  final uname=TextEditingController();
  final pword=TextEditingController();
  @override
  Widget build(BuildContext context) { 
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => starbucks_bottom_nav()),
        );
        return false;
      },
      child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                  starbucks_bottom_nav()));},
                      child:
                      Text("SKIP",style: GoogleFonts.lato(color: Color(0xFF1C845D),
                          decoration: TextDecoration.none,fontSize: 14,fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              SizedBox(height: 35),
              Text("Login",style:TextStyle( fontSize: 25,fontWeight: FontWeight.w900)),
              SizedBox(height: 30),
              Container(height: 140,width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2),
                          offset: Offset(0, 4), spreadRadius: .1)],
                      color: Colors.white, borderRadius: BorderRadius.circular(10),
                      image: DecorationImage( image: AssetImage("assets/images/ruby barista.PNG"), fit: BoxFit.fill))),
              SizedBox(height: 30),
              Text("USERNAME",style:TextStyle(fontSize: 15)),
              TextFormField( textInputAction: TextInputAction.next,
                  controller: uname,
                  decoration:InputDecoration(
                    hintText: "Enter Email ID or Mobile Number",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: .8)),
                  )),
              SizedBox(height: 25),
              Text("PASSWORD",style: TextStyle(fontSize: 15)),
              TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: pword,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration:InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: .8)),
                  )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: (){},
                      child:RichText( text: TextSpan( children: <TextSpan>[
                        TextSpan( text: "Don't have an account?  ",style: GoogleFonts.lato(
                            decoration: TextDecoration.none, fontSize: 14,color: Colors.black),),
                        TextSpan( text: " Sign Up",style: GoogleFonts.lato(color: Color(0xFF1C845D),
                            decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.bold),
                        )]))),
                  InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                      starbucks_bottom_nav()));},
                      child:
                        Text("Continue as Guest",style: GoogleFonts.lato(color: Color(0xFF1C845D),
                            decoration: TextDecoration.underline,fontSize: 14,fontWeight: FontWeight.bold),
                        )),
      
                ],
              ),
                    SizedBox(height: 25),
                    Container( color: Colors.white,
                width: double.infinity, height: 40,  child: ElevatedButton(onPressed: () {
                if(uname.text !=""&& pword.text !=""){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content:Text("username or passwrod should not be empty")));}
               },
                style: ElevatedButton.styleFrom( backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(40.0),),),
                child: Text("Login",style:TextStyle(fontSize: 20,color: Colors.white70)),),),
              SizedBox(height: 25),
              Center(
                child: InkWell(onTap: (){},
                    child:RichText( text: TextSpan( children: <TextSpan>[
                      TextSpan( text: "Facing trouble logging in?  ",style: GoogleFonts.lato(
                          decoration: TextDecoration.none, fontSize: 14,color: Colors.black),),
                      TextSpan( text: " Get Help",style: GoogleFonts.lato(color: Color(0xFF1C845D),
                          decoration: TextDecoration.underline,fontSize: 15, fontWeight: FontWeight.bold),
                      )]))),
              ),
              SizedBox(height: 5)]),
            ),
            Container(width: double.infinity,height: 50,
              color: Color(0xFFFAF6ED),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/whatsapp.png",height: 30,width: 30,),
                  SizedBox(width: 5),
                  InkWell(onTap: (){},
                      child:RichText( text: TextSpan( children: <TextSpan>[
                        TextSpan( text: "Already registered via WhatsApp?  ",style: GoogleFonts.lato(
                            decoration: TextDecoration.none, fontSize: 14,color: Colors.black),),
                        TextSpan( text: " Continue Here",style: GoogleFonts.lato(color: Color(0xFF1C845D),
                            decoration: TextDecoration.underline,fontSize: 14, fontWeight: FontWeight.bold),
                        )]))),
                ],
              ),
            ),
          ]),),
    );}}
