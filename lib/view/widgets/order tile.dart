import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';

class order_tile extends StatelessWidget {
  final String veg_or_nonVeg;
  final String name;
  final String predescription;
  final String description;
  final String price;
  final String image;
  VoidCallback? onClick;
  order_tile(
      {required this.image,required this.veg_or_nonVeg,
        required this.name,required this.predescription,
        required this.description,required this.price,required this.onClick});
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return Stack(
        children:[
          Padding(padding: EdgeInsets.only(top: size*10,bottom: size*10,left: size*20,right: size*20),
              child:Container(height: size*210,width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade100,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                        spreadRadius: size*1.5,blurRadius: size*1)],
                    borderRadius: BorderRadius.circular(size*10)),
              )),
          Positioned(top: size*30,left: size*45, child:InkWell(onTap: onClick,
            child: CircleAvatar( radius: size*50,
                backgroundImage: NetworkImage("$image")),
          )),

          Positioned(top: size*30,left: size*160,
            child: Container(width: size*205,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  veg_or_nonVeg !=""? SvgPicture.asset(
                    vegornonveg(veg_or_nonVeg),
                    width: 20,
                    height: 20,
                  ): Container(),
                  SizedBox(height: size*6),
                  Text("$name",style: GoogleFonts.openSans(
                    textStyle:TextStyle(fontSize: size*17,fontWeight: FontWeight.w700),),
                  maxLines: 1,overflow: TextOverflow.ellipsis,),
                  merchandise_or_normal(context,predescription),
                  SizedBox(height:size*5),
                  Text("$description",style: GoogleFonts.openSans(
                    textStyle:TextStyle(color: Colors.grey.shade800,
                        fontSize: size*12.5),),maxLines: 2,overflow: TextOverflow.ellipsis,)
                ],),
            ),),
          Positioned(bottom: size*30,left: size*160,
            child: Container(width: size*205,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$price",style: GoogleFonts.openSans(
                    textStyle:TextStyle(fontSize: size*16,fontWeight: FontWeight.w700),)),
               Container(height: size*35,
                 child: ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade700),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(size*20))),
                    elevation: MaterialStateProperty.all<double>(size*2), // Elevation
                    // You can customize other styles as needed
                  ),
                  child: Text(" Add Item ",style: TextStyle(color: Colors.white,
                  fontSize: size*14),)),
               ) ],),
            ),),
        ]);
  }
  vegornonveg(von){
    if(von == "veg"){
      return "assets/icons/veg.svg";
    }else if(von=="non"){
      return "assets/icons/nonveg.svg";
    }else{
      return "";
    }
  }
  Widget merchandise_or_normal(BuildContext context, String predescription){
    double size = constantsize(context);
      if(predescription!="null"){
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:size*3),
          Text("$predescription",style: GoogleFonts.openSans(
            textStyle:TextStyle(color: Colors.grey.shade800,
                fontSize: size*11),),maxLines: 1,overflow: TextOverflow.ellipsis,),
        ],);}else {
        return Container();
      }
    }
}