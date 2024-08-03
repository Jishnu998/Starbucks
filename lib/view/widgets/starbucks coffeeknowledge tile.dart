import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';

class starbuckscoffeeknowledgetile extends StatelessWidget {
  final String name;
  final String published_ago;
  final String image;
  final String icon;
  final String publisher;
  final String time_taken_to_read;
  VoidCallback? onClick;
  starbuckscoffeeknowledgetile(
      {required this.image,required this.name,required this.published_ago,
        required this.icon,required this.publisher,required this.time_taken_to_read,
        required this.onClick});
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return InkWell(
      onTap: onClick,
      child: Stack(
          children:[Padding(padding:  EdgeInsets.only(left: size*60,top: size*10,bottom: size*10),
              child:Container(height: size*190,width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade100,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),
                        spreadRadius: size*1,blurRadius: size*3, offset: Offset(-size*1,size*1))],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size*10),bottomLeft: Radius.circular(size*10))),
              )),
            Positioned(top: size*30,left: size*155,
                child: Container(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: size*20,width: size*80,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade300,),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Coffee Culture",style: TextStyle(fontSize: size*10,
                                fontWeight: FontWeight.w500,color: Colors.teal))])),
                      SizedBox(height:size*10),
                      Container(
                        width: size*250,
                        child: Text("$name",style: GoogleFonts.openSans(
                          textStyle:TextStyle(fontSize: size*17,fontWeight: FontWeight.w700)),
                        maxLines: 2,),),
                      SizedBox(height:size*5),
                      Container(
                        child: Text("$published_ago",style: GoogleFonts.openSans(
                          textStyle:TextStyle(color: Colors.grey.shade800,fontSize: size*12),)),),
                    ],),)),
            Positioned(bottom: size*35,left: size*155,child:  Container(
              child: Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: size*10,
                  children:[
                    CircleAvatar(radius: size*13,
                        child:Image.network("$icon",
                          fit: BoxFit.fill,)),
                    RichText( text: TextSpan(
                        children: <TextSpan>[
                          TextSpan( text: "$publisher",
                            style: GoogleFonts.lato(decoration: TextDecoration.none,
                                fontSize: size*14,color: Colors.black,fontWeight: FontWeight.bold),),
                          TextSpan( text: " . $time_taken_to_read",
                            style: GoogleFonts.lato(decoration: TextDecoration.none,
                                fontSize: size*12,color: Colors.grey, fontWeight: FontWeight.bold),
                          )])),
                  ]),
            ),),
            Positioned(top: size*30,left: size*20,
                child: Container(height: size*120,width: size*120,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),
                          spreadRadius: size*1,blurRadius: size*3)],
                      image: DecorationImage(
                          image: NetworkImage("$image"),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(size*10)),)),
          ]),
    );
  }
}
