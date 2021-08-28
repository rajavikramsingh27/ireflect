import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/Teacher/SubmitProposal.dart';


class ProposalDetails extends StatefulWidget {
  @override
  _ProposalDetailsState createState() => _ProposalDetailsState();
}

class _ProposalDetailsState extends State<ProposalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor(themeColorBG),
      appBar:AppBar(
        centerTitle:true,
        elevation:0.5,
        backgroundColor:HexColor(themeColorSecondary),
        title:Text(
          'Proposal Details',
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
      body:AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          margin:EdgeInsets.only(top:16,bottom:0,left: 16,right: 16),
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
          child:SingleChildScrollView(
            padding:EdgeInsets.only(left:10,right:0,top:10,bottom:30),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
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
                      padding:EdgeInsets.only(left:6,right:0,),
                      decoration:BoxDecoration(
                        color:Colors.green,
                        // HexColor('#14FF00').withOpacity(1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      child:Row(
                        children:[
                          SvgPicture.asset(
                            'assets/images/shortlist.svg',
                            height:26,
                            color:Colors.white,
                          ),
                          SizedBox(width:4,),
                          Text(
                            'Shortlisted \nBy Client',
                            style:TextStyle(
                              color:Colors.white,
                              fontFamily:"Times New Roman",
                              fontWeight:FontWeight.normal,
                              fontSize:13,
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
                SizedBox(height:16,),
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
                ),
                SizedBox(height:16,),
                Text(
                  "Job Description Lorem ipsum dolor sit amet, consectetur "
                      "adipiscing elit, sed do eiusmod tempor incididunt ut labore"
                      "et dolore magna aliqua. Ut enim ad minim,"
                      "Job Description Lorem ipsum dolor sit amet, consectetur "
                      "adipiscing elit, sed do eiusmod tempor incididunt ut labore"
                      "et dolore magna aliqua. Ut enim ad minim,",
                  maxLines:111,
                  style:TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.normal,
                    fontSize:16,
                  ),
                ),
                SizedBox(height:30,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment:Alignment.centerLeft,
                      child:Text(
                        'Skills:- ',
                        style:TextStyle(
                          color: Colors.black,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold,
                          fontSize:16,
                        ),
                      ),
                    ),
                    Container(
                      alignment:Alignment.centerLeft,
                      width:(MediaQuery.of(context).size.width-130),
                      child:Text(
                        'PHP, Laravel, Cake PHP, Core PHP PHP, Laravel, Cake PHP, Core PHP PHP, Laravel, Cake PHP, Core PHP',
                        style:TextStyle(
                          color: Colors.black,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold,
                          fontSize:16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:16,),
                Text(
                  'Activity on this Job:- ',
                  style:TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
                SizedBox(height:16,),
                Container(
                  padding:EdgeInsets.only(right:10),
                  child:Column(
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Proposals',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                          Text(
                            '40',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:6),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invites',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                          Text(
                            '10',
                            style:TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:50,),
                Container(
                  width:MediaQuery.of(context).size.width,
                  height:1,
                  alignment:Alignment.center,
                  color:Colors.black38,
                ),
                SizedBox(height:16),
                Text(
                  'Your info:- ',
                  style:TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                  ),
                ),
                SizedBox(height:10),
                Text(
                  "Your proposed price:- \$440",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
                SizedBox(height:10),
                Text(
                  "Your proposed time:- 3 months",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
                SizedBox(height:10),
                Text(
                  'Your cover text:-',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
                SizedBox(height:4),
                Text(
                  "Job Description Lorem ipsum dolor sit amet, consectetur "
                      "adipiscing elit, sed do eiusmod tempor incididunt ut labore"
                      "et dolore magna aliqua. Ut enim ad minim,"
                      "Job Description Lorem ipsum dolor sit amet, consectetur "
                      "adipiscing elit, sed do eiusmod tempor incididunt ut labore"
                      "et dolore magna aliqua. Ut enim ad minim,",
                  maxLines:111,
                  style:TextStyle(
                    color: Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.normal,
                    fontSize:16,
                  ),
                ),
                SizedBox(height:50),
                Center(
                  child:Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width:(MediaQuery.of(context).size.width-70)/2,
                          height:56,
                          alignment:Alignment.center,
                          decoration: BoxDecoration(
                            color:HexColor(themeColorBG),
                            borderRadius:BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color:Colors.grey.withOpacity(0.2),
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
                              'Edit Proposal',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                // color: AppColors.primaryText,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w400,
                                fontSize:16,
                                // letterSpacing: -0.576,
                              ),
                            ),
                            onPressed:() {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder:(context)=>SubmitProposal())
                              // );
                            },
                          )
                      ),
                      Container(
                          width:(MediaQuery.of(context).size.width-70)/2,
                          height:56,
                          alignment:Alignment.center,
                          margin:EdgeInsets.only(right:10),
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
                              'Withdraw Proposal',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                // color: AppColors.primaryText,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w400,
                                fontSize:16,
                                // letterSpacing: -0.576,
                              ),
                            ),
                            onPressed:() {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder:(context)=>SubmitProposal())
                              // );
                            },
                          )
                      ),
                    ],
                  )
                )
              ],
            ),
          )
      ),
    );
  }
}
