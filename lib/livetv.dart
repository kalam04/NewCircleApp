
import 'package:flutter/material.dart';
import 'bkashPayment.dart';
import 'contact.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'playWevview.dart';



class LiveTv1 extends StatefulWidget {

  @override
  _LiveTv1State createState() => _LiveTv1State();
}

class _LiveTv1State extends State<LiveTv1> {
  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery
        .of(context)
        .size
        .height;
    var w = MediaQuery
        .of(context)
        .size
        .width;
    var appbartext1 = "BDIPTV",
        appbartext2 = "RANGDHANU LIVE",
        appbartext3 = "LIVE TV",
        appbartext4 = "BCIP TV";
    var urlString1 = "http://bdiptv.net/",
        urlString2 = "http://bdiptv.net/",
        urlString3 = "http://www.jagobd.com/btvworld",
        urlString4 = "http://bciptv.net/";


    Widget gridSection = Container(

      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.fromLTRB(15,10,15,15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext1, urlString: urlString1,)));
              },
              child: new Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
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
                  children: [
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("BDIPTV", style: TextStyle(
                            color: Colors.black,
                            fontSize: w / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Image.asset(
                        'assets/images/unnamed.png', height: h / 5,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext2, urlString: urlString2,)));
              },
              child: new Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
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
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("RANGDHANU LIVE", style: TextStyle(
                            color: Colors.black,
                            fontSize: w / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset(
                      'assets/images/rangdhanu.gif', height: h / 4,),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext3, urlString: urlString3,)));
              },
              child: new Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("LIVE TV", style: TextStyle(
                            color: Colors.black,
                            fontSize: w / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset(
                      'assets/images/live.png', height: h / 4, width: w / 2,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext4, urlString: urlString4,)));
              },
              child: new Container(

                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
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
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("BCIP TV", style: TextStyle(
                            color: Colors.black,
                            fontSize: w / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset(
                      'assets/images/BCIPTV.png', height: h / 4, width: w / 2,),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
    Widget gridSection_landScape = Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: GridView.count(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        crossAxisCount: 2,
        childAspectRatio: 1/.8,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext1, urlString: urlString1,)));
              },
              child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                  children: [
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("BDIPTV", style: TextStyle(
                            color: Colors.black,
                            fontSize: h / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Image.asset(
                        'assets/images/unnamed.png', height: h / 3,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext2, urlString: urlString2,)));
              },
              child: new Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("RANGDHANU LIVE", style: TextStyle(
                            color: Colors.black,
                            fontSize: h / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset(
                      'assets/images/rangdhanu.gif', height: h / 3.7,),

                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext3, urlString: urlString3,)));
              },
              child: new Container(

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("LIVE TV", style: TextStyle(
                            color: Colors.black,
                            fontSize: h / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset('assets/images/live.png', height: h / 4,),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    WebviewRun(
                      appbartext: appbartext4, urlString: urlString4,)));
              },
              child: new Container(

                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
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
                child: new Column(
                  children: <Widget>[
                    new Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("BCIP TV", style: TextStyle(
                            color: Colors.black,
                            fontSize: h / 15,
                            fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    new Image.asset('assets/images/BCIPTV.png', height: h / 3,),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );

    var x = MediaQuery
        .of(context)
        .size
        .height;
    var y = MediaQuery
        .of(context)
        .size
        .width;

    Size size = MediaQuery
        .of(context)
        .size;

    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(x / 15),
            child: new AppBar(
              iconTheme: IconThemeData(
                  color: Colors.black //change your color here
              ),

               title: Center(child: Text('Live Tv', style: TextStyle(fontSize: x / 30,color: Colors.black),)),
              // title:  Image.asset("assets/images/cn.png",height: size.height/15,),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Image.asset("assets/images/cn.png"),
                )
              ],
              centerTitle: true,
              leadingWidth: 30,
              backgroundColor: Colors.blueGrey[100],)),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.blueGrey[100],
                width: size.width,
                height: size.height / 15,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [

                    Container(
                      width: size.width,
                      height: size.height / 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: currentIndex == 0
                                  ? Colors.orange
                                  : Colors.white,
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
                                    : Colors.white,
                              ),
                              onPressed: () {
                                launch("tel:+09611800900");
                              }),

                          IconButton(
                              icon: Icon(
                                Icons.camera,
                                color: currentIndex == 2
                                    ? Colors.orange
                                    : Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Packages()));
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.payment,
                                color: currentIndex == 3
                                    ? Colors.orange
                                    : Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => bkashPayment()));
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
              height: size.height - (size.height / 15 + size.height / 15
                  + MediaQuery
                      .of(context)
                      .padding
                      .top),
              width: size.width,
              child: Container(
                child: SafeArea(
                  child: Container(
                    child: gridSection,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: SafeArea(child: mainDrawer()),
      );
    } else {
      setState(() {
        SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
      });
      return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(size.height / 9),
            child: new AppBar(title: Center(
                child: Text('Live Tv', style: TextStyle(fontSize: y / 30),)),
              centerTitle: true,
              leadingWidth: 30,
              backgroundColor: Color(0xffFF7F50),)),
        body: Stack(
          children: [
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: Container(
            //     color: Color(0xffFF7F50),
            //     width: size.width,
            //     height: size.height / 9,
            //     child: Stack(
            //       overflow: Overflow.visible,
            //       children: [
            //
            //         Container(
            //           width: size.width,
            //           height: size.height / 9,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               RaisedButton(
            //                 disabledColor: Colors.transparent,
            //                 elevation: 0,
            //                 child: IconButton(
            //                   icon: Icon(
            //                     Icons.home,
            //                     color: currentIndex == 0
            //                         ? Colors.orange
            //                         : Colors.white,
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
            //                 disabledColor: Colors.transparent,
            //                 elevation: 0,
            //
            //                 child: IconButton(
            //                     icon: Icon(
            //                       Icons.call,
            //                       color: currentIndex == 1
            //                           ? Colors.orange
            //                           : Colors.white,
            //                     ),
            //                     onPressed: () {
            //                       launch("tel:+09611800900");
            //                     }),
            //               ),
            //               // Container(
            //               //   width: size.width * 0.20,
            //               // ),
            //               RaisedButton(
            //                 disabledColor: Colors.transparent,
            //                 elevation: 0,
            //                 child: IconButton(
            //                     icon: Icon(
            //                       Icons.camera,
            //                       color: currentIndex == 2
            //                           ? Colors.orange
            //                           : Colors.white,
            //                     ),
            //                     onPressed: () {
            //                       Navigator.push(context, MaterialPageRoute(
            //                           builder: (context) => Packages()));
            //                     }),
            //               ),
            //               RaisedButton(
            //                 disabledColor: Colors.transparent,
            //                 elevation: 0,
            //                 child: IconButton(
            //                     icon: Icon(
            //                       Icons.payment,
            //                       color: currentIndex == 3
            //                           ? Colors.orange
            //                           : Colors.white,
            //                     ),
            //                     onPressed: () {
            //                       Navigator.push(context, MaterialPageRoute(
            //                           builder: (context) => bkashPayment()));
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
              height: size.height - (size.height / 9 ),
              width: size.width,
              child: Container(
                child: SafeArea(
                  child: Container(
                    child: gridSection_landScape,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: SafeArea(child: mainDrawer()),
      );
    }
  }
}