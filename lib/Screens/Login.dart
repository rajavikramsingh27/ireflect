import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/ForgotPassword.dart';
import 'package:ireflect/Screens/SignUp.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/TabbarScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  signInWithEmailAndPassword() async {
    showLoading(context);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:txtEmail.text,
          password:txtPassword.text
      ).then((value) async {
        dismissLoading(context);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool(kAutoLogin, true);

        Navigator.push(context,
            MaterialPageRoute(builder:(context)=>TabbarScreen())
        );
      });
    }  on FirebaseAuthException catch (e) {
      dismissLoading(context);
      errorMessage(e.message, context);
    } catch (e) {
      print(e.message);
      dismissLoading(context);
      errorMessage(e.message, context);
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // Create a new credential.
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    showLoading(context);
    await _auth.signInWithCredential(credential).then((value) {
      dismissLoading(context);
      getUserData(value.user);

//       dictSocialProfile['picture'] = value.user.photoUrl;
//       dictSocialProfile['first_name'] = arrNames.first;
//       dictSocialProfile['last_name'] = arrNames.last;
//      print(dictSocialProfile);

//       socialLogin(value.user,'G-Mail');
    }).catchError((error) {
      dismissLoading(context);
      errorMessage(error.message, context);
    });
  }

  getUserData(User user) {
    User user = FirebaseAuth.instance.currentUser;

    showLoading(context);
      FirebaseFirestore.instance.collection(tblUsersProfile).
      doc(user.email+kFireBaseConnect+user.uid)
          .get().then((DocumentSnapshot documentSnapshot) {

        dismissLoading(context);

        if (documentSnapshot.exists) {
          Navigator.push(context,
              MaterialPageRoute(builder:(context)=>TabbarScreen())
          );
        } else {
          String userName = user.displayName;
          var arrNames = user.displayName.split(" ");
          print(arrNames);

          FirebaseFirestore.instance.collection(tblUsersProfile)
              .doc(user.email+kFireBaseConnect+user.uid).set({
            kProfilePicture :user.photoURL,
            kFirstName :arrNames[0],
            kLastName :arrNames[1],
            kEmail :user.email,
            kPhoneNumber:'',
            kIsSocial:true
          }).then((value) async {
            dismissLoading(context);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setBool(kAutoLogin, true);

            Navigator.push(context,
                MaterialPageRoute(builder:(context)=>TabbarScreen())
            );
          });
        }
      }).catchError((error) {
        dismissLoading(context);
        errorMessage(error.message, context);
      });
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidget = MediaQuery.of(context).size.width-40;

    return WillPopScope(
      onWillPop:() {

        return;
      },

      child:Scaffold(
          backgroundColor:HexColor(themeColorBG),
          body:SafeArea(
            child:SingleChildScrollView(
              padding:EdgeInsets.only(bottom:20),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children:[
                  SizedBox(
                    height:60,
                  ),
                  Container(
                    // margin:EdgeInsets.only(left:20),
                    width:sizeWidget,
                    height:60,
                    alignment:Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      border:Border.all(
                          color:HexColor(themeColorSecondary),
                          width:2
                      ),
                      borderRadius:BorderRadius.circular(4),
                    ),
                    child:TextField(
                      controller:txtEmail,
                      keyboardAppearance:Brightness.light,
                      keyboardType:TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.only(left:16,right:16),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:16,
                      ),
                      maxLines: 1,
                      autocorrect: false,
                    ),
                  ),
                  SizedBox(
                    height:16,
                  ),
                  Container(
                    // margin:EdgeInsets.only(left:20),
                    width:sizeWidget,
                    height:60,
                    alignment:Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      border:Border.all(
                          color:HexColor(themeColorSecondary),
                          width:2
                      ),
                      borderRadius:BorderRadius.circular(4),
                    ),
                    child:TextField(
                      controller:txtPassword,
                      keyboardAppearance:Brightness.light,
                      decoration: InputDecoration(
                        hintText: "Password",
                        contentPadding: EdgeInsets.only(left:16,right:16),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:16,
                      ),
                      obscureText: true,
                      maxLines: 1,
                      autocorrect: false,
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),
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
                          "Login",
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
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(txtEmail.text);
                          if (txtEmail.text.isEmpty) {
                            errorMessage('Enter your email', context);
                          } else if (!emailValid) {
                            errorMessage('Enter a valid email', context);
                          } else if (txtPassword.text.isEmpty) {
                           errorMessage('Enter your password', context);
                         } else {
                           signInWithEmailAndPassword();
                         }},
                      )
                  ),
                  SizedBox(
                    height:10,
                  ),
                  Container(
                      margin:EdgeInsets.only(right:20),
                      // width:200,
                      // height:60,
                      alignment:Alignment.centerRight,
                      // decoration: BoxDecoration(
                      //   color:HexColor(themeColorSecondary),
                      //   borderRadius:BorderRadius.circular(30),
                      // ),
                      child:FlatButton(
                        child:Text(
                          "Forgot Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // color: AppColors.primaryText,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.bold,
                            fontSize:16,
                            // letterSpacing: -0.576,
                          ),
                        ),
                        onPressed:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>ForgotPassword())
                          );
                        },
                      )
                  ),
                  SizedBox(
                    height:30,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      SizedBox(width:20,),
                      Container(
                        width:(sizeWidget-140)/2,
                        height:1,
                        decoration: BoxDecoration(
                          color:Colors.black,
                        ),
                      ),
                      Text(
                        "Or Sign with",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // color: AppColors.primaryText,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w700,
                          fontSize:16,
                        ),
                      ),
                      Container(
                        width:(sizeWidget-140)/2,
                        height:1,
                        decoration: BoxDecoration(
                          color:Colors.black,
                        ),
                      ),
                      SizedBox(width:20,),
                    ],
                  ),
                  SizedBox(
                    height:60,
                  ),
                  FlatButton(
                    child:Container(
                      // margin:EdgeInsets.only(left:20),
                      width:sizeWidget,
                      height:60,
                      alignment:Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color:Colors.blueAccent,
                        borderRadius:BorderRadius.circular(4),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin:EdgeInsets.only(left:5),
                            padding:EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius:BorderRadius.circular(4),
                            ),
                            height:50,
                            width:50,
                            child:SvgPicture.asset(
                              'assets/images/google.svg',
                              // color:Colors.red,
                              height:36,
                              // matchTextDirection: true,
                            ),
                          ),
                          Container(
                            child:Text(
                              "Sign in with Google",
                              textAlign:TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w700,
                                fontSize:16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height:50,
                            width:50,
                          ),
                        ],
                      ),
                    ),
                    onPressed:() {
                      signInWithGoogle();
                    },
                  ),
                  SizedBox(
                    height:10,
                  ),
                  FlatButton(
                    child:Container(
                      // margin:EdgeInsets.only(left:20),
                      width:sizeWidget,
                      height:60,
                      alignment:Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        // border:Border.all(
                        //     color:HexColor(themeColorSecondary),
                        //     width:2
                        // ),
                        borderRadius:BorderRadius.circular(4),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin:EdgeInsets.only(left:5),
                            padding:EdgeInsets.all(6),
                            height:50,
                            width:50,
                            child:SvgPicture.asset(
                              'assets/images/apple.svg',
                              color:Colors.black,
                              height:36,
                              // matchTextDirection: true,
                            ),
                          ),
                          Text(
                            "Sign in with Apple",
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color:Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w700,
                              fontSize:16,
                            ),
                          ),
                          SizedBox(
                            height:50,
                            width:50,
                          ),
                        ],
                      ),
                    ),
                    onPressed:() {

                    },
                  ),
                  SizedBox(
                    height:50,
                  ),
                  Container(
                      child:FlatButton(
                        child:RichText(
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:"Don't have an account? ",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:16,
                                ),
                              ),
                              TextSpan(
                                text:'Create New one',
                                style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold,
                                  fontSize:16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>SignUp())
                          );
                        },
                      )
                  ),
                ],
              ),
            ),
          )
      )
    );
  }
}

