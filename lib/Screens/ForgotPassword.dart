

import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var txtEmail = TextEditingController();

  onGroup5588Pressed(BuildContext context) async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(txtEmail.text);

    if (txtEmail.text.isEmpty) {
      errorMessage('Enter Email-ID', context);
    } else if (!emailValid) {
      errorMessage('Enter a valid email ID', context);
    } else {
      showLoading(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email:txtEmail.text)
          .then((value) {
        dismissLoading(context);
        successeMessage('Check your mail.\nWe sent a reset passwored link on your mail ID.', context);
        Future.delayed(Duration(seconds:2),() {
          dismissLoading(context);
        });
      }).catchError((error) {
        dismissLoading(context);
        errorMessage(error.message, context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        elevation:0.5,
        backgroundColor:HexColor(themeColorSecondary),
        title:Text(
          "Reset Password",
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
      body: Container(
        // constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 186, 232, 217),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left:16, top:70),
              child:Text(
                "Tell us your email address, and we'll send you a link to reset password .",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:Colors.black,
                  fontFamily: "Times New Roman",
                  // fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height:60,
              margin:EdgeInsets.only(left: 13, top: 31, right: 12),
              child:Stack(
                alignment:Alignment.centerLeft,
                children:[
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
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
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:BoxDecoration(
                  color:HexColor(themeColorSecondary),
                  borderRadius:BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color:Colors.grey.withOpacity(0.2),
                    spreadRadius:2,
                    blurRadius:5,
                    offset: Offset(0,0), // changes position of shadow
                  ),
                ],
              ),
              width:200,
              height:56,
              margin:EdgeInsets.only(left:16, top:30, right:16),
              child:FlatButton(
                onPressed: () => this.onGroup5588Pressed(context),
                textColor: Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.all(0),
                child: Text(
                  "Reset",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w400,
                    fontSize:18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


