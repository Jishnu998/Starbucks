import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utensils/constants.dart';

class order_expanded_tile extends StatelessWidget {
  final String veg_or_nonVeg;
  final String name;
  final String predescription;
  final String description;
  final String price;
  final String image;
  final String? soy;
  final String? milk;
  final String? wheat;
  final String? brewed_coffee;
  VoidCallback? onClick;
  order_expanded_tile(
      {required this.image,required this.veg_or_nonVeg,
        required this.name,required this.predescription,
        required this.description,required this.price, this.soy, this.milk,
         this.wheat, this.brewed_coffee,required this.onClick});
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return  Padding(padding: const EdgeInsets.only(top: 10,bottom: 10),
        child:Container(width: double.infinity,
          decoration: BoxDecoration(color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,blurRadius: .5)]),
          child: Column(children: [
            InkWell(onTap: onClick,
              child: Container(width: double.infinity,
              height: 225,decoration: BoxDecoration(
                  image: DecorationImage( image: NetworkImage("$image"),fit: BoxFit.fill))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 35),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  veg_or_nonVeg !="" ? SvgPicture.asset(
                    vegornonveg(veg_or_nonVeg),
                    width: 20,
                    height: 20,
                  ): Container(),
                  SizedBox(height: size*6),
                  Text("$name",style: GoogleFonts.openSans(
                    textStyle:TextStyle(fontSize: size*17,fontWeight: FontWeight.w700),),
                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                 merchandise_or_normal(context,predescription),
                  foodcontent(context),
                  SizedBox(height:5),
                  Text("$description",style: GoogleFonts.openSans(
                    textStyle:TextStyle(color: Colors.grey.shade800,
                        fontSize: size*12.5),)),
                  SizedBox(height:20),
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
                              // You can customize other styles as needed
                            ),
                            child: Text(" Add Item ",style: TextStyle(color: Colors.white,
                            fontSize: 14),)),
                      )  ],),
                ],),
            ),],),
        ));
  }
  Widget foodcontent(BuildContext context) {
    List<Widget> contentWidgets = [];
    if (soy == "s") {
      contentWidgets.add(
        Row(
          children: [
            Image.asset('assets/images/Soy.png',width: 10,height: 10),
            SizedBox(width: 5),
            Text("SOY",style: TextStyle(fontSize: 10),),
            SizedBox(width: 10),

          ],
        ),
      );
    }

    if (milk == "s") {
      contentWidgets.add(
        Row(
          children: [
            Image.asset('assets/images/Milk.png',width: 10,height: 10),
            SizedBox(width: 5),
            Text("MILK",style: TextStyle(fontSize: 10),),
            SizedBox(width: 10),
          ],
        ),
      );
    }

    if (brewed_coffee == "s") {
      contentWidgets.add(
        Row(
          children: [
            Text("BREWED COFFEE",style: TextStyle(fontSize: 10),),
            SizedBox(width: 10),
          ],
        ),
      );
    }

    if (wheat == "s") {
      contentWidgets.add(
        Row(
          children: [
            Image.asset('assets/images/Wheat.png',width: 10,height: 10),
            SizedBox(width: 5),
            Text("WHEAT",style: TextStyle(fontSize: 10),),
            SizedBox(width: 10),
          ],
        ),
      );
    }

    return Row(
      children: contentWidgets,
    );
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
        Text(predescription,style: GoogleFonts.openSans(
          textStyle:TextStyle(color: Colors.grey.shade800,
              fontSize: size*11),)),
        SizedBox(height:5),
      ],);}else{
      return Container();
    }
}
}
