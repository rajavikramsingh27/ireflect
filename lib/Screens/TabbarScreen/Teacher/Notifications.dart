import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
            'Notifications',
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
            padding:EdgeInsets.only(left:10,right:10,
                top:16,bottom:20
            ),
            itemCount:count,
            itemBuilder: (_, index) {
              return GestureDetector(
                child:AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  margin:EdgeInsets.only(top:3,bottom:3),
                  padding:EdgeInsets.only(left:6,right:6,top:10,bottom:16),
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(4),
                    border:Border.all(
                      color:Colors.white,
                      // HexColor(themeColorSecondary),
                      width:1
                    )
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.1),
                    //     spreadRadius:0.1,
                    //     blurRadius:0.1,
                    //     offset: Offset(0,0), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text:'You have received a proposal on your ',
                              style: TextStyle(
                                color:Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:16,
                              ),
                            ),
                            TextSpan(
                              text:'I need a PHP developer',
                              style: TextStyle(
                                color:Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                fontSize:16,
                              ),
                            ),
                            TextSpan(
                              text:' Job ',
                              style: TextStyle(
                                color:Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:16,
                              ),
                            ),
                            TextSpan(
                              text:'Respond',
                              style: TextStyle(
                                color:HexColor('#63D6B1'),
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.bold,
                                fontSize:20,
                              ),
                            ),
                          ],
                        ),
                      ),

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
