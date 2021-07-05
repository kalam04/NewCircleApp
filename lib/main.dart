import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';




Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );


  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash()));

}

class splash extends StatefulWidget{

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    if(MediaQuery.of(context).orientation==Orientation.landscape){
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child: MaterialApp(
          theme: ThemeData(
            focusColor: Colors.red,
          ),
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splashIconSize: 300,
            backgroundColor: Colors.grey[200],
            splash: Container(
              //height: 1000,
                child: Image.asset("assets/images/logo.png")
            ),
            nextScreen: Home(),
            duration: 3000,
          ),
        ),
      );
    }else{
      return Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        },
        child: MaterialApp(
          theme: ThemeData(
            focusColor: Colors.red,
          ),
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splashIconSize: 300,
            backgroundColor: Colors.grey[200],
            splash: Container(
              //height: 1000,
                child: Image.asset("assets/images/logo.png")
            ),
            nextScreen: Home(),
            duration: 3000,
          ),
        ),
      );
    }
  }
}
