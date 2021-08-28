import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:ireflect/Constant.dart';
import 'package:intl/intl.dart';


var isTeacher = true;

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


errorMessage(String msg,context) {
  Toast.show(
      msg,
      context,
      duration: 2,
      gravity: Toast.CENTER,
      backgroundColor: HexColor(redColor));
}

String date_formatted(DateTime date) {
  var formatter = new DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}

successeMessage(String msg,context) {
  Toast.show(
      msg,
      context,
      duration: 2,
      gravity: Toast.CENTER,
      backgroundColor: HexColor(greenColor));
}



void showLoading(BuildContext context) {
  showDialog(
    context:context,
    barrierDismissible:true,
    builder:(BuildContext context) {
      return Dialog(
          backgroundColor: Colors.transparent,
          child:Container(
            decoration:BoxDecoration(
                color:HexColor(themeColorBG),
                borderRadius: BorderRadius.circular(6)
            ),
            height:80,
            // padding: EdgeInsets.only(left: 16, right: 16),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                CircularProgressIndicator(
                  backgroundColor:Colors.black54,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                SizedBox(width:20),
                Text(
                  'Loading...',
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
              ],
            ),
          ));
    },
  );
}

void dismissLoading(BuildContext context) {
  Navigator.pop(context);
}
