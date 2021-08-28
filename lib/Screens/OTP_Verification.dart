import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/TabbarScreen.dart';


class OTP_Verification extends StatefulWidget {
  @override
  _OTP_VerificationState createState() => _OTP_VerificationState();
}

class _OTP_VerificationState extends State<OTP_Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor(themeColorBG),
      appBar:AppBar(
        centerTitle:true,
        elevation:0.5,
        backgroundColor:HexColor(themeColorSecondary),
        title:Text(
          'OTP Verification',
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
      body:Container(
        width:MediaQuery.of(context).size.width,
        child:SingleChildScrollView(
          child:Column(
            children: [
              SizedBox(height:50,),
              SvgPicture.asset(
                'assets/images/password.svg',
                height:160,
              ),
              SizedBox(height:20),
              Container(
                padding:EdgeInsets.only(left:20,right:20),
                child:Text(
                'Enter OTP code which sent to your number',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              ),
              Text(
                '+91 6322776389',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(height:50),
              Container(
                width:MediaQuery.of(context).size.width-32,
                padding:EdgeInsets.only(top:40,bottom:30),
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius:2,
                      blurRadius:5,
                      offset: Offset(0,0), // changes position of shadow
                    ),
                  ],
                ),
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Container(
                          width:10,
                          height:60,
                        ),
                        Container(
                          width:60,
                          height:60,
                          decoration:BoxDecoration(
                            color:HexColor(themeColorSecondary),
                            borderRadius:BorderRadius.circular(2),
                          ),
                          alignment:Alignment.center,
                          child:TextField(
                            textAlign:TextAlign.center,
                            keyboardAppearance:Brightness.light,
                            keyboardType:TextInputType.number,
                            decoration: InputDecoration(
                              counterText:'',
                              hintText:'',
                              contentPadding: EdgeInsets.only(left:16,right:16),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:30,
                            ),
                            maxLength:1,
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                        Container(
                          width:60,
                          height:60,
                          decoration:BoxDecoration(
                            color:HexColor(themeColorSecondary),
                            borderRadius:BorderRadius.circular(2),
                          ),
                          alignment:Alignment.center,
                          child:TextField(
                            textAlign:TextAlign.center,
                            keyboardAppearance:Brightness.light,
                            keyboardType:TextInputType.number,
                            decoration: InputDecoration(
                              counterText:'',
                              hintText:'',
                              contentPadding: EdgeInsets.only(left:16,right:16),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:30,
                            ),
                            maxLength:1,
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                        Container(
                          width:60,
                          height:60,
                          decoration:BoxDecoration(
                            color:HexColor(themeColorSecondary),
                            borderRadius:BorderRadius.circular(2),
                          ),
                          alignment:Alignment.center,
                          child:TextField(
                            textAlign:TextAlign.center,
                            keyboardAppearance:Brightness.light,
                            keyboardType:TextInputType.number,
                            decoration: InputDecoration(
                              counterText:'',
                              hintText:'',
                              contentPadding: EdgeInsets.only(left:16,right:16),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:30,
                            ),
                            maxLength:1,
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                        Container(
                          width:60,
                          height:60,
                          decoration:BoxDecoration(
                            color:HexColor(themeColorSecondary),
                            borderRadius:BorderRadius.circular(2),
                          ),
                          alignment:Alignment.center,
                          child:TextField(
                            textAlign:TextAlign.center,
                            keyboardAppearance:Brightness.light,
                            keyboardType:TextInputType.number,
                            decoration: InputDecoration(
                              counterText:'',
                              hintText:'',
                              contentPadding: EdgeInsets.only(left:16,right:16),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:30,
                            ),
                            maxLength:1,
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                        Container(
                          width:10,
                        ),
                      ],
                    ),
                    SizedBox(height:40,),
                    Container(
                      // margin:EdgeInsets.only(left:20),
                        width:200,
                        height:56,
                        alignment:Alignment.center,
                        decoration: BoxDecoration(
                          color:HexColor(themeColorSecondary),
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
                            'Continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              // color: AppColors.primaryText,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:18,
                              // letterSpacing: -0.576,
                            ),
                          ),
                          onPressed:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>TabbarScreen())
                            );
                          },
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

