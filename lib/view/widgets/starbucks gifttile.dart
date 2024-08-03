import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';

class starbucksgifttile extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  VoidCallback? onClick;
  starbucksgifttile(
      {required this.name,
        required this.image,required this.description,required this.onClick});
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Stack(
      children:[Padding(padding: EdgeInsets.only(left: size*60,top: size*10,bottom: size*10),
        child:Container(height: size*200,width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey.shade100,
           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
           spreadRadius: 0,blurRadius: size*.3, offset: Offset(-size*1,size*1))],
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size*10),bottomLeft: Radius.circular(size*10))),
          )),
        Positioned(top: size*37,left: size*215,
            child: Container(width:size*180,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text("$name",style: GoogleFonts.openSans(
            textStyle:TextStyle(fontSize: size*18,fontWeight: FontWeight.w600),),
          overflow: TextOverflow.ellipsis,maxLines: 1,),
          SizedBox(height:size*5),
          Text("$description",style: GoogleFonts.openSans(
          textStyle:TextStyle(color: Colors.grey.shade800,
          height: 1.4, fontSize: size*13),),overflow: TextOverflow.ellipsis,maxLines: 3,),
                SizedBox(height: size*20),
                Container(height: size*35,
                  child: ElevatedButton(onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade800),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(size*25))),
                        elevation: MaterialStateProperty.all<double>(0), // Elevation
                        // You can customize other styles as needed
                      ),
                      child: Text(" Add Item ",style: TextStyle(color: Colors.white,
                      fontSize: size*14),)),
                )
        ],),)),
        Positioned(top: size*40,left: size*20,
            child: Container(height: size*120,width: size*180,
             decoration: BoxDecoration(
           boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),
             spreadRadius: size*1,blurRadius: size*3)],
                 image: DecorationImage(
              image: NetworkImage("$image"),fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(size*10)),)),


          

              ]);
  }
}
