import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'bkashPayment.dart';
import 'home.dart';
import 'mainDrawer.dart';
import 'package.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {

  int currentIndex = 5;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final Completer<InAppWebViewController> _controller2 = Completer<InAppWebViewController>();


  Future<bool> _willPopCallback() async {
    InAppWebViewController webViewController = await _controller2.future;
    bool canNavigate = await webViewController.canGoBack();
    if (canNavigate) {
      webViewController.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _willPopCallback();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var x=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;

    if(MediaQuery.of(context).orientation==Orientation.landscape){
      return WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          appBar: PreferredSize(preferredSize: Size.fromHeight(w / 16),
              child: new AppBar(title: Center(
                  child: Text('Packages', style: TextStyle(fontSize: w / 30),)),
                centerTitle: true,
                leadingWidth: 0,
                backgroundColor: Color(0xffFF7F50),)),
          body: SafeArea(
            child: InAppWebView(
              initialUrl: "https://offer.circlenetworkbd.net/",
              initialHeaders: {},
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                    debuggingEnabled: true,
                    useOnDownloadStart: true
                ),
              ),
              onWebViewCreated: (InAppWebViewController webViewController) {
                _controller2.complete(webViewController);
              },
              onLoadStart: (InAppWebViewController controller, String url) {},
              onLoadStop: (InAppWebViewController controller, String url) {},
              onDownloadStart: (controller, url) async {
                // print("onDownloadStart $url");
                //
                //   const url = 'https://circlenetworkbd.net/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }

                // final taskId = await FlutterDownloader.enqueue(
                //
                //   url: url,
                //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
                //       ExtStorage.DIRECTORY_DOWNLOADS),
                //   // savedDir: (await getExternalStorageDirectory()).path,
                //   showNotification: true, // show download progress in status bar (for Android)
                //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                // );
              },
            ),
          ),
          drawer: SafeArea(child: mainDrawer()),


        ),
      );
    }
    else{
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
              child:  InAppWebView(
                initialUrl: "https://offer.circlenetworkbd.net/",
                initialHeaders: {},
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                      debuggingEnabled: true,
                      useOnDownloadStart: true
                  ),
                ),
                onWebViewCreated: (InAppWebViewController webViewController) {
                  _controller2.complete(webViewController);
                },
                onLoadStart: (InAppWebViewController controller, String url) {},
                onLoadStop: (InAppWebViewController controller, String url) {},
                onDownloadStart: (controller, url) async {
                  // print("onDownloadStart $url");
                  //
                  //   const url = 'https://circlenetworkbd.net/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }

                  // final taskId = await FlutterDownloader.enqueue(
                  //
                  //   url: url,
                  //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
                  //       ExtStorage.DIRECTORY_DOWNLOADS),
                  //   // savedDir: (await getExternalStorageDirectory()).path,
                  //   showNotification: true, // show download progress in status bar (for Android)
                  //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                  // );
                },
              ),
            ),
          ],
        ),
        drawer: SafeArea(child: mainDrawer()),


      );
    }

  }
}