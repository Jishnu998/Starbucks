import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starbucks/view/screens/starbucks%20gift.dart';
import 'package:starbucks/view/screens/starbucks%20home.dart';
import 'package:starbucks/view/screens/starbucks%20login.dart';
import 'package:starbucks/view/screens/starbucks%20search.dart';

import '../../utensils/constants.dart';
import 'orderpege.dart';

class starbucks_bottom_nav extends StatelessWidget {
  final _selectedIndex = 0.obs;
  final colorindex = 0.obs;
  final changeindex = 0.obs;
  final List<Widget> _screens = [
    starbuckshome(),starbucksgift(),starbuckssearchpage(),
  ];

  void _onItemTapped(int index) {
    if(index==4|| index==3){
      colorindex.value =index;
    }else{
      colorindex.value =index;
      _selectedIndex.value = index;
    }
  }
  @override
  Widget build(BuildContext context) {
    double size = constantsize(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(extendBody: true,
        body: Obx(() => _screens[_selectedIndex.value]),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: size*1,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.red,
          notchMargin: size*7,
          padding: EdgeInsets.zero,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(),
          ),
          height: size*60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Obx(() =>InkWell(
                  onTap: () { _onItemTapped(0); },
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        colorindex.value ==0 ?
                        'assets/icons/home colored.svg':'assets/icons/home.svg',
                        width: size*20,
                        height: size*20,
                      ),
                      SizedBox(height: size*5),
                      Text("Home",style: TextStyle(color: colorindex.value == 0 ? appbarcolor : Colors.grey,
                      fontSize: size*13),),
                    ],))),
              Obx(() =>InkWell(
                  onTap: () { _onItemTapped(1); },
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        colorindex.value ==1 ?
                        'assets/icons/gift colored.svg':'assets/icons/gift.svg',
                        width: size*20,
                        height: size*20,
                      ),
                      SizedBox(height: size*5),
                      Text(" Gift ",style: TextStyle(color: colorindex.value == 1 ? appbarcolor : Colors.grey,
                          fontSize: size*13),),
                    ],))),
              Obx(() =>InkWell(
                  onTap: () { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
                      orderdetailed(num: 0, initialTabIndex: 0,))); _onItemTapped(4); },
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(null,size: size*20,),
                      SizedBox(height: size*5),
                      Text("Order",style: TextStyle(color: colorindex.value == 4 ? appbarcolor : Colors.grey,
                          fontSize: size*13),),
                    ],))),
              Obx(() =>InkWell(
                  onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      starbuckslogin()));_onItemTapped(3); },
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SvgPicture.asset(
                    colorindex.value ==3 ?
                    'assets/icons/pay card colored.svg':'assets/icons/pay card.svg',
                    width: size*20,
                    height: size*20,
                    ),
                      SizedBox(height: size*5),
                      Text("Pay",style: TextStyle(color: colorindex.value == 3 ? appbarcolor : Colors.grey,
                          fontSize: size*13),),
                    ],))),
              Obx(() =>InkWell(
                  onTap: () { _onItemTapped(2); },
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        colorindex.value ==2 ?
                        'assets/icons/search colored.svg':'assets/icons/search.svg',
                        width: size*20,
                        height: size*20,
                      ),
                      SizedBox(height: size*5),
                      Text("Search",style: TextStyle(color: colorindex.value == 2 ? appbarcolor : Colors.grey,
                          fontSize: size*13),),
                    ],))),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: size*56,width: size*56,
          child: FloatingActionButton(
            shape: CircleBorder(eccentricity: 1),
            backgroundColor: Color(0xFF009865),
            hoverElevation: 0,
            splashColor: Colors.grey,
            elevation: 0,
            onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>
                orderdetailed(num: 0, initialTabIndex: 0,))); _onItemTapped(4); },
            child: SvgPicture.asset(
              'assets/icons/order icon.svg',
              width: size*35,
              height: size*35,
            )),
        )
      ),
    );
  }
}