
import 'dart:typed_data';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class PlaySearch extends StatefulWidget {
  var url;
  PlaySearch({this.url});
  @override
  _PlaySearchState createState() => _PlaySearchState(url);
}

class _PlaySearchState extends State<PlaySearch> {
  _PlaySearchState(url);
  Uint8List image;
  // VlcPlayerController _videoViewController;
  bool isPlaying = true;
  double sliderValue = 0.0;
  double currentPlayerTime = 0;
  double volumeValue = 100;
  String position = "";
  String duration = "";
  int numberOfCaptions = 0;
  int numberOfAudioTracks = 0;
  bool isBuffering = true;
  bool getCastDeviceBtnEnabled = false;
  var h=250.0;
  var fullscreen=false;
  var isVisibility=false;
  var next,previous;
  FlickManager flickManager;

  @override
  void initState() {



    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.url.toString()),
      autoInitialize: true,
      autoPlay: false,


    );

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   var subHeight=MediaQuery.of(context).size.height/40;
   var playHeight=MediaQuery.of(context).size.height/40;
      return new Scaffold(

        backgroundColor: Colors.black,
        appBar: AppBar(title: Text("Circle Network"),backgroundColor: Colors.black,centerTitle: true,leadingWidth: 30,),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FlickVideoPlayer(
                    flickManager: flickManager
                ),
              ),
            ],
          ),
        ),

      );


  }


  @override
  void dispose() {
    // _videoViewController.dispose();
    flickManager.dispose();
    super.dispose();
  }

}
