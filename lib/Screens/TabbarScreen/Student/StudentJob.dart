import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/Teacher/LessonDetails.dart';
import 'package:ireflect/Screens/Student/ProposalsList_OnJob.dart';


class StudentJob extends StatefulWidget {
  @override
  _StudentJobState createState() => _StudentJobState();
}

class _StudentJobState extends State<StudentJob> {
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
            'Your Jobs',
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
            IconButton(
              icon:Icon(
                Icons.search,
                size:40,
                color:Colors.black,
              ),
              onPressed:() {

              },
            ),
            SizedBox(width:16,)
          ],
        ),
        body:ListView.builder(
            padding:EdgeInsets.only(left:16,right:16,
                top:16,bottom:20
            ),
            itemCount:count,
            itemBuilder: (_, index) {
              String strBadge = '';
              Icon iconBadge;
              String strColorBadge = '#0000FF';

              if (index%2 == 0) {
                strBadge = 'Hired';
                iconBadge = Icon(
                  Icons.verified_outlined,
                  color:Colors.white,
                  size:22,
                );
                strColorBadge = '#0000FF';
              } else if (index%3 == 0) {
                strBadge = 'Paid';
                iconBadge = Icon(
                  Icons.monetization_on,
                  color:Colors.white,
                  size:22,
                );
                strColorBadge = '#14FF00';
              } else if (index%5 == 0) {
                strBadge = 'Closed';
                iconBadge = Icon(
                  Icons.cancel,
                  color:Colors.white,
                  size:22,
                );
                strColorBadge = '#FF001C';
              } else {
                strBadge = 'Hired';
                iconBadge = Icon(
                  Icons.verified_outlined,
                  color:Colors.white,
                  size:22,
                );
                strColorBadge = '#0000FF';
              }

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
                        children: [
                          Text(
                            'I need a PHP Tutor',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              fontSize:20,
                            ),
                          ),
                          Container(
                            height:40,
                            // width:111,
                            padding:EdgeInsets.only(left:6,right:16,),
                            decoration:BoxDecoration(
                              color:HexColor(strColorBadge).withOpacity(0.6),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                            child:Row(
                              children: [
                                iconBadge,
                                SizedBox(width:4,),
                                Text(
                                  strBadge,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:16,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                      // SizedBox(height:20,),
                      Container(
                        padding:EdgeInsets.only(right:10,),
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/view.svg',
                                  height:24,
                                ),
                                SizedBox(height:3,),
                                Text(
                                  '50',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                                SizedBox(height:0,),
                                Text(
                                  'Views',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/people.svg',
                                  height:24,
                                ),
                                SizedBox(height:3,),
                                Text(
                                  '50',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                                SizedBox(height:0,),
                                Text(
                                  'Applied',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/save.svg',
                                  height:24,
                                ),
                                SizedBox(height:3,),
                                Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                                SizedBox(height:0,),
                                Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/share.svg',
                                  height:24,
                                ),
                                SizedBox(height:3,),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                                SizedBox(height:0,),
                                Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap:() {
                  Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>ProposalsList_OnJob())
                  );
                },
              );
            })
    );
  }
}
