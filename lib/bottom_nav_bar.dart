import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobza/search_screen.dart';
import 'package:kobza/main_screen.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

int select = 0;
int pageSelectedOnChange = 0;

class _BottomNavBarState extends State<BottomNavBar> {
  Widget Bottoms(String label,int count,IconData iconData){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pageSelectedOnChange == count
                  ? Theme.of(context).hintColor
                  : Colors.transparent),
          child: IconButton(
            onPressed: () {
              if (count == 0) {
                setState(() {
                  select = count;
                });
                pageController.animateToPage(count,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease);

              }
          else    if (count == 1) {
                setState(() {
                  select = count;
                });
                pageController.animateToPage(count,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease);

              }
           else   if (count == 2) {
                setState(() {
                  select = count;
                });
                pageController.animateToPage(count,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.ease);

              }
             //  if(select==1){
             //    Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
             //  }
             // else if(select==2){
             //    Navigator.of(context).pushReplacementNamed(Search.routeName);
             //  }
            },
            iconSize: 35,
            icon: Icon(

              iconData,
              color: pageSelectedOnChange == count
                  ? Colors.white
                  : Theme.of(context).hintColor,
            ),
          ),
        ),

        Text(
          label,
          style: Theme.of(context).textTheme.headline3,
        )
      ],
    );

  }
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor:Color.fromRGBO(190, 166, 138, 1),

      body:   PageView(
        onPageChanged: (value) {
          setState(() {
            pageSelectedOnChange=value;

          });
        },
          pageSnapping: true,
          allowImplicitScrolling: true,
          controller: pageController,
          children: [
            MainScreen(),
            Search(),
            Container()
          ],
        ),










      // body:select==1? MainScreen():select==2?Search(): select==3?Container():Text(''),









      bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 20,right: 20,bottom: 15),
          width: mediaQuery.width * 0.2,
          height:
          isLandScape ? mediaQuery.height * 0.26 : mediaQuery.height * 0.13,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  Bottoms('الصفحة الرأيسية',0,MdiIcons.home ),
             if(isLandScape) SizedBox(height: 10,),
                    Bottoms('البحث',1, LineIcons.search),
                 isLandScape?Container(): SizedBox(height: 9,),
                  Bottoms('منشوراتي',2, LineIcons.user)


            ],
          )
      ),
    );
  }
}
