import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:starbucks/view/screens/starbucks%20welcomepage.dart';

class starbucks_splashscreen extends StatefulWidget {
  const starbucks_splashscreen({Key? key}):super(key:key);
  @override
  State<starbucks_splashscreen> createState()=> _starbucks_splashscreenState();
}
class _starbucks_splashscreenState extends State<starbucks_splashscreen>{
  @override
  void initState(){
    Timer(Duration(seconds:5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=> starbucks_welcomepage())
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(
            image:AssetImage("assets/images/YouCut_20240205_115914988.gif"),
            fit:BoxFit.fill)),
      ),
    );
  }
}