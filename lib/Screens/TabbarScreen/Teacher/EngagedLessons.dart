import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/ClassRooms.dart';


class EngagedLessons extends StatefulWidget {
  @override
  _EngagedLessonsState createState() => _EngagedLessonsState();
}

class _EngagedLessonsState extends State<EngagedLessons> {
  List<bool> arrFeedReadMore = [];
  int count = 10;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Future.delayed(Duration(milliseconds:3),() {
    for (int i=0;i<count;i++) {
      arrFeedReadMore.add(false);
    }
    setState(() {

    });
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:HexColor(themeColorBG),
        appBar:AppBar(
          centerTitle:true,
          elevation:0.5,
          backgroundColor:HexColor(themeColorSecondary),
          title:Text(
            'Engaged Lesson',
            textAlign: TextAlign.left,
            style: TextStyle(
              color:Colors.black,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.w400,
              fontSize:20,
            ),
          ),
          leading:Text(''),
          actions: [
            // IconButton(
            //   icon:Icon(
            //     Icons.search,
            //     size:40,
            //     color:Colors.black,
            //   ),
            //   onPressed:() {
            //
            //   },
            // ),
            // SizedBox(width:16,)
          ],
        ),
        body:ListView.builder(
            padding:EdgeInsets.only(left:16,right:16,
                top:16,bottom:20
            ),
            itemCount:count,
            itemBuilder: (_, index) {
              return GestureDetector(
                child:AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  margin:EdgeInsets.only(top:5,bottom:5),
                  padding:EdgeInsets.only(left:10,right:0,top:10,bottom:16),
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:HexColor(themeColorSecondary),
                    borderRadius:BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius:2,
                        blurRadius:5,
                        offset: Offset(0,0), // changes position of shadow
                      ),
                    ],
                  ),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius:BorderRadius.circular(10),
                            child:Image.asset(
                              'assets/images/userDefault.png',
                              height:70,
                              width:70,
                              fit:BoxFit.cover,
                              // color:Colors.white,
                            ),
                          ),
                          SizedBox(width:16),
                          Container(
                            width:MediaQuery.of(context).size.width-130,
                            child:Column(
                              mainAxisAlignment:MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hired by',
                                  style: TextStyle(
                                    color:Colors.black54,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:16,
                                  ),
                                ),
                                Text(
                                  'Rob Torentto',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.bold,
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                      SizedBox(height:10,),
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job title: ',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize:16,
                            ),
                          ),
                          SizedBox(width:5),
                          Container(
                            width:MediaQuery.of(context).size.width-130,
                            child:Text(
                              'I need a php Job I need a php Job I need a php Job I need a php Job I need a php Job',
                              maxLines:2,
                              style:TextStyle(
                                color: Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:16,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:5,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/canada.svg',
                            height:34,
                          ),
                          SizedBox(width:10,),
                          Text(
                            '06:34 am EST',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:5,),
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rob Torentto: ',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize:16,
                            ),
                          ),
                          SizedBox(width:5),
                          Container(
                            width:MediaQuery.of(context).size.width-190,
                            child:Text(
                              'Shared a video file',
                              maxLines:2,
                              style:TextStyle(
                                color: Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:16,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:30),
                      Center(
                        child:Container(
                          // margin:EdgeInsets.only(left:20),
                            width:240,
                            height:56,
                            alignment:Alignment.center,
                            decoration: BoxDecoration(
                              color:HexColor(themeColorBG),
                              borderRadius:BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius:2,
                                  blurRadius:5,
                                  offset: Offset(0,0), // changes position of shadow
                                ),
                              ],
                            ),
                            child:FlatButton(
                              minWidth:double.infinity,
                              height:double.infinity,
                              child:Text(
                                'Message / Connect',
                                textAlign: TextAlign.center,
                                style:TextStyle(
                                  // color: AppColors.primaryText,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:17,
                                  // letterSpacing: -0.576,
                                ),
                              ),
                              onPressed:() {
                                Navigator.push(context,
                                    MaterialPageRoute(builder:(context)=>ClassRooms())
                                );
                              },
                            )
                        ),
                      )
                    ],
                  ),
                ),
                onTap:() {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder:(context)=>LessonDetails())
                  // );
                },
              );
            })
    );
  }
}
