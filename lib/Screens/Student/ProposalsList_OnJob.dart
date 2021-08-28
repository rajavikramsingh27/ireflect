import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/Teacher/LessonDetails.dart';


class ProposalsList_OnJob extends StatefulWidget {
  @override
  _ProposalsList_OnJobState createState() => _ProposalsList_OnJobState();
}

class _ProposalsList_OnJobState extends State<ProposalsList_OnJob> {
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
            'Proposals List',
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
                  padding:EdgeInsets.only(left:10,right:10,top:10,bottom:16),
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:HexColor(themeColorSecondary),
                    borderRadius:BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
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
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:[
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
                                // width:MediaQuery.of(context).size.width-130,
                                child:Text(
                                  'Rob Torentto',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.bold,
                                    fontSize:20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          FlatButton(
                            minWidth:36,
                            padding:EdgeInsets.only(bottom:6,left:6),
                            child:SvgPicture.asset(
                              'assets/images/shortlist.svg',
                              height:36,
                              color:Colors.green,
                            ),
                            onPressed:() {

                            },
                          )
                        ],
                      ),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/canada.svg',
                            height:30,
                          ),
                          SizedBox(width:10,),
                          Text(
                            "\$111",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                          SizedBox(width:10,),
                          Text(
                            '6 am - 8 am',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                          SizedBox(width:10,),
                          Text(
                            'Posted 2 days ago',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10,),
                      Row(
                        children: [
                          Text(
                            'Experience:-',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:14,
                            ),
                          ),
                          SizedBox(width:4,),
                          Text(
                            'More than 2+ years',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10,),
                      Text(
                        "Job Description Lorem ipsum dolor sit amet, consectetur "
                            "adipiscing elit, sed do eiusmod tempor incididunt ut labore"
                            "et dolore magna aliqua. Ut enim ad minim,"
                            "Job Description Lorem ipsum dolor sit amet, consectetur "
                            "adipiscing elit, sed do eiusmod tempor incididunt ut labore"
                            "et dolore magna aliqua. Ut enim ad minim,",
                        maxLines:arrFeedReadMore[index] ? 111 : 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.normal,
                          fontSize:14,
                        ),
                      ),
                      Container(
                        height:34,
                        alignment:Alignment.topLeft,
                        padding:EdgeInsets.only(bottom:11),
                        child:FlatButton(
                          padding:EdgeInsets.all(0),
                          child:Text(
                            arrFeedReadMore[index]
                                ? 'Read Less...'
                                : 'Read More...',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize:14,
                            ),
                          ),
                          onPressed:() {
                            for (int i=0;i<count;i++) {
                              if (i == index) {
                                if (arrFeedReadMore[i]) {
                                  arrFeedReadMore[i] = false;
                                } else {
                                  arrFeedReadMore[i] = true;
                                }
                              } else {
                                arrFeedReadMore[i] = false;
                              }
                            }

                            setState(() {

                            });
                          },
                        ),
                      ),
                      SizedBox(height:16),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height:50,
                            decoration:BoxDecoration(
                              color:HexColor('#0000FF').withOpacity(0.6),
                              borderRadius:BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius:2,
                                  blurRadius:5,
                                  offset: Offset(0,0), // changes position of shadow
                                ),
                              ],
                            ),
                            child:FlatButton(
                              height:30,
                              child:Text(
                                'View more',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:14,
                                ),
                              ),
                              onPressed:() {

                              },
                            ),
                          ),
                          Container(
                            height:50,
                            decoration:BoxDecoration(
                              color:Colors.green.withOpacity(1.0),
                              borderRadius:BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius:2,
                                  blurRadius:5,
                                  offset: Offset(0,0), // changes position of shadow
                                ),
                              ],
                            ),
                            child:FlatButton(
                              height:30,
                              child:Text(
                                'Accept',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:14,
                                ),
                              ),
                              onPressed:() {

                              },
                            ),
                          ),
                          Container(
                            height:50,
                            decoration:BoxDecoration(
                              color:HexColor('#FF001C').withOpacity(0.6),
                              borderRadius:BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius:2,
                                  blurRadius:5,
                                  offset: Offset(0,0), // changes position of shadow
                                ),
                              ],
                            ),
                            child:FlatButton(
                              height:30,
                              child:Text(
                                'Reject',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:14,
                                ),
                              ),
                              onPressed:() {

                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onTap:() {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder:(context)=>ProposalsList_OnJob())
                  // );
                },
              );
            })
    );
  }
}
