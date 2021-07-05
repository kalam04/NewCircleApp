import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class Contact extends StatefulWidget {


  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {


  var office_Name = [
    "Savar  Office",
    "Uttara Office",
    "Ishwardi Office",
    "Motijheel Office ",
    "Joydebpur Office",
    "Rajbari Office"
  ];
  var office_Address = [
    "Unity trade Center 3rd Floor Pollibiddut Bus Stand Nabinagar,Ashulia, Savar,Dhaka-1344.",
    "Sonargaon janapath road, house-35, sector-7, Uttara.",
    "Ishwardi Sher shah road (Beltola)",
    "60/2 Purana Palton (Igloos Dream), 2nd Floor, Palton, Dhaka.",
    "Joydebpur Gazipur Habiullah sarni Road- Chandona A 131 ",
    "Rajbari Net Link ( R N L) Hirok mention 3rd floor"
  ];
  var office_Support = [
    "01962444999",
    "01962444999",
    "01944455102",
    "01777786567",
    "01944455277",
    "01944455111"
  ];
  var office_Sales = [
    "01944455012",
    "01944455090",
    "01944455102",
    "01944455043",
    "01944455277",
    "01944455111"
  ];

  var data_address;

  Future getvalueAdress()async{
    var response= await http.get(Uri.parse("http://circleapp-backend.herokuapp.com/office-address?"));
    setState(() {
      var decode=json.decode(response.body);
      data_address=decode;
      //print(a);
      //debugPrint('x=$x');

    });
  }

  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(data_address.length);
    Size size = MediaQuery.of(context).size;
    var w = MediaQuery.of(context).size.width;
    var x = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      // if (data_address == null || data_address.length == 0) {
        return Scaffold(
          appBar:PreferredSize(preferredSize: Size.fromHeight(x / 15),
              child: new AppBar(title: new Text('Contact', style: TextStyle(fontSize: x / 30,color: Colors.black),),
                centerTitle: true,
                iconTheme: IconThemeData(
                    color: Colors.black //change your color here
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset("assets/images/cn.png"),
                  )
                ],
                backgroundColor: Colors.blueGrey[100],
                leadingWidth: 30,

              )),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.blueGrey[100],
                  width: size.width,
                  height: size.height/15,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [

                      Container(
                        width: size.width,
                        height: size.height/15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.home,
                                color: currentIndex == 0
                                    ? Colors.orange
                                    : Colors.grey[400],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              },
                              splashColor: Colors.white,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.call,
                                  color: currentIndex == 1
                                      ? Colors.orange
                                      : Colors.grey[400],
                                ),
                                onPressed: () {

                                  launch("tel:+09611800900");

                                }),
                            // Container(
                            //   width: size.width * 0.20,
                            // ),
                            IconButton(
                                icon: Icon(
                                  Icons.camera,
                                  color: currentIndex == 2
                                      ? Colors.orange
                                      : Colors.grey[400],
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                                }),
                            IconButton(
                                icon: Icon(
                                  Icons.payment,
                                  color: currentIndex == 3
                                      ? Colors.orange
                                      : Colors.grey[400],
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                height: size.height-(size.height/15+size.height/15
                    +MediaQuery.of(context).padding.top),
                width: size.width,
                child: Container(
                  child: ListView.builder(
                      itemCount: office_Name.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(w / 20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(-3, -3),
                                    color: Color(0xffEBEBEB),
                                    spreadRadius: 6,
                                    blurRadius: 6)
                              ],
                              borderRadius: BorderRadius.circular(15),
                              //color: Colors.cyan[200]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    office_Name[index].toString(),
                                    style: new TextStyle(
                                      fontFamily: 'Ubuntu-Regular',
                                      fontSize: w / 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                  child: Container(
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5)),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    office_Address[index].toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: w / 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Support : " +
                                            office_Support[index].toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: w / 22,
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sales : " + office_Sales[index].toString(),
                                    style: TextStyle(
                                      fontSize: w / 22,
                                      color: Colors.black,

                                      //decoration: TextDecoration.lineThrough
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: w / 50),
                                        child: RaisedButton(
                                          child: Text("Call Support",
                                              style: TextStyle(fontSize: w / 20)),
                                          onPressed: () {
                                            launch("tel:+88" + office_Support[index]);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.black)),
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: w / 50),
                                        child: RaisedButton(
                                          child: Text(
                                            "Call Sales",
                                            style: TextStyle(fontSize: w / 20),
                                          ),
                                          onPressed: () {
                                            launch("tel:+88" + office_Sales[index]);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.black)),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          drawer: SafeArea(child: mainDrawer()),
        );
      // } else {
      //   return Scaffold(
      //     appBar:PreferredSize(preferredSize: Size.fromHeight(x / 15),
      //         child: new AppBar(title: new Text('Contact', style: TextStyle(fontSize: x / 30,color: Colors.black),),
      //           centerTitle: true,
      //           iconTheme: IconThemeData(
      //               color: Colors.black //change your color here
      //           ),
      //           actions: [
      //             Padding(
      //               padding: const EdgeInsets.only(right: 5.0),
      //               child: Image.asset("assets/images/cn.png"),
      //             )
      //           ],
      //           backgroundColor: Colors.blueGrey[100],
      //           leadingWidth: 30,
      //
      //         )),
      //     body: Stack(
      //       children: [
      //         Positioned(
      //           bottom: 0,
      //           left: 0,
      //           child: Container(
      //             color: Colors.blueGrey[100],
      //             width: size.width,
      //             height: size.height/15,
      //             child: Stack(
      //               overflow: Overflow.visible,
      //               children: [
      //                 Container(
      //                   width: size.width,
      //                   height: size.height/15,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       IconButton(
      //                         icon: Icon(
      //                           Icons.home,
      //                           color: currentIndex == 0
      //                               ? Colors.orange
      //                               : Colors.grey[400],
      //                         ),
      //                         onPressed: () {
      //                           Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                                 builder: (context) => Home()),
      //                           );
      //                         },
      //                         splashColor: Colors.white,
      //                       ),
      //                       IconButton(
      //                           icon: Icon(
      //                             Icons.call,
      //                             color: currentIndex == 1
      //                                 ? Colors.orange
      //                                 : Colors.grey[400],
      //                           ),
      //                           onPressed: () {
      //
      //                             launch("tel:+09611800900");
      //
      //                           }),
      //                       // Container(
      //                       //   width: size.width * 0.20,
      //                       // ),
      //                       IconButton(
      //                           icon: Icon(
      //                             Icons.camera,
      //                             color: currentIndex == 2
      //                                 ? Colors.orange
      //                                 : Colors.grey[400],
      //                           ),
      //                           onPressed: () {
      //                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
      //                           }),
      //                       IconButton(
      //                           icon: Icon(
      //                             Icons.payment,
      //                             color: currentIndex == 3
      //                                 ? Colors.orange
      //                                 : Colors.grey[400],
      //                           ),
      //                           onPressed: () {
      //                             Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
      //                           }),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           top: 0,
      //           left: 0,
      //           height: size.height-(size.height/15+size.height/15
      //               +MediaQuery.of(context).padding.top),
      //           width: size.width,
      //           child: Container(
      //             child: ListView.builder(
      //                 itemCount: data_address.length,
      //                 itemBuilder: (context, index) {
      //                   return Padding(
      //                     padding: const EdgeInsets.all(20.0),
      //                     child: Container(
      //                       padding: EdgeInsets.all(5),
      //                       decoration: BoxDecoration(
      //                         boxShadow: [
      //                           BoxShadow(
      //                               offset: Offset(-3, -3),
      //                               color: Color(0xffEBEBEB),
      //                               spreadRadius: 6,
      //                               blurRadius: 6)
      //                         ],
      //                         borderRadius: BorderRadius.circular(15),
      //                         //color: Colors.cyan[200]
      //                       ),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Container(
      //                             alignment: Alignment.center,
      //                             child: Text(
      //                               data_address[index]["office"].toString(),
      //                               style: new TextStyle(
      //                                 fontFamily: 'Ubuntu-Regular',
      //                                 fontSize: w / 12,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.deepPurple,
      //                               ),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      //                             child: Container(
      //                               height: 2,
      //                               decoration: BoxDecoration(
      //                                   color: Colors.grey.withOpacity(0.5)),
      //                             ),
      //                           ),
      //                           Container(
      //                             alignment: Alignment.center,
      //                             child: Text(
      //                               data_address[index]["address"].toString(),
      //                               style: TextStyle(
      //                                   color: Colors.black, fontSize: w / 20),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top: 10.0),
      //                             child: Container(
      //                               alignment: Alignment.center,
      //                               child: Text(
      //                                   "Support : " +
      //                                       data_address[index]["support"]
      //                                           .toString(),
      //                                   style: TextStyle(
      //                                     color: Colors.black,
      //                                     fontSize: w / 22,
      //                                   ),
      //                                   textAlign: TextAlign.center),
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top: 5.0),
      //                           ),
      //                           Container(
      //                             alignment: Alignment.center,
      //                             child: Text(
      //                               "Sales : " +
      //                                   data_address[index]["sales"]
      //                                       .toString(),
      //                               style: TextStyle(
      //                                 fontSize: w / 22,
      //                                 color: Colors.black,
      //
      //                                 //decoration: TextDecoration.lineThrough
      //                               ),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ),
      //                           Container(
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Padding(
      //                                   padding: EdgeInsets.only(left: w / 40),
      //                                   child: RaisedButton(
      //                                     child: Text("Call Support",
      //                                         style: TextStyle(fontSize: w / 25)),
      //                                     onPressed: () {
      //                                       launch("tel:" +
      //                                           data_address[index]
      //                                               ["support"]);
      //                                     },
      //                                     shape: RoundedRectangleBorder(
      //                                         borderRadius:
      //                                             BorderRadius.circular(18.0),
      //                                         side: BorderSide(color: Colors.black)),
      //                                     color: Colors.white70,
      //                                   ),
      //                                 ),
      //                                 Padding(padding: EdgeInsets.only(left: w / 70)),
      //                                 Padding(
      //                                   padding: EdgeInsets.only(right: w / 40),
      //                                   child: RaisedButton(
      //                                     child: Text(
      //                                       "Call Sales",
      //                                       style: TextStyle(fontSize: w / 25),
      //                                     ),
      //                                     onPressed: () {
      //                                       launch("tel:" +
      //                                           data_address[index]["sales"]);
      //                                     },
      //                                     shape: RoundedRectangleBorder(
      //                                         borderRadius:
      //                                             BorderRadius.circular(18.0),
      //                                         side: BorderSide(color: Colors.black)),
      //                                     color: Colors.white,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 }),
      //           ),
      //         ),
      //       ],
      //     ),
      //     drawer: SafeArea(child: mainDrawer()),
      //   );
      // }
    } else {
      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      // if (data_address == null || data_address.length == 0) {
        return  Scaffold(
            appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),
                child: new AppBar(
                  iconTheme: IconThemeData(
                      color: Colors.black //change your color here
                  ),
                  actions: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 5.0),
                    //   child: Image.asset("assets/images/cn.png"),
                    // )
                  ],

                  title: new Text('Contact', style: TextStyle(fontSize: w / 30,color: Colors.black),),
                  centerTitle: true,
                  leadingWidth: 30,backgroundColor: Colors.blueGrey[100],)),
            body: Stack(
              children: [
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   child: Container(
                //     color: Colors.blueGrey[100],
                //     width: size.width,
                //     height: size.height/9,
                //     child: Stack(
                //       overflow: Overflow.visible,
                //       children: [
                //
                //         Container(
                //           width: size.width,
                //           height: size.height/9,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               RaisedButton(
                //                 elevation: 0,
                //                 disabledColor: Colors.transparent,
                //                 child: IconButton(
                //                   icon: Icon(
                //                     Icons.home,
                //                     color: currentIndex == 0
                //                         ? Colors.black
                //                         : Colors.grey[400],
                //                   ),
                //                   onPressed: () {
                //                     Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                           builder: (context) => Home()),
                //                     );
                //                   },
                //                   splashColor: Colors.white,
                //                 ),
                //               ),
                //               RaisedButton(
                //                 elevation: 0,
                //                 disabledColor: Colors.transparent,
                //                 child: IconButton(
                //                     icon: Icon(
                //                       Icons.call,
                //                       color: currentIndex == 1
                //                           ? Colors.orange
                //                           : Colors.grey[400],
                //                     ),
                //                     onPressed: () {
                //                       launch("tel:+09611800900");
                //                     }),
                //               ),
                //               // Container(
                //               //   width: size.width * 0.20,
                //               // ),
                //               RaisedButton(
                //                 elevation: 0,
                //                 disabledColor: Colors.transparent,
                //                 child: IconButton(
                //                     icon: Icon(
                //                       Icons.camera,
                //                       color: currentIndex == 2
                //                           ? Colors.orange
                //                           : Colors.grey[400],
                //                     ),
                //                     onPressed: () {
                //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
                //                     }),
                //               ),
                //               RaisedButton(
                //                 elevation: 0,
                //                 disabledColor: Colors.transparent,
                //                 child: IconButton(
                //                     icon: Icon(
                //                       Icons.payment,
                //                       color: currentIndex == 3
                //                           ? Colors.orange
                //                           : Colors.grey[400],
                //                     ),
                //                     onPressed: () {
                //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
                //                     }),
                //               ),
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 0,
                  left: 0,
                  height: size.height-(size.height/9),
                  width: size.width,
                  child: Container(
                    child: ListView.builder(
                        itemCount: office_Name.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                            child: InkWell(
                              onTap: (){
                                Toast.show("Please Use Phone To Call", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       offset: Offset(-3, -3),
                                    //       color: Color(0xffEBEBEB),
                                    //       spreadRadius: 6,
                                    //       blurRadius: 6)
                                    // ],
                                    borderRadius: BorderRadius.circular(15),
                                    //color: Colors.cyan[200]
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          office_Name[index].toString(),
                                          style: new TextStyle(
                                            fontFamily: 'Ubuntu-Regular',
                                            fontSize: w / 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepPurple,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                        child: Container(
                                          height: 2,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.5)),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          office_Address[index].toString(),
                                          style: TextStyle(
                                              color: Colors.black, fontSize: w / 35),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "Support : " +
                                                  office_Support[index].toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: w / 37,
                                              ),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Sales : " + office_Sales[index].toString(),
                                          style: TextStyle(
                                            fontSize: w / 37,
                                            color: Colors.black,

                                            //decoration: TextDecoration.lineThrough
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // Container(
                                      //
                                      //   child: Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Padding(
                                      //         padding: EdgeInsets.only(left: w / 50),
                                      //         child: RaisedButton(
                                      //           child: Text("Call Support",
                                      //               style: TextStyle(fontSize: w / 25)),
                                      //           // onPressed: () {
                                      //           //   launch("tel:+88" + office_Support[index]);
                                      //           // },
                                      //           shape: RoundedRectangleBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(18.0),
                                      //               side: BorderSide(color: Colors.black)),
                                      //           color: Colors.white70,
                                      //         ),
                                      //       ),
                                      //       Padding(
                                      //         padding: EdgeInsets.only(right: w / 50),
                                      //         child: Container(
                                      //           //width: size.width/5,
                                      //           child: RaisedButton(
                                      //
                                      //             child: Text(
                                      //               "Call Sales",
                                      //               style: TextStyle(fontSize: w / 25),
                                      //             ),
                                      //             // onPressed: () {
                                      //             //   launch("tel:+88" + office_Sales[index]);
                                      //             // },
                                      //             shape: RoundedRectangleBorder(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(18.0),
                                      //                 side: BorderSide(color: Colors.black)),
                                      //             color: Colors.white,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
            drawer: SafeArea(child: mainDrawer()),

        );
      // } else {
      //   return Scaffold(
      //     appBar: PreferredSize(preferredSize: Size.fromHeight(size.height/9),
      //         child: new AppBar(
      //           iconTheme: IconThemeData(
      //               color: Colors.black //change your color here
      //           ),
      //           actions: [
      //             Padding(
      //               padding: const EdgeInsets.only(right: 5.0),
      //               child: Image.asset("assets/images/cn.png"),
      //             )
      //           ],
      //
      //           title: new Text('Contact', style: TextStyle(fontSize: w / 30,color: Colors.black),),
      //           centerTitle: true,
      //           leadingWidth: 30,backgroundColor: Colors.blueGrey[100],)),
      //     body: Stack(
      //       children: [
      //         Positioned(
      //           bottom: 0,
      //           left: 0,
      //           child: Container(
      //             color: Colors.blueGrey[100],
      //             width: size.width,
      //             height: size.height/9,
      //             child: Stack(
      //               overflow: Overflow.visible,
      //               children: [
      //
      //                 Container(
      //                   width: size.width,
      //                   height: size.height/9,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       RaisedButton(
      //                         elevation: 0,
      //                         disabledColor: Colors.transparent,
      //                         child: IconButton(
      //                           icon: Icon(
      //                             Icons.home,
      //                             color: currentIndex == 0
      //                                 ? Colors.black
      //                                 : Colors.grey[400],
      //                           ),
      //                           onPressed: () {
      //                             Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                   builder: (context) => Home()),
      //                             );
      //                           },
      //                           splashColor: Colors.white,
      //                         ),
      //                       ),
      //                       RaisedButton(
      //                         elevation: 0,
      //                         disabledColor: Colors.transparent,
      //                         child: IconButton(
      //                             icon: Icon(
      //                               Icons.call,
      //                               color: currentIndex == 1
      //                                   ? Colors.orange
      //                                   : Colors.grey[400],
      //                             ),
      //                             onPressed: () {
      //                               launch("tel:+09611800900");
      //                             }),
      //                       ),
      //                       // Container(
      //                       //   width: size.width * 0.20,
      //                       // ),
      //                       RaisedButton(
      //                         elevation: 0,
      //                         disabledColor: Colors.transparent,
      //                         child: IconButton(
      //                             icon: Icon(
      //                               Icons.camera,
      //                               color: currentIndex == 2
      //                                   ? Colors.orange
      //                                   : Colors.grey[400],
      //                             ),
      //                             onPressed: () {
      //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Packages()));
      //                             }),
      //                       ),
      //                       RaisedButton(
      //                         elevation: 0,
      //                         disabledColor: Colors.transparent,
      //                         child: IconButton(
      //                             icon: Icon(
      //                               Icons.payment,
      //                               color: currentIndex == 3
      //                                   ? Colors.orange
      //                                   : Colors.grey[400],
      //                             ),
      //                             onPressed: () {
      //                               Navigator.push(context, MaterialPageRoute(builder: (context)=>bkashPayment()));
      //                             }),
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           top: 0,
      //           left: 0,
      //           height: size.height-(size.height/9+size.height/9),
      //           width: size.width,
      //           child: Container(
      //             child: ListView.builder(
      //                 itemCount: data_address.length,
      //                 itemBuilder: (context, index) {
      //                   return Padding(
      //                     padding: const EdgeInsets.fromLTRB(100, 20.0, 100, 20),
      //                     child: Container(
      //                       padding: EdgeInsets.all(5),
      //                       decoration: BoxDecoration(
      //                         boxShadow: [
      //                           BoxShadow(
      //                               offset: Offset(-3, -3),
      //                               color: Color(0xffEBEBEB),
      //                               spreadRadius: 6,
      //                               blurRadius: 6)
      //                         ],
      //                         borderRadius: BorderRadius.circular(15),
      //                         //color: Colors.cyan[200]
      //                       ),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Container(
      //                             alignment: Alignment.center,
      //                             child: Text(
      //                               data_address[index]["office"].toString(),
      //                               style: new TextStyle(
      //                                 fontFamily: 'Ubuntu-Regular',
      //                                 fontSize: w / 20,
      //                                 fontWeight: FontWeight.bold,
      //                                 color: Colors.deepPurple,
      //                               ),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      //                             child: Container(
      //                               height: 2,
      //                               decoration: BoxDecoration(
      //                                   color: Colors.grey.withOpacity(0.5)),
      //                             ),
      //                           ),
      //                           Container(
      //                             alignment: Alignment.center,
      //                             child: Text(
      //                               data_address[index]["address"].toString(),
      //                               style: TextStyle(
      //                                   color: Colors.black, fontSize: w / 35),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top: 10.0),
      //                             child: Container(
      //                               alignment: Alignment.center,
      //                               child: Text(
      //                                   "Support : " +
      //                                       data_address[index]["support"]
      //                                           .toString(),
      //                                   style: TextStyle(
      //                                     color: Colors.black,
      //                                     fontSize: w / 37,
      //                                   ),
      //                                   textAlign: TextAlign.center),
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: const EdgeInsets.only(top: 5.0),
      //                           ),
      //                           Container(
      //                             alignment: Alignment.center,
      //                             child: Text(
      //                               "Sales : " +
      //                                   data_address[index]["sales"]
      //                                       .toString(),
      //                               style: TextStyle(
      //                                 fontSize: w / 37,
      //                                 color: Colors.black,
      //
      //                                 //decoration: TextDecoration.lineThrough
      //                               ),
      //                               textAlign: TextAlign.center,
      //                             ),
      //                           ),
      //                           Container(
      //                             child: Row(
      //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 Padding(
      //                                   padding: EdgeInsets.only(left: w / 40),
      //                                   child: RaisedButton(
      //                                     child: Text("Call Support",
      //                                         style: TextStyle(fontSize: w / 25)),
      //                                     onPressed: () {
      //                                       launch("tel:" +
      //                                           data_address[index]
      //                                               ["support"]);
      //                                     },
      //                                     shape: RoundedRectangleBorder(
      //                                         borderRadius:
      //                                             BorderRadius.circular(18.0),
      //                                         side: BorderSide(color: Colors.black)),
      //                                     color: Colors.white70,
      //                                   ),
      //                                 ),
      //                                 Padding(padding: EdgeInsets.only(left: w / 70)),
      //                                 Padding(
      //                                   padding: EdgeInsets.only(right: w / 40),
      //                                   child: RaisedButton(
      //                                     child: Text(
      //                                       "Call Sales",
      //                                       style: TextStyle(fontSize: w / 25),
      //                                     ),
      //                                     onPressed: () {
      //                                       launch("tel:" +
      //                                           data_address[index]["sales"]);
      //                                     },
      //                                     shape: RoundedRectangleBorder(
      //                                         borderRadius:
      //                                             BorderRadius.circular(18.0),
      //                                         side: BorderSide(color: Colors.black)),
      //                                     color: Colors.white,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 }),
      //           ),
      //         ),
      //       ],
      //     ),
      //     drawer: SafeArea(child: mainDrawer()),
      //   );
      // }
    }
  }
}
