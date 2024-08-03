import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';

class starbuckshometile extends StatelessWidget {
  final Map<String, dynamic> tileData;
  starbuckshometile(
      {required this.tileData});
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Stack(
        children:[
          Padding(padding: EdgeInsets.only(left: size*20,top: size*15,bottom: size*15,right: size*20),
              child:Container(height: size*220,width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                        spreadRadius: size*1,blurRadius: size*.5)],
                    borderRadius: BorderRadius.circular(size*20),
                image: DecorationImage(image: NetworkImage("${tileData['image']}"),
                fit: BoxFit.fill)),
              )),
          Positioned(top: size*25,right: size*35,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tileData['TandC_or_nil']!=null? "${tileData['TandC_or_nil']}":"",style: GoogleFonts.openSans(color: Color(int.parse(tileData['textcolor'])),
                  textStyle:TextStyle(fontSize: size*12),)),
              ],),),

          Positioned(top: size*40,left: size*135,
            child: Container( width: size*240,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${tileData['pretitle']}",style: GoogleFonts.openSans(color: Color(int.parse(tileData['textcolor'])),
                    textStyle:TextStyle(fontSize: size*15),),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  Text("${tileData['title']}",style: GoogleFonts.openSans(color: Color(int.parse(tileData['textcolor'])),
                    textStyle:TextStyle(fontSize: size*20,fontWeight: FontWeight.w600),),
                      maxLines: 1,overflow: TextOverflow.ellipsis),
                  SizedBox(height:size*10),
                  Text("${tileData['description']}",style: GoogleFonts.openSans(color: Color(int.parse(tileData['textcolor'])),
                    textStyle:TextStyle(color: Colors.grey.shade800,
                        height: 1.3, fontSize: size*13.5,overflow: TextOverflow.ellipsis),),maxLines: 3,)
                ],),
            ),),
          Positioned(bottom:size*30,left: size*135,
            child: Container(width: size*240,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${tileData['price_or_startingfrom']}",style: GoogleFonts.openSans(color: Color(int.parse(tileData['textcolor'])),
                        textStyle:TextStyle(fontSize:size* 15),)),
                      Text("${tileData['price']}",style: GoogleFonts.openSans(color: Color(int.parse(tileData['textcolor'])),
                        textStyle:TextStyle(fontSize: size*15,fontWeight: FontWeight.w700),)),
                    ],),
                  Container(height: size*35,width: size*100,
                    child: ElevatedButton(onPressed: (){},
                        style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(int.parse(tileData['buttoncolor']))),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size*20))),
                          elevation: MaterialStateProperty.all<double>(0), // Elevation
                          // You can customize other styles as needed
                        ),
                        child: Text("${tileData['knowmore_or_buynow']}",style: TextStyle(color: Color(int.parse(tileData['knowmore_or_buynow_color'])),
                            fontSize: size*15))),
                  )
                ],
              ),
            ),),
        ]);
  }
}