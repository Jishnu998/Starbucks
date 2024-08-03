import 'package:flutter/material.dart';
import 'package:starbucks/view/screens/starbucks%20bottom%20nav.dart';
import '../../utensils/constants.dart';

class starbucks_welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
      body: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
              starbucks_bottom_nav()));
              },
        child: Stack(
          children: [
        // Background image
        Positioned.fill(
        child: Image.asset("assets/images/starbucks welcome page background.jpg", // Replace 'background_image.jpg' with your image path
          fit: BoxFit.fill,
        ),
    ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.center,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size*200),
                  Image.asset("assets/images/starbucks logo.png",height: size*100,width: size*100,),
                  SizedBox(height: size*30),
                  Text(getGreeting(),style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                fontSize: size*30,),),
                Text("Enter the world of\nManish Malhotra + Starbucks",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size*18),),
                  SizedBox(height: size*350),
                Icon(Icons.expand_circle_down_outlined,color: Colors.white,size: 35,)
              ],),
            ),
          )]),
      )
    );}
  String getGreeting() {
  var now = DateTime.now();
  var hour = now.hour;
  if (hour < 12) {
  return 'Good Morning';
  } else if (hour < 17) {
  return 'Good Afternoon';
  } else if (hour < 20) {
  return 'Good Evening';
  } else {
  return 'Good Night';
  }
  }
}