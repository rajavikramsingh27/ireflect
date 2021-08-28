import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/LessonPreview_Image.dart';
import 'package:ireflect/Screens/LessonPreview_Text.dart';
import 'package:ireflect/Screens/LessonPreview_Video.dart';


class ClassRooms extends StatefulWidget {
  @override
  _ClassRoomsState createState() => _ClassRoomsState();
}

class _ClassRoomsState extends State<ClassRooms> {
  int selection = 0;

  selectAnOption(context,) {
    showModalBottomSheet(
        backgroundColor:Colors.transparent,
        context: context,
        builder:(BuildContext bc) {
          return Container(
              height:360,
              margin:EdgeInsets.only(left:30,right:30),
              decoration:BoxDecoration(
                color:HexColor(themeColorSecondary),
                borderRadius:BorderRadius.only(
                    topRight:Radius.circular(20),
                    topLeft:Radius.circular(20)
                ),
              ),
              child:Center(
                child:Column(
                  children:<Widget>[
                    SizedBox(height:20),
                    Text(
                      'Please select an option',
                      style:TextStyle(
                        color:Color.fromARGB(255, 0, 0, 0),
                        fontFamily:"Times New Roman",
                        fontWeight:FontWeight.bold,
                        fontSize:18,
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      height:50,
                      width:140,
                      decoration:BoxDecoration(
                        color:HexColor(themeColorTabIcon),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Video',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      height:50,
                      width:140,
                      decoration:BoxDecoration(
                          color:HexColor(themeColorTabIcon),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Image',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      height:50,
                      width:140,
                      decoration:BoxDecoration(
                          color:HexColor(themeColorTabIcon),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Text',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height:40),
                    Container(
                      height:50,
                      width:140,
                      decoration:BoxDecoration(
                          color:HexColor('FF001C').withOpacity(0.6),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = ( _screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var cellHeight = 60;
    var _aspectRatio = _width /cellHeight;

    return Scaffold(
      backgroundColor:HexColor(themeColorBG),
      appBar:AppBar(
        centerTitle:true,
        elevation:1,
        backgroundColor:HexColor(themeColorSecondary),
        title:Text(
          'Class Room',
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
          FlatButton(
            child:SvgPicture.asset(
              'assets/images/plus.svg',
              height:33,
              // color:themeColorTabInActiveIcon,
            ),
            onPressed:() {
              selectAnOption(context);
            },
          )
        ],
      ),
      body:Column(
        children:[
          Container(
            width:MediaQuery.of(context).size.width,
            padding:EdgeInsets.only(left:20,right:20),
            height:60,
            decoration:BoxDecoration(
              color:Colors.white,
              border:Border(
                bottom:BorderSide(
                  color:Colors.black,
                  width:1
                )
              )
            ),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                    duration: Duration(milliseconds:300),
                    curve: Curves.fastOutSlowIn,
                  height:double.infinity,
                  alignment:Alignment.center,
                  decoration:BoxDecoration(
                      color:Colors.white,
                      border:Border(
                          bottom:BorderSide(
                              color:HexColor('#63D6B1'),
                              width:(selection == 0) ? 3 : 0,
                          )
                      )
                  ),
                  child:FlatButton(
                    height:double.infinity,
                    child:Text(
                      'Videos',
                      textAlign:TextAlign.left,
                      style:TextStyle(
                        color:(selection == 0) ? HexColor('#63D6B1') : Colors.black,
                        fontFamily:'Times New Roman',
                        fontWeight:FontWeight.w400,
                        fontSize:20,
                      ),
                    ),
                    onPressed:() {
                      selection = 0;
                      setState(() {

                      });
                    },
                  )
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds:300),
                    curve: Curves.fastOutSlowIn,
                    height:double.infinity,
                    alignment:Alignment.center,
                    decoration:BoxDecoration(
                        color:Colors.white,
                        border:Border(
                            bottom:BorderSide(
                              color:HexColor('#63D6B1'),
                              width:(selection == 1) ? 3 : 0,
                            )
                        )
                    ),
                    child:FlatButton(
                      height:double.infinity,
                      child:Text(
                        'Images',
                        textAlign:TextAlign.left,
                        style:TextStyle(
                          color:(selection == 1) ? HexColor('#63D6B1') : Colors.black,
                          fontFamily:'Times New Roman',
                          fontWeight:FontWeight.w400,
                          fontSize:20,
                        ),
                      ),
                      onPressed:() {
                        selection = 1;
                        setState(() {

                        });
                      },
                    )
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds:300),
                    curve: Curves.fastOutSlowIn,
                    height:double.infinity,
                    alignment:Alignment.center,
                    decoration:BoxDecoration(
                        color:Colors.white,
                        border:Border(
                            bottom:BorderSide(
                              color:HexColor('#63D6B1'),
                              width:(selection == 2) ? 3 : 0,
                            )
                        )
                    ),
                    child:FlatButton(
                      height:double.infinity,
                      child:Text(
                        'Text',
                        textAlign:TextAlign.left,
                        style:TextStyle(
                          color:(selection == 2) ? HexColor('#63D6B1') : Colors.black,
                          fontFamily:'Times New Roman',
                          fontWeight:FontWeight.w400,
                          fontSize:20,
                        ),
                      ),
                      onPressed:() {
                        selection = 2;
                        setState(() {

                        });
                      },
                    )
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Visibility(
                visible:(selection == 0 ) ? true : false,
                child:Container(
                    height:MediaQuery.of(context).size.height-164,
                    child:GridView.count(
                      childAspectRatio: 10/13.5,
                      padding:EdgeInsets.only(
                          left:4,right:4,
                          top:16,bottom:16
                      ),
                      crossAxisCount:2,
                      shrinkWrap: false,
                      children:List.generate(
                          19,(index) {
                        return GestureDetector(
                          child:Container(
                              height:300,
                              margin:EdgeInsets.only(
                                  left:4,right:4,
                                  top:4,bottom:4
                              ),
                              decoration:BoxDecoration(
                                color:Colors.white,
                                borderRadius:BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius:1,
                                    blurRadius:1,
                                    offset: Offset(0,0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child:Stack(
                                children: [
                                  Positioned(
                                    child:ClipRRect(
                                      borderRadius:BorderRadius.circular(10),
                                      child:Image.asset(
                                        'assets/images/study.jpg',
                                        fit:BoxFit.fitHeight,
                                      ),
                                    ),
                                    top:0,bottom:0,left:0,right:0,
                                  ),
                                  Center(
                                      child:Container(
                                        height:44,
                                        width:44,
                                        decoration:BoxDecoration(
                                          color:HexColor(themeColorTabIcon),
                                          borderRadius:BorderRadius.circular(22),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              spreadRadius:4,
                                              blurRadius:4,
                                              offset: Offset(0,0), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child:Icon(
                                          Icons.play_arrow,
                                          color:Colors.white,
                                          size:33,
                                        ),
                                      )
                                  )
                                ],
                              )
                          ),
                          onTap:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>LessonPreview_Video())
                            );
                          },
                        );
                      }),
                    )
                ),
              ),
              Visibility(
                visible:(selection == 1 ) ? true : false,
                child:Container(
                    height:MediaQuery.of(context).size.height-164,
                    child:GridView.count(
                      childAspectRatio: 10/13.5,
                      padding:EdgeInsets.only(
                          left:4,right:4,
                          top:16,bottom:16
                      ),
                      crossAxisCount:2,
                      shrinkWrap: false,
                      children:List.generate(
                          19,(index) {
                        return GestureDetector(
                          child:Container(
                            height:300,
                            margin:EdgeInsets.only(
                                left:4,right:4,
                                top:4,bottom:4
                            ),
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius:BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius:1,
                                  blurRadius:1,
                                  offset: Offset(0,0), // changes position of shadow
                                ),
                              ],
                            ),
                            child:ClipRRect(
                              borderRadius:BorderRadius.circular(10),
                              child:Image.asset(
                                'assets/images/study.jpg',
                                fit:BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          onTap:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>LessonPreview_Image())
                            );
                          },
                        );
                      }),
                    )
                ),
              ),
              Visibility(
                visible:(selection == 2 ) ? true : false,
                child:Container(
                    height:MediaQuery.of(context).size.height-164,
                    child:GridView.count(
                      childAspectRatio: 10/13.5,
                      padding:EdgeInsets.only(
                          left:4,right:4,
                          top:16,bottom:16
                      ),
                      crossAxisCount:2,
                      shrinkWrap: false,
                      children:List.generate(
                          19,(index) {
                        return GestureDetector(
                          child:Container(
                            height:300,
                            margin:EdgeInsets.only(
                                left:4,right:4,
                                top:4,bottom:4
                            ),
                            padding:EdgeInsets.only(
                                left:10,right:10,
                                top:6,bottom:6
                            ),
                            decoration:BoxDecoration(
                              color:Colors.white,
                              borderRadius:BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius:1,
                                  blurRadius:1,
                                  offset: Offset(0,0), // changes position of shadow
                                ),
                              ],
                            ),
                            child:ClipRRect(
                              borderRadius:BorderRadius.circular(10),
                              child:Text(
                                "Lorem ipsum, or lipsum as it is sometimes known,"
                                    "is dummy text used in"
                                    "laying out print, graphic"
                                    "or web designs. The"
                                    "passage is attributed to"
                                    "an unknown typesetter in"
                                    "the 15th century who is"
                                    "thought to have"
                                    "scrambled parts of"
                                    "Cicero's De Finibus"
                                    "Bonorum et Malorum.",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.w400,
                                  fontSize:18,
                                ),
                              ),
                            ),
                          ),
                          onTap:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>LessonPreview_Text())
                            );
                          },
                        );
                      }),
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
