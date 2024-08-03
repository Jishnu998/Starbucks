import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class starbucksrecommendtile extends StatelessWidget {
  final String veg_or_non_veg;
  final String name;
  final String calorie;
  final String price;
  final String image;
  starbucksrecommendtile(
      {required this.name,
        required this.image,required this.calorie,required this.price,
      required this.veg_or_non_veg});
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Padding(padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            child:Container(height: 180,width: 350,
              decoration: BoxDecoration(color: Colors.grey.shade100,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,blurRadius: .5)],
                  borderRadius: BorderRadius.circular(10)),
            )),
          Positioned(top: 30,left: 30, child:CircleAvatar( radius: 45,
                  backgroundImage: NetworkImage("$image"))),

          Positioned(top: 30,left: 135,
              child: Container(
                width: 165,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      veg_or_non_veg !=""? SvgPicture.asset(
                        vegornonveg(veg_or_non_veg),
                        width: 20,
                        height: 20,
                      ): Container(),
                      SizedBox(height: 10),
                      Text("$name",style: GoogleFonts.openSans(
                        textStyle:TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      maxLines: 2,overflow: TextOverflow.ellipsis,),
                      SizedBox(height:5),
                      Text("$calorie",style: GoogleFonts.openSans(
                        textStyle:TextStyle(color: Colors.grey.shade800,
                        fontSize: 11),),maxLines: 1,overflow: TextOverflow.ellipsis)
                    ],),
              ),),
          Positioned(top: 130,left: 30,
            child: Container( width: 250,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$price",style: GoogleFonts.openSans(
                    textStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                  Container(height: 35,
                    child: ElevatedButton(onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade700),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          elevation: MaterialStateProperty.all<double>(2), // Elevation
                          // You can customize other styles as needed
                        ),
                        child: Text(" Add Item ",style: TextStyle(color: Colors.white),)),
                  )
                ],),
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
}
