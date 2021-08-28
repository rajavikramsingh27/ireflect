import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:ireflect/Screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/TabbarScreen.dart';
import 'package:ireflect/Screens/TabbarScreen/Student/TabbarStudent.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3),() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(kAutoLogin) == null) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Login())
        );
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=>TabbarScreen())
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color:HexColor(themeColorSecondary),
        child:Center(
          child:Container(
            width:MediaQuery.of(context).size.width-40,
            height:MediaQuery.of(context).size.width-40,
            decoration: BoxDecoration(
              color:HexColor(themeColorSecondary),
              borderRadius:BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius:2,
                  blurRadius:5,
                  offset: Offset(0,0), // changes position of shadow
                ),
              ],
            ),
              child:ClipRRect(
                borderRadius:BorderRadius.circular(5),
                child:Image.asset(
                  'assets/images/logo.png',
                ),
              )
          )
        )
      ),
    );
  }
}


