

import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ireflect/Screens/TabbarScreen/Student/PostLesson.dart';
import 'package:ireflect/Screens/TabbarScreen/Student/StudentJob.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/EngagedLessons.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/Notifications.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/Profile.dart';
import 'package:dart_notification_center/dart_notification_center.dart';


class TabbarStudent extends StatefulWidget {
  @override
  _TabbarStudentState createState() => _TabbarStudentState();
}


class _TabbarStudentState extends State<TabbarStudent> {
  double iconSize = 28;
  double textSize = 0;
  int selectedIndex = 0;
  Color themeColorTabInActiveIcon = Colors.black45;

  final tabs = [
    StudentJob(),
    PostLesson(),
    EngagedLessons(),
    Notifications(),
    Profile(),
  ];

  Future<bool> onPressedBack() {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds:3),() {
      DartNotificationCenter.subscribe(
        channel:kStudentJobReload,
        observer:'1',
        onNotification: (result) {
          selectedIndex = 0;
          setState(() {

          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:onPressedBack,
      child: Scaffold(
        body:tabs[selectedIndex],
        bottomNavigationBar:BottomNavigationBar(
          elevation:10,
          currentIndex:selectedIndex,
          type:BottomNavigationBarType.fixed,
          backgroundColor:HexColor(themeColorSecondary),
          selectedItemColor:Colors.red,
          unselectedItemColor:Colors.yellow,
//        iconSize:30,
          items:[
            BottomNavigationBarItem(
              icon:SvgPicture.asset(
                'assets/images/jobsearch.svg',
                height:iconSize,
                color:themeColorTabInActiveIcon,
              ),
              activeIcon:SvgPicture.asset(
                'assets/images/jobsearch.svg',
                height:iconSize,
                color:HexColor(themeColorTabIcon),
              ),
              title:Text(
                'Workouts',
                style: TextStyle(
                  // color: AppColors.primaryText,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.w400,
                  fontSize:textSize,
                  // letterSpacing: -0.576,
                ),
              ),
              backgroundColor:Colors.white,
            ),
            BottomNavigationBarItem(
                icon:SvgPicture.asset(
                  'assets/images/plus.svg',
                  height:iconSize,
                  color:themeColorTabInActiveIcon,
                ),
                activeIcon:SvgPicture.asset(
                  'assets/images/plus.svg',
                  height:iconSize,
                  color:HexColor(themeColorTabIcon),
                ),
                title:Text(
                  'Goals',
                  style: TextStyle(
                    // color: AppColors.primaryText,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w400,
                    fontSize:textSize,
                    // letterSpacing: -0.576,
                  ),
                ),
                backgroundColor:Colors.white
            ),
            BottomNavigationBarItem(
                icon:SvgPicture.asset(
                  'assets/images/video.svg',
                  height:iconSize,
                  color:themeColorTabInActiveIcon,
                ),
                activeIcon:SvgPicture.asset(
                  'assets/images/video.svg',
                  height:iconSize,
                  color:HexColor(themeColorTabIcon),
                ),
                title:Text(
                  'Food Diary',
                  style: TextStyle(
                    // color: AppColors.primaryText,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w400,
                    fontSize:textSize,
                    // letterSpacing: -0.576,
                  ),
                ),
                backgroundColor:Colors.white
            ),
            BottomNavigationBarItem(
                icon:SvgPicture.asset(
                  'assets/images/notification.svg',
                  height:iconSize,
                  color:themeColorTabInActiveIcon,
                ),
                activeIcon:SvgPicture.asset(
                  'assets/images/notification.svg',
                  height:iconSize,
                  color:HexColor(themeColorTabIcon),
                ),
                title:Text(
                  'Track',
                  style: TextStyle(
                    // color: AppColors.primaryText,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w400,
                    fontSize:textSize,
                    // letterSpacing: -0.576,
                  ),
                ),
                backgroundColor:Colors.white
            ),
            BottomNavigationBarItem(
                icon:SvgPicture.asset(
                  'assets/images/profileuser.svg',
                  height:iconSize,
                  color:themeColorTabInActiveIcon,
                ),
                activeIcon:SvgPicture.asset(
                  'assets/images/profileuser.svg',
                  height:iconSize,
                  color:HexColor(themeColorTabIcon),
                ),
                title:Text(
                  'Profile',
                  style: TextStyle(
                    // color: AppColors.primaryText,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w400,
                    fontSize:textSize,
                    // letterSpacing: -0.576,
                  ),
                ),
                backgroundColor:Colors.white
            ),
          ],
          onTap:(index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),);
  }
}
