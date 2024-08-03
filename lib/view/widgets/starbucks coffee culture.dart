import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../../utensils/constants.dart';

class starbucks_coffee_blog extends StatelessWidget {
  final Map<String, dynamic> documentData;

  starbucks_coffee_blog({required this.documentData});
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Scaffold(
    appBar:AppBar(backgroundColor: Colors.white,centerTitle: true,
        title:Text("Coffee Blog",style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.w500,fontSize: size*18)),
    leading:IconButton(
      icon: Icon(Icons.arrow_back_ios,color: Colors.grey),
      onPressed: () {
        Navigator.pop(context);
      },
    ),),
    body: SingleChildScrollView(
      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(width: double.infinity,height: size*300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(documentData['coverphoto']),
                fit: BoxFit.fill))),
            Padding(padding:  EdgeInsets.all(size*20),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,children: [
              Container(
                child: Text(documentData['name'],style: TextStyle(
                    fontSize: size*25,
                    fontWeight: FontWeight.bold,color: Colors.black)),
              ),
              SizedBox(height: size*20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: size*20,width: size*80,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(size*5),
                      color: Colors.grey.shade300,),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Coffee Culture",style: TextStyle(fontSize: size*10,
                            fontWeight: FontWeight.w500,color: Colors.teal),),
                      ],
                    ),),
                  IconButton(
                      onPressed: () {
                        String sharetext ="Embrace the Coffee Culture with Starbucks. Check out our popular blog https://share.starbucks.in";
                        shareText(sharetext);},
                      icon:  Icon(Icons.share_outlined,color: Colors.teal,size: size*25))
                ],
              ),
              SizedBox(height: size*20),
              Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                spacing: size*10,
                children:[
                  CircleAvatar(radius: size*14,
                      child:Image.network(documentData['logophoto'])),
                  RichText( text: TextSpan(
                    children: <TextSpan>[
                      TextSpan( text: documentData['publisher'],
                        style: GoogleFonts.lato(decoration: TextDecoration.none,
                            fontSize: size*14,color: Colors.black,fontWeight: FontWeight.bold),),
                      TextSpan( text: " . ${documentData['readtime']}",
                        style: GoogleFonts.lato(decoration: TextDecoration.none,
                            fontSize: 12,color: Colors.grey, fontWeight: FontWeight.bold),
                      )])),
              ]),
              SizedBox(height: size*30),
              Padding(
                padding:  EdgeInsets.all(size*8),
                child: Text(documentData['content']),
              )
              ],),)
          ],),
    )

  );}
  void shareText(String text) {
    Share.share(text); // Function to share text
  }

}
