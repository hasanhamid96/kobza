import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  static var routeName = 'search';

  Search({
    Key key,
  }) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int Select;
  bool isSelected = false;
  String values;
  bool isSearching=false;



  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 166, 138, 1),
      body: Container(
        height: isLandScape ? mediaQuery.height * 1.2 : mediaQuery.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          height:
              isLandScape ? mediaQuery.height * 1.2 : mediaQuery.height * 0.9,
          child: Center(
            child: Stack(
              overflow: Overflow.visible,
              children: [

                //list
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

                //خبزة
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

                //back رجوع
                Positioned(

                  top: 80,
                  child: FlatButton.icon(

                      onPressed: () {
                        setState(() {
                          isSelected=false;
                          isSearching=false;
                          Select=null;
                          values=null;
                        });

                      },
                      icon: Icon(Icons.arrow_back,
                        size: 40,
                        color: Theme.of(context).hintColor,
                      ),
                      label: Text(
                        'رجوع',
                        style: Theme.of(context).textTheme.headline5,
                      )),
                ),

                //button تاكيد+ابحث
                if(!isSearching)
                Positioned(
                  left: isLandScape ? 250 : 100,
                  right: isLandScape ? 250 : 100,
                  top: isLandScape ? 40 : null,
                  bottom: isLandScape ? null : 2,
                  child: RaisedButton(

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      if (Select != null) {
                        setState(() {
                          isSelected = true;
                        });

                        if(values!=null){
                          setState(() {
                            isSearching=true;
                          });
                        }

                      } else if (Select == null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                'أختار نوع العمل ',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            );
                          },
                        );
                      }
                    },
                    color: Theme.of(context).hintColor,
                    child: Text(
                     isSelected?'أبحث' :'تأكيد',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),

                //loading
                if(isSearching)
                  Positioned(
                    left: 160,
                    bottom: 250,
                      child: CircularProgressIndicator()),

                //dropdownButton
                if(!isSearching&&isSelected)
                     Positioned(
                  left:isLandScape?130: 80,
                    right:isLandScape?130: 80,
                    top:isLandScape?110: 300,
                    bottom:isLandScape?100: 300,
                    child:  DropdownButtonHideUnderline(
                  child: Container(

                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),

                    child: DropdownButton(
                      elevation: 10,
                      iconSize: 50,

                      isDense: true,
                      hint: Text('الكل',style: Theme.of(context).textTheme.headline3,),
                      value:values ,
                      items:['بغداد','بصرة','الموصل'].map<DropdownMenuItem>((accountNumber) {
                        return DropdownMenuItem(

                          child: Center(
                            child: Text(
                              accountNumber,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ),
                          value: accountNumber,
                        );
                      }).toList(),
                      isExpanded: true,
                      onChanged: (selectedItem) => setState((){
                          values=selectedItem;
                      }),
                    )))),

                //tools
                if(!isSearching&&!isSelected)
                      Positioned(
                        top: 90,
                        bottom: isLandScape ? 20 : 50,
                        right: 15,
                        left: 15,
                        child: Opacity(
                            opacity: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black87),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              width: 400,
                              height: 450,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      'نوع العمل',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.spaceAround,
                                      spacing: 20,
                                      runSpacing: 20,
                                      children: [
                                        for (int i = 0; i < 12; i++)
                                          wrap(nameOfJob[i], i, toolsOfJob[i]),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))),
              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar:BottomNavBar() ,
    );
  }

  List<String> nameOfJob = [
    'نجار',
    'عامل بناء',
    'حداد',
    'كهربائي',
    'عامل توصيل',
    'فيتر',
    'مصلح درجات',
    'مصلح سبالت',
    'صباغ',
    'سباك',
    'مدرس خصوصي',
    'اشغال اخرى'
  ];

  List<String> toolsOfJob = [
    'assets/images/tools/نجار.png',
    'assets/images/tools/عامل بناء.png',
    'assets/images/tools/حداد.png',
    'assets/images/tools/كهربائي.png',
    'assets/images/tools/عامل توصيل.png',
    'assets/images/tools/فيتر.png',
    'assets/images/tools/مصلح دراجات.png',
    'assets/images/tools/مصلح سبالت.png',
    'assets/images/tools/صباغ.png',
    'assets/images/tools/سباك.png',
    'assets/images/tools/مدرس خصوصي.png',
    'assets/images/tools/اعمال اخرى.png'
  ];

  Widget wrap(String jobs, int index, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Select = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
                border: Border.all(
                    color:
                        index == Select ? Colors.black87 : Colors.transparent),
                color: index == Select
                    ? Theme.of(context).accentColor
                    : Color(0xddddddE2),
                borderRadius: BorderRadius.circular(20)),
            width: 80,
            height: 80,
            child: Image.asset(
              image,
              width: 30,
              height: 30,
            ),
          ),
          Text(
            '$jobs',
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    );
  }
}
