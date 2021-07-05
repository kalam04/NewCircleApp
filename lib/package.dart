import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'offer.dart';

class Packages extends StatefulWidget {



  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {

  var pack_name=["Premium","Silver","Gold","Diamond","Platinum","Corporate-I","Corporate-II","Corporate-III","VIP-I","VIP-III",];
  var pack_mbps=["10","15","20","25","30","35","40","45","50","55",];
  var pack_tk=["800","1000","1200","1500","2000","2500","3000","3500","4000","4500",];

  TextEditingController _name,_mobile,_address;
  bool _validate = false;

  var data;

  Future getvalue()async{
    var response= await http.get(Uri.parse("http://circleapp-backend.herokuapp.com/packages?"));
    setState(() {
      var decode=json.decode(response.body);
      data=decode;
      //print(a);
      //debugPrint('x=$x');

    });
  }

  int currentIndex = 2;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _name = new TextEditingController();
    // _mobile = new TextEditingController();
    // _address = new TextEditingController();
    // this.getvalue();
    //this.getvalue();


  }





  @override
  Widget build(BuildContext context) {
    var a=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    var w = MediaQuery.of(context).size.width;



    AppBar appBar_Protrait=AppBar(
      title: Text('Packages',style: TextStyle(fontSize: x/30),),
      backgroundColor: Colors.lightGreen[400],
      centerTitle: true,
      leadingWidth: 30,
    );
    AppBar appBar_Landscope=AppBar(
      title: Text('Packages',style: TextStyle(fontSize: a/30),),
      backgroundColor: Colors.lightGreen[400],
      centerTitle: true,
      leadingWidth: 30,
    );

    if(MediaQuery.of(context).orientation==Orientation.portrait){
      // if(data==null||data.length==0){
        // print("work");
        return Scaffold(
          appBar:PreferredSize(preferredSize: Size.fromHeight(x / 15),
              child: new AppBar(title: new Text('Packages', style: TextStyle(fontSize: x / 30,color: Colors.black),),
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

                  color: Colors.transparent,
                  child: Container(
                    child: ListView.builder(

                        itemCount: pack_name.length,
                        itemBuilder: (context, index){
                          return
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(-3, -3),
                                          color: Color(0xffA2CAEF).withOpacity(0.2),
                                          spreadRadius: 6,
                                          blurRadius: 6)
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xffd2d2d2).withOpacity(0.6),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color(0xffc0c0c0),
                                          Color(0xffFFFEDC),
                                          //Color(0xffFFA500)
                                        ])
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(pack_name[index], style: TextStyle(
                                            color: Colors.purple[900],
                                            fontSize: a/10,
                                            fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        children: [
                                          Text(pack_mbps[index], style: TextStyle(
                                              color: Colors.purple[900],
                                              fontWeight: FontWeight.bold,fontSize: a/4.toDouble()),

                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,

                                              children: [
                                                Container(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Text("Mbps", style: TextStyle(
                                                      color: Colors.black,

                                                      fontWeight: FontWeight.bold,fontSize: a/11),

                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Unlimited ", style: TextStyle(
                                                      color: Colors.grey,

                                                      fontWeight: FontWeight.bold,fontSize: a/16),

                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),

                                    ),

                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(pack_tk[index]+" TK/month", style: TextStyle(
                                        fontSize: a/14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        //decoration: TextDecoration.lineThrough
                                      ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: (){

                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));

                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(-5, -3),
                                                    color: Colors.white.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 5)
                                              ],
                                              gradient: LinearGradient(
                                                  colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: Text(
                                            "Get Now",
                                            style: TextStyle(
                                                fontSize: a/22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],

                                ),
                              ),
                            );
                        }
                    ),
                  ),
                ),
              ),
            ],
          ),
          drawer: mainDrawer(),
        );
      // }else{
      //   return Scaffold(
      //     appBar:PreferredSize(preferredSize: Size.fromHeight(x / 15),
      //         child: new AppBar(title: new Text('Packages', style: TextStyle(fontSize: x / 30,color: Colors.black),),
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
      //
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
      //
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
      //
      //             color: Colors.transparent,
      //             child: Container(
      //               child: ListView.builder(
      //
      //                   itemCount: data.length,
      //                   itemBuilder: (context, index){
      //                     return
      //                       Padding(
      //                         padding: const EdgeInsets.all(15.0),
      //                         child: Container(
      //                           padding: EdgeInsets.all(15),
      //                           decoration: BoxDecoration(
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                     offset: Offset(-3, -3),
      //                                     color: Color(0xffA2CAEF).withOpacity(0.2),
      //                                     spreadRadius: 6,
      //                                     blurRadius: 6)
      //                               ],
      //                               borderRadius: BorderRadius.circular(15),
      //                               color: Color(0xffd2d2d2).withOpacity(0.6),
      //                               gradient: LinearGradient(
      //                                   begin: Alignment.topRight,
      //                                   end: Alignment.bottomLeft,
      //                                   colors: [
      //                                     Color(0xffc0c0c0),
      //                                     Color(0xffFFFEDC),
      //                                     //Color(0xffFFA500)
      //                                   ])
      //                           ),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Padding(
      //                                 padding: const EdgeInsets.only(left: 10.0),
      //                                 child: Container(
      //                                   alignment: Alignment.center,
      //                                   child: Text(data[index]["name"], style: TextStyle(
      //                                       color: Colors.purple[900],
      //                                       fontSize: a/10,
      //                                       fontWeight: FontWeight.bold),
      //                                     textAlign: TextAlign.center,
      //                                   ),
      //                                 ),
      //                               ),
      //                               Padding(
      //                                 padding: const EdgeInsets.only(top: 8.0),
      //                                 child: Row(
      //                                   children: [
      //                                     Text(data[index]["band"].toString(), style: TextStyle(
      //                                         color: Colors.purple[900],
      //                                         fontWeight: FontWeight.bold,fontSize: a/4.toDouble()),
      //
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.all(8.0),
      //                                       child: Column(
      //                                         crossAxisAlignment: CrossAxisAlignment.start,
      //
      //                                         children: [
      //                                           Container(
      //                                             alignment: Alignment.bottomLeft,
      //                                             child: Text("Mbps", style: TextStyle(
      //                                                 color: Colors.black,
      //
      //                                                 fontWeight: FontWeight.bold,fontSize: a/11),
      //
      //                                             ),
      //                                           ),
      //                                           Container(
      //                                             alignment: Alignment.topLeft,
      //                                             child: Text("Unlimited ", style: TextStyle(
      //                                                 color: Colors.grey,
      //
      //                                                 fontWeight: FontWeight.bold,fontSize: a/16),
      //
      //                                             ),
      //                                           ),
      //
      //                                         ],
      //                                       ),
      //                                     ),
      //
      //                                   ],
      //                                 ),
      //                               ),
      //                               Padding(
      //                                 padding: const EdgeInsets.only(top: 2.0),
      //
      //                               ),
      //
      //                               Container(
      //                                 alignment: Alignment.center,
      //                                 child: Text(data[index]["price"].toString()+" TK/month", style: TextStyle(
      //                                   fontSize: a/14,
      //                                   color: Colors.black,
      //                                   fontWeight: FontWeight.bold,
      //                                   //decoration: TextDecoration.lineThrough
      //                                 ),
      //                                 ),
      //                               ),
      //
      //                               Padding(
      //                                 padding: const EdgeInsets.all(8.0),
      //                                 child: InkWell(
      //                                   onTap: (){
      //
      //                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));
      //
      //                                   },
      //                                   child: Container(
      //                                     alignment: Alignment.center,
      //                                     padding: EdgeInsets.all(10),
      //                                     decoration: BoxDecoration(
      //                                         boxShadow: [
      //                                           BoxShadow(
      //                                               offset: Offset(-5, -3),
      //                                               color: Colors.white.withOpacity(0.2),
      //                                               spreadRadius: 2,
      //                                               blurRadius: 5)
      //                                         ],
      //                                         gradient: LinearGradient(
      //                                             colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
      //                                         borderRadius: BorderRadius.circular(20)),
      //                                     child: Text(
      //                                       "Get Now",
      //                                       style: TextStyle(
      //                                           fontSize: a/22,
      //                                           fontWeight: FontWeight.bold,
      //                                           color: Colors.white),
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //
      //                             ],
      //
      //                           ),
      //                         ),
      //                       );
      //                   }
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     drawer: mainDrawer(),
      //   );
      // }
    }else{
      // if(data==null||data.length==0){
        // print("work");
        setState(() {
          SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
        });
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

                  title: new Text('Packages', style: TextStyle(fontSize: w / 30,color: Colors.black),),
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

                    color: Colors.transparent,
                    child: Container(
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,childAspectRatio: 1/.9),
                          itemCount: pack_name.length,
                          itemBuilder: (context, index){
                            return
                              Padding(
                                padding:  EdgeInsets.fromLTRB(30, 10,30.0,10.0),
                                child: InkWell(
                                  onTap: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));
                                    Toast.show("Please Use Phone To Call", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                     // padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(-3, -3),
                                                color: Color(0xffA2CAEF).withOpacity(0.2),
                                                spreadRadius: 6,
                                                blurRadius: 6)
                                          ],
                                          borderRadius: BorderRadius.circular(15),
                                          color: Color(0xffd2d2d2).withOpacity(0.6),
                                          gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Color(0xffc0c0c0),
                                                Color(0xffFFFEDC),
                                                //Color(0xffFFA500)
                                              ])
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(pack_name[index], style: TextStyle(
                                                  color: Colors.purple[900],
                                                  fontSize: a/20,
                                                  fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(pack_mbps[index], style: TextStyle(
                                                  color: Colors.purple[900],
                                                  fontWeight: FontWeight.bold,fontSize: a/8.toDouble()),

                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: [
                                                    Container(
                                                      alignment: Alignment.bottomLeft,
                                                      child: Text("Mbps", style: TextStyle(
                                                          color: Colors.black,

                                                          fontWeight: FontWeight.bold,fontSize: a/30),

                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      child: Text("Unlimited ", style: TextStyle(
                                                          color: Colors.grey,

                                                          fontWeight: FontWeight.bold,fontSize: a/35),

                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(pack_tk[index]+" TK/month", style: TextStyle(
                                              fontSize: a/35,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              //decoration: TextDecoration.lineThrough
                                            ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Container(


                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset: Offset(-5, -3),
                                                        color: Colors.white.withOpacity(0.2),
                                                        spreadRadius: 2,
                                                        blurRadius: 10)
                                                  ],
                                                  gradient: LinearGradient(
                                                      colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
                                                  borderRadius: BorderRadius.circular(20)),
                                              child: Text(
                                                "Get Now",
                                                style: TextStyle(
                                                    fontSize: a/30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),

                                        ],

                                      ),
                                    ),
                                  ),
                                ),
                              );
                          }
                      ),
                    ),
                  ),
                ),
              ],
            ),
            drawer: mainDrawer(),

        );
      // }else{
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
      //           title: new Text('Packages', style: TextStyle(fontSize: w / 30,color: Colors.black),),
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
      //             color: Colors.transparent,
      //             child: Container(
      //               child: GridView.builder(
      //                   scrollDirection: Axis.vertical,
      //                   shrinkWrap: true,
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                       crossAxisCount: 2,childAspectRatio: 1/.9),
      //                   itemCount: data.length,
      //                   itemBuilder: (context, index){
      //                     return
      //                       Padding(
      //                         padding: const EdgeInsets.fromLTRB(30, 10.0,30.0,10.0),
      //                         child: Container(
      //                          // padding: EdgeInsets.all(15),
      //                           decoration: BoxDecoration(
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                     offset: Offset(-3, -3),
      //                                     color: Color(0xffA2CAEF).withOpacity(0.2),
      //                                     spreadRadius: 6,
      //                                     blurRadius: 6)
      //                               ],
      //                               borderRadius: BorderRadius.circular(15),
      //                               color: Color(0xffd2d2d2).withOpacity(0.6),
      //                               gradient: LinearGradient(
      //                                   begin: Alignment.topRight,
      //                                   end: Alignment.bottomLeft,
      //                                   colors: [
      //                                     Color(0xffc0c0c0),
      //                                     Color(0xffFFFEDC),
      //                                     //Color(0xffFFA500)
      //                                   ])
      //                           ),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Padding(
      //                                 padding: const EdgeInsets.all(10.0),
      //                                 child: Container(
      //                                   alignment: Alignment.center,
      //                                   child: Text(data[index]["name"], style: TextStyle(
      //                                       color: Colors.purple[900],
      //                                       fontSize: a/20,
      //                                       fontWeight: FontWeight.bold),
      //                                     textAlign: TextAlign.center,
      //                                   ),
      //                                 ),
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   Text(data[index]["band"].toString(), style: TextStyle(
      //                                       color: Colors.purple[900],
      //                                       fontWeight: FontWeight.bold,fontSize: a/8.toDouble()),
      //
      //                                   ),
      //                                   Padding(
      //                                     padding: const EdgeInsets.all(8.0),
      //                                     child: Column(
      //                                       crossAxisAlignment: CrossAxisAlignment.start,
      //
      //                                       children: [
      //                                         Container(
      //                                           alignment: Alignment.bottomLeft,
      //                                           child: Text("Mbps", style: TextStyle(
      //                                               color: Colors.black,
      //
      //                                               fontWeight: FontWeight.bold,fontSize: a/30),
      //
      //                                           ),
      //                                         ),
      //                                         Container(
      //                                           alignment: Alignment.topLeft,
      //                                           child: Text("Unlimited ", style: TextStyle(
      //                                               color: Colors.grey,
      //
      //                                               fontWeight: FontWeight.bold,fontSize: a/35),
      //
      //                                           ),
      //                                         ),
      //
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //
      //                               Container(
      //                                 alignment: Alignment.center,
      //                                 child: Text(data[index]["price"].toString()+" TK/month", style: TextStyle(
      //                                   fontSize: a/35,
      //                                   color: Colors.black,
      //                                   fontWeight: FontWeight.bold,
      //                                   //decoration: TextDecoration.lineThrough
      //                                 ),
      //                                 ),
      //                               ),
      //                               Padding(padding: EdgeInsets.all(5.0),),
      //
      //                               InkWell(
      //                                 onTap: (){
      //
      //                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Offer()));
      //
      //                                 },
      //                                 child: Padding(
      //                                   padding: const EdgeInsets.all(5.0),
      //                                   child: Container(
      //
      //                                     alignment: Alignment.center,
      //                                     padding: EdgeInsets.all(1),
      //                                     decoration: BoxDecoration(
      //                                         boxShadow: [
      //                                           BoxShadow(
      //                                               offset: Offset(-5, -3),
      //                                                spreadRadius: 2,
      //                                               color: Colors.white.withOpacity(0.2),
      //                                               blurRadius: 5)
      //                                         ],
      //                                         gradient: LinearGradient(
      //                                             colors: [Color(0xffFE9B4D), Color(0xffFE8032)]),
      //                                         borderRadius: BorderRadius.circular(20)),
      //                                     child: Text(
      //                                       "Get Now",
      //                                       style: TextStyle(
      //                                           fontSize: a/30,
      //                                           fontWeight: FontWeight.bold,
      //                                           color: Colors.white),
      //                                     ),
      //                                   ),
      //                                 ),
      //                               ),
      //
      //                             ],
      //
      //                           ),
      //                         ),
      //                       );
      //                   }
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     drawer: mainDrawer(),
      //   );
      // }
    }



  }
}





