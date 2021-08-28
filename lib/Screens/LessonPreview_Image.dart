import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonPreview_Image extends StatefulWidget {
  @override
  _LessonPreview_ImageState createState() => _LessonPreview_ImageState();
}

class _LessonPreview_ImageState extends State<LessonPreview_Image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child:Image.asset(
            'assets/images/study.jpg',
            fit:BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
