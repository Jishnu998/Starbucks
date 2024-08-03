import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: select_store()));}
class select_store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading:BackButton(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
        title: Text("Select Store",style: TextStyle(color: Colors.white,
            fontSize: 18,fontWeight: FontWeight.bold),),
        bottom: PreferredSize(preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(height: 35,width: double.infinity,
                decoration: BoxDecoration(color: Colors.green.shade900),
                child:TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Find a store near you',
                      hintStyle: TextStyle(color: Colors.grey.shade500,fontSize: 13,
                      ),
                      prefixIcon: Icon(Icons.search,color: Colors.green,size: 25,),
                      focusedBorder: OutlineInputBorder( borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ))),
          ),
        ),),
      body: SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/find store.png",height: 250,width: 250,),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Sorry, we can't seem to spot you!",
              textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("please enable your location to find the nearest Starbucks.",
              textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.black,fontSize: 15),),
          ),

        ],),),
    );}}