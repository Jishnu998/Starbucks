import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class starbucks_latest_offering_tile extends StatelessWidget {
  final String name;
  final String veg_or_non_veg;
  final String predescription;
  final String description;
  final String price;
  final String image;
  starbucks_latest_offering_tile(
      {required this.name,
        required this.image,required this.predescription,required this.description,required this.price,required this.veg_or_non_veg});
  @override
  Widget build(BuildContext context) {
    return Padding(padding:  EdgeInsets.all(10),
        child:Container(width: double.infinity,
          decoration: BoxDecoration(color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,blurRadius: .5)],
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Container(
            height: 200,decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage( image: NetworkImage("$image"),fit: BoxFit.cover))),
    Padding(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          veg_or_non_veg !=""? SvgPicture.asset(
            vegornonveg(veg_or_non_veg),
            width: 20,
            height: 20,
          ): Container(),
          SizedBox(height: 10),
          Text("$name",style: GoogleFonts.openSans(
            textStyle:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            maxLines: 1,overflow: TextOverflow.ellipsis),
          SizedBox(height:5),
          Text("$predescription",style: GoogleFonts.openSans(
            textStyle:TextStyle(color: Colors.grey.shade800,
            fontSize: 11),),maxLines: 1,overflow: TextOverflow.ellipsis),
          SizedBox(height:8),
          Text("$description",style: GoogleFonts.openSans(
            textStyle:TextStyle(
                fontSize: 12.5),),maxLines: 2,overflow: TextOverflow.ellipsis),
         SizedBox(height:15),
         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$price",style: GoogleFonts.openSans(
            textStyle:TextStyle(fontSize: 18,fontWeight: FontWeight.w700),)),
        Container(height: 35,
          child: ElevatedButton(onPressed: (){},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade700),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                elevation: MaterialStateProperty.all<double>(2), // Elevation
              ),
              child: Text(" Add Item ",style: TextStyle(color: Colors.white),)),
        )]),
          SizedBox(height: 10,)
              ]),
    )])));
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
