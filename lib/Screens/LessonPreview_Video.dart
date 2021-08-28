import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';



class LessonPreview_Video extends StatefulWidget {
  @override
  _LessonPreview_VideoState createState() => _LessonPreview_VideoState();
}

class _LessonPreview_VideoState extends State<LessonPreview_Video> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:HexColor(themeColorTabIcon),
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // Th
      backgroundColor:HexColor(themeColorBG),
      appBar:AppBar(
        centerTitle:true,
        elevation:1,
        backgroundColor:HexColor(themeColorSecondary),
        title:Text(
          'Lesson Preview',
          textAlign: TextAlign.left,
          style: TextStyle(
            color:Colors.black,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w400,
            fontSize:20,
          ),
        ),
        leading:IconButton(
          icon:Icon(
            Icons.arrow_back,
            size:30,
            color:Colors.black,
          ),
          onPressed:() {
            Navigator.pop(context);
          },
        ),
        actions: [

        ],
      ),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        margin:EdgeInsets.all(16),
        padding:EdgeInsets.all(6),
        decoration:BoxDecoration(
            border:Border.all(
                color:Colors.black,
                width:1
            ),
            borderRadius:BorderRadius.circular(10)
        ),
        child:ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child:FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
        ),
      ),
    );
  }
}

