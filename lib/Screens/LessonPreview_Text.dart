import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LessonPreview_Text extends StatefulWidget {
  @override
  _LessonPreview_TextState createState() => _LessonPreview_TextState();
}

class _LessonPreview_TextState extends State<LessonPreview_Text> {
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
        decoration:BoxDecoration(
            border:Border.all(
                color:Colors.black,
                width:1
            ),
            borderRadius:BorderRadius.circular(10)
        ),
        child:ClipRRect(
          borderRadius:BorderRadius.circular(10),
          child:SingleChildScrollView(
            padding:EdgeInsets.all(6),
            child:Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type "
                  "specimen book. It has survived not only five centuries, but also the leap into "
                  "electronic typesetting, remaining essentially unchanged. It was popularised in the "
                  "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more "
                  "recently with desktop publishing software like Aldus PageMaker including versions of "
                  "Lorem Ipsum."
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type "
                  "specimen book. It has survived not only five centuries, but also the leap into "
                  "electronic typesetting, remaining essentially unchanged. It was popularised in the "
                  "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more "
                  "recently with desktop publishing software like Aldus PageMaker including versions of "
                  "Lorem Ipsum."
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type "
                  "specimen book. It has survived not only five centuries, but also the leap into "
                  "electronic typesetting, remaining essentially unchanged. It was popularised in the "
                  "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more "
                  "recently with desktop publishing software like Aldus PageMaker including versions of "
                  "Lorem Ipsum."
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type "
                  "specimen book. It has survived not only five centuries, but also the leap into "
                  "electronic typesetting, remaining essentially unchanged. It was popularised in the "
                  "1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more "
                  "recently with desktop publishing software like Aldus PageMaker including versions of "
                  "Lorem Ipsum.",
              style: TextStyle(
                color:Colors.black,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.w400,
                fontSize:18,
              ),
            ),
          )
        ),
      ),
    );
  }
}

