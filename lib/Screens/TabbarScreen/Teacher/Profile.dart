

import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter/rendering.dart';
import 'package:ireflect/Screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:ireflect/Screens/EditProfile.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/TabbarScreen.dart';
import 'package:ireflect/Screens/TabbarScreen/Student/TabbarStudent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ireflect/Screens/ForgotPassword.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String strProfilePicture = '';
  String strFullName = '---';
  bool isSocial = false;


  bool isAccept = false;

  switchStudentTeacher(context,) {
    showModalBottomSheet(
        backgroundColor:Colors.transparent,
        context: context,
        builder:(BuildContext bc) {
          return Container(
              height:220,
              padding:EdgeInsets.only(left:16,right:16),
              decoration:BoxDecoration(
                color:HexColor(themeColorBG),
                borderRadius: BorderRadius.only(
                    topRight:  Radius.circular(10),
                    topLeft:  Radius.circular(10)
                ),
//              border: Border.all(width:3,color: Colors.green,style: BorderStyle.solid)
              ),
              child:Center(
                child:Column(
                  children:<Widget>[
                    SizedBox(height:30),
                    Text(
                      'Are you sure ?',
                      style: TextStyle(
                        color:Colors.redAccent,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.normal,
                        fontSize:24,
                      ),
                    ),
                    SizedBox(height:6),
                    Text(
                      isTeacher
                          ? 'Do you want to switch for Student Profile ?'
                          : 'Do you want to switch for Teacher Profile ?',
                      style: TextStyle(
                        color:Colors.redAccent,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.normal,
                        fontSize:18,
                      ),
                    ),
                    SizedBox(height:10),
                    FlatButton(
                      child:Text(
                        'Switch',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        ),
                      ),
                      onPressed:() {
                        Navigator.pop(context);

                        isTeacher = !isTeacher;

                        Navigator.of(context, rootNavigator: false).push(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => isTeacher
                                ? TabbarScreen()
                                : TabbarStudent(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height:0,),
                    FlatButton(
                      child:Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        ),
                      ),
                      onPressed:() {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  logOut(context,) {
    showModalBottomSheet(
        backgroundColor:Colors.transparent,
        context: context,
        builder:(BuildContext bc) {
          return Container(
              height:220,
              decoration:BoxDecoration(
                color:HexColor(themeColorBG),
                borderRadius: BorderRadius.only(
                    topRight:  Radius.circular(10),
                    topLeft:  Radius.circular(10)
                ),
//              border: Border.all(width:3,color: Colors.green,style: BorderStyle.solid)
              ),
              child:Center(
                child:Column(
                  children:<Widget>[
                    SizedBox(height:30),
                    Text(
                      'Are you sure ?',
                      style: TextStyle(
                        color:Colors.redAccent,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.normal,
                        fontSize:24,
                      ),
                    ),
                    SizedBox(height:6),
                    Text(
                      'Do you want to Log Out ?',
                      style: TextStyle(
                        color:Colors.redAccent,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.normal,
                        fontSize:20,
                      ),
                    ),
                    SizedBox(height:10),
                    FlatButton(
                      child:Text(
                        'Yes',
                        style:TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        ),
                      ),
                      onPressed:() async {
                        FirebaseAuth.instance.signOut();
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('isTeacher');
                        Navigator.pop(context);

                        Navigator.of(context, rootNavigator: false).push(
                          CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => Login(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height:0,),
                    FlatButton(
                      child:Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize:20,
                        ),
                      ),
                      onPressed:() {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds:4),() {
      getUserData();
    });

  }

  getUserData() {
    User user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseFirestore.instance.collection(tblUsersProfile).
      doc(user.email+kFireBaseConnect+user.uid)
          .get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print(documentSnapshot.data());
          strProfilePicture = documentSnapshot.data()[kProfilePicture];
          strFullName = documentSnapshot.data()[kFirstName]+' '+documentSnapshot.data()[kLastName];
          isSocial = documentSnapshot.data()[kIsSocial];

          setState(() {

          });
        }
      });
    }

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
            'Profile',
            textAlign:TextAlign.left,
            style:TextStyle(
              color:Colors.black,
              fontFamily:'Times New Roman',
              fontWeight:FontWeight.w400,
              fontSize:20,
            ),
          ),
          leading:Text(''),
        ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Container(
            padding:EdgeInsets.only(left: 16,right: 16,top:16,bottom:16),
            decoration: BoxDecoration(
              border:Border(
                bottom:BorderSide(
                    width: 1.0,
                    color: Colors.black54),
              ),
            ),
            child:Row(
              children: [
                Container(
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.circular(75),
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.withOpacity(0.2),
                        spreadRadius:2,
                        blurRadius:5,
                        offset: Offset(0,0), // changes position of shadow
                      ),
                    ],
                  ),
                  child:ClipRRect(
                    borderRadius:BorderRadius.circular(75),
                    child:FadeInImage(
                      fit:BoxFit.fill,
                      height:100,
                      width:100,
                      image:NetworkImage(
                          strProfilePicture
                      ),
                      placeholder:AssetImage(
                        'assets/images/userDefault.png',
                      ),
                    ),
                  )
                ),
                SizedBox(width:16,),
                Container(
                  width:MediaQuery.of(context).size.width-148,
                  child:Text(
                    strFullName,
                    textAlign: TextAlign.left,
                    maxLines:2,
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:"Times New Roman",
                      fontWeight:FontWeight.normal,
                      fontSize:30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:EdgeInsets.only(left:0,right:0,top:0,bottom:0),
            width:MediaQuery.of(context).size.width,
            alignment:Alignment.centerLeft,
            decoration: BoxDecoration(
              border:Border(
                bottom:BorderSide(
                    width: 1.0,
                    color: Colors.black54),
              ),
            ),
            child:FlatButton(
              // minWidth:222,
              height:54,
              child:Text(
                'Edit Profile',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:Colors.black,
                  fontFamily:"Times New Roman",
                  fontWeight:FontWeight.normal,
                  fontSize:17,
                ),
              ),
              onPressed:() {
                Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>EditProfile())
                );
              },
            )
          ),
          Container(
              padding:EdgeInsets.only(left:0,right:0,top:0,bottom:0),
              width:MediaQuery.of(context).size.width,
              alignment:Alignment.centerLeft,
              decoration: BoxDecoration(
                border:Border(
                  bottom:BorderSide(
                      width: 1.0,
                      color: Colors.black54),
                ),
              ),
              child:FlatButton(
                // minWidth:222,
                height:54,
                child:Text(
                  isTeacher
                      ? 'Switch profile as Student'
                      : 'Switch profile as Teacher',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:Colors.black,
                    fontFamily:"Times New Roman",
                    fontWeight:FontWeight.normal,
                    fontSize:17,
                  ),
                ),
                onPressed:() {
                  switchStudentTeacher(context);
                },
              )
          ),
          Visibility(
            visible:!isSocial,
            child:Container(
                padding:EdgeInsets.only(left:0,right:0,top:0,bottom:0),
                width:MediaQuery.of(context).size.width,
                alignment:Alignment.centerLeft,
                decoration: BoxDecoration(
                  border:Border(
                    bottom:BorderSide(
                        width: 1.0,
                        color: Colors.black54),
                  ),
                ),
                child:FlatButton(
                  // minWidth:222,
                  height:54,
                  child:Text(
                    'Reset Password',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:"Times New Roman",
                      fontWeight:FontWeight.normal,
                      fontSize:17,
                    ),
                  ),
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context)=>ForgotPassword())
                    );
                  },
                )
            ),
          ),
          Container(
              padding:EdgeInsets.only(left:0,right:0,top:0,bottom:0),
              width:MediaQuery.of(context).size.width,
              alignment:Alignment.centerLeft,
              decoration: BoxDecoration(
                border:Border(
                  bottom:BorderSide(
                      width: 1.0,
                      color: Colors.black54),
                ),
              ),
              child:FlatButton(
                // minWidth:222,
                height:54,
                child:Text(
                  'Log Out',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:Colors.black,
                    fontFamily:"Times New Roman",
                    fontWeight:FontWeight.normal,
                    fontSize:17,
                  ),
                ),
                onPressed:() {
                  logOut(context);
                },
              )
          ),
        ],
      ) ,
    );
  }
}
