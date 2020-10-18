import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kobza/bottom_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatelessWidget {
  static var routeName = 'main_screen';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor:Color.fromRGBO(190, 166, 138, 1),
        body: SingleChildScrollView(
          child: Container(
            width: mediaQuery.width,
            height: mediaQuery.height,
            child: Stack(
              children: [
                Container(
                  color: Theme.of(context).accentColor,
                  width: mediaQuery.width,
                  height:isLandScape?mediaQuery.height*0.4: mediaQuery.height*0.2,

                 ),
                Positioned(
                        top: 25,
                        right: 20,
                        child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/list.png',
                              fit: BoxFit.fill,
                              width: 50,
                              height: 40,
                            )),
                      ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Image.asset(
                    'assets/images/خبزة.png',
                    fit: BoxFit.fill,
                    width: 90,
                    height: 50,
                  ),
                ),
                Positioned(
                  bottom:isLandScape?5: 50,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(190, 166, 138, 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))
                    ),
                    width:mediaQuery.width,
                    height:isLandScape?mediaQuery.height*0.75: mediaQuery.height*0.8,
                    child: Column(
                      children: [
                        Text('اخر المنشورات',style: Theme.of(context).textTheme.headline2,),
                        Container(
                          // color: Colors.white,
                          width: mediaQuery.width,
                          height: mediaQuery.height*0.5,
                        ),

                      ],
                    ),

                  ),
                ),

              ],
            ),
          ),
        )


        // Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/main.png'),
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     child: Center(
        //       child: Stack(
        //         children: [
        //           Positioned(
        //             top: 25,
        //             right: 20,
        //             child: InkWell(
        //                 onTap: () {},
        //                 child: Image.asset(
        //                   'assets/images/list.png',
        //                   fit: BoxFit.fill,
        //                   width: 50,
        //                   height: 40,
        //                 )),
        //           ),

        //           Positioned(
        //               bottom: 65,
        //               right: 69,
        //               child: Opacity(
        //                 opacity: 0.0,
        //                 child: RaisedButton(
        //                   onPressed: () {
        //
        //                   },
        //                   padding:
        //                   EdgeInsets.symmetric(horizontal: 70.5, vertical: 7),
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(20),
        //                       side: BorderSide(width: 1.5, color: Colors.white)),
        //                   child: new Text(
        //                     "تخطي",
        //                     style: TextStyle(fontSize: 30, color: Colors.pink),
        //                   ),
        //                 ),
        //               )),
        //           Positioned(
        //             top: 135,
        //             bottom:100,
        //             right: 70,
        //             left: 100,
        //             child: Text('اخر المنشورات',style: Theme.of(context).textTheme.headline2,),
        //           ),
        //           Positioned(
        //               top: 170,
        //               bottom:100,
        //               right: 30,
        //               left: 30,
        //               child: Opacity(
        //                   opacity: 1.0,
        //                   child:Container(
        //                     decoration: BoxDecoration(
        //
        //                         color: Colors.white,
        //                         borderRadius: BorderRadius.circular(15)
        //                     ),
        //
        //                     child: Column(
        //                       children: [
        //                         Text('dsadca',style: Theme.of(context).textTheme.headline3,)
        //                       ],
        //                     ),
        //                   ))
        //           ),
        //
        //         ],
        //       ),
        //     )),
      // bottomNavigationBar: BottomNavBar(),

        );
  }
}
