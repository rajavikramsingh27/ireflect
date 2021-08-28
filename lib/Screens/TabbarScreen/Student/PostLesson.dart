

import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_notification_center/dart_notification_center.dart';


class PostLesson extends StatefulWidget {
  @override
  _PostLessonState createState() => _PostLessonState();
}

class _PostLessonState extends State<PostLesson> {
  String strSelectedCategory = 'Select a category-';
  String strSelectedCountry = 'Select a country';
  String selectedMedium = 'Video / Image / Text';

  var txtLessonTitle = TextEditingController();
  var txtLessonDescription = TextEditingController();
  var txtLessonDuration = TextEditingController();
  var txtBudget = TextEditingController();

  Country _selectedFilteredDialogCountry = CountryPickerUtils.getCountryByPhoneCode('90');

  var dateCreated = DateTime.now();
  var user = FirebaseAuth.instance.currentUser;


  void _openFilteredCountryPickerDialog() => showDialog(
    context: context,
    builder:(context) => Theme(
        data:Theme.of(context).copyWith(primaryColor: Colors.pink),
        child:CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            // searchCursorColor: Colors.pinkAccent,
            searchInputDecoration:InputDecoration(
              hintText: 'Search...',
              hintStyle:TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.normal,
                fontSize:16,
              ),
            ),
            isSearchable: true,
            title: Text(
              'Select your phone code',
              style:TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold,
                fontSize:18,
              ),
            ),
            // onValuePicked: (Country country) =>
            //     setState(() => _selectedFilteredDialogCountry = country),
            onValuePicked:(Country country) {
              _selectedFilteredDialogCountry = country;
              strSelectedCountry = country.name;

              setState(() {

              });
            },
            // itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
            itemBuilder: _buildDialogItem)
    ),
  );

  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 8.0),
      Text("+${country.phoneCode}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(country.name))
    ],
  );

  select_medium(context,) {
    showModalBottomSheet(
        backgroundColor:Colors.transparent,
        context: context,
        builder:(BuildContext bc) {
          return Container(
              height:360,
              margin:EdgeInsets.only(left:30,right:30),
              decoration:BoxDecoration(
                color:HexColor(themeColorSecondary),
                borderRadius:BorderRadius.only(
                    topRight:Radius.circular(20),
                    topLeft:Radius.circular(20)
                ),
              ),
              child:Center(
                child:Column(
                  children:<Widget>[
                    SizedBox(height:20),
                    Text(
                      'Please select an option',
                      style:TextStyle(
                        color:Color.fromARGB(255, 0, 0, 0),
                        fontFamily:"Times New Roman",
                        fontWeight:FontWeight.bold,
                        fontSize:18,
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      height:50,
                      padding:EdgeInsets.only(left:10,right:10),
                      decoration:BoxDecoration(
                          color:HexColor(themeColorTabIcon),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Through Video',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          selectedMedium = 'Through Video';
                          setState(() {

                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      height:50,
                      padding:EdgeInsets.only(left:10,right:10),
                      decoration:BoxDecoration(
                          color:HexColor(themeColorTabIcon),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Through Image',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          selectedMedium = 'Through Image';
                          setState(() {

                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      height:50,
                      // width:140,
                      padding:EdgeInsets.only(left:10,right:10),
                      decoration:BoxDecoration(
                          color:HexColor(themeColorTabIcon),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Through Text',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          selectedMedium = 'Through Text';
                          setState(() {

                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height:40),
                    Container(
                      height:50,
                      width:140,
                      decoration:BoxDecoration(
                          color:HexColor('FF001C').withOpacity(0.6),
                          borderRadius:BorderRadius.circular(25)
                      ),
                      child:FlatButton(
                        child:Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            fontSize:16,
                          ),
                        ),
                        onPressed:() {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  void post_Lesson() {
    showLoading(context);
    FirebaseFirestore.instance.collection(tblUsersProfile).
    doc(user.email+kFireBaseConnect+user.uid)
        .get().then((DocumentSnapshot documentSnapshot) {
          dismissLoading(context);

      if (documentSnapshot.exists) {
        showLoading(context);
        FirebaseFirestore.instance.collection(tblJobLesson)
            .doc(user.email+kFireBaseConnect+dateCreated.toString()).set({
          kFirstName:documentSnapshot.data()[kFirstName],
          kLastName:documentSnapshot.data()[kLastName],
          kEmail:documentSnapshot.data()[kEmail],
          kPhoneNumber:documentSnapshot.data()[kPhoneNumber],
          kLessonTitle:txtLessonTitle.text,
          kLessonCategory:strSelectedCategory,
          kLessonDescription:txtLessonDescription.text,
          kLessonBudget:txtBudget.text,
          kLessonDuration:txtLessonDuration.text,
          kCountryOfTeacher:strSelectedCountry,
          kLessonMedium:selectedMedium,
          kCreatedTime:date_formatted(dateCreated)
        }).then((value) async {
          dismissLoading(context);
          successeMessage('Lesson has posted successfully', context);

          Future.delayed(Duration(seconds:2),() {
            DartNotificationCenter.post(channel:kStudentJobReload);
          });

          return;
        }).catchError((error) {
          dismissLoading(context);
          errorMessage(error.message, context);

          return;
        });
      }
    });
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
          'Post a lesson',
          textAlign: TextAlign.left,
          style: TextStyle(
            color:Colors.black,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.w400,
            fontSize:20,
          ),
        ),
        leading:Text(''),
      ),
      body:AnimatedContainer(
          duration:Duration(seconds: 1),
          curve:Curves.fastOutSlowIn,
          margin:EdgeInsets.only(top:16,bottom:0,left: 16,right: 16),
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            color:HexColor(themeColorSecondary),
            borderRadius:BorderRadius.circular(4),
            boxShadow:[
              BoxShadow(
                color:Colors.grey.withOpacity(0.6),
                spreadRadius:2,
                blurRadius:5,
                offset: Offset(0,0), // changes position of shadow
              ),
            ],
          ),
          child:SingleChildScrollView(
            padding:EdgeInsets.only(left:10,right:0,top:10,bottom:16),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson Title',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        // color: AppColors.primaryText,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:17,
                        // letterSpacing: -0.576,
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      // margin:EdgeInsets.only(left:20),
                      width:MediaQuery.of(context).size.width-52,
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
                        controller:txtLessonTitle,
                        keyboardAppearance:Brightness.light,
                        keyboardType:TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText:'',
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
                  ],
                ),
                SizedBox(height:16,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson Category',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        // color: AppColors.primaryText,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:17,
                        // letterSpacing: -0.576,
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      width:MediaQuery.of(context).size.width-52,
                      height:60,
                      alignment:Alignment.centerLeft,
                      // padding:EdgeInsets.only(left:16,right:16),
                      decoration:BoxDecoration(
                        color:Colors.white,
                        border:Border.all(
                            color:HexColor(themeColorSecondary),
                            width:2
                        ),
                        borderRadius:BorderRadius.circular(4),
                      ),
                        child:Center(
                          child:Container(
                            width:MediaQuery.of(context).size.width-90,
                            // width:111,
                            child:DropdownButton<String>(
                              isExpanded:true,
                              value:strSelectedCategory,
                              icon:Icon(Icons.arrow_drop_down_outlined),
                              iconSize:30,
                              underline:SizedBox(),
                              dropdownColor:HexColor(themeColorBG),
                              onChanged:(String newValue) {
                                FocusScope.of(context).unfocus();

                                setState(() {
                                  strSelectedCategory = newValue;
                                });},
                              items: <String>['Select a category-' ,'First', 'Second', 'Third', 'Fourth']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value:value,
                                  child:Text(
                                    value,
                                    style:TextStyle(
                                      // color: AppColors.primaryText,
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.w400,
                                      fontSize:17,
                                      // letterSpacing: -0.576,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height:16,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson Description',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        // color: AppColors.primaryText,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:17,
                        // letterSpacing: -0.576,
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      width:MediaQuery.of(context).size.width-52,
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
                        controller:txtLessonDescription,
                        keyboardAppearance:Brightness.light,
                        keyboardType:TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText:'',
                          contentPadding: EdgeInsets.only(
                              left:16,right:16,
                              top:16,bottom:16
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize:16,
                        ),
                        maxLines:10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height:16,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Lesson Budget ',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            // color: AppColors.primaryText,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w400,
                            fontSize:17,
                            // letterSpacing: -0.576,
                          ),
                        ),
                        Text(
                          '(will proceed in USD)',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            // color: AppColors.primaryText,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w400,
                            fontSize:13,
                            // letterSpacing: -0.576,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:5),
                    Container(
                      // margin:EdgeInsets.only(left:20),
                      width:MediaQuery.of(context).size.width-52,
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
                        controller:txtBudget,
                        keyboardAppearance:Brightness.light,
                        keyboardType:TextInputType.number,
                        decoration: InputDecoration(
                          hintText:'',
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
                  ],
                ),
                SizedBox(height:16,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson duration / time',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        // color: AppColors.primaryText,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:17,
                        // letterSpacing: -0.576,
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      // margin:EdgeInsets.only(left:20),
                      width:MediaQuery.of(context).size.width-52,
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
                        controller:txtLessonDuration,
                        keyboardAppearance:Brightness.light,
                        keyboardType:TextInputType.number,
                        decoration: InputDecoration(
                          hintText:'2 days',
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
                  ],
                ),
                SizedBox(height:16,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text(
                      'Select a country of teacher',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        // color: AppColors.primaryText,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:17,
                        // letterSpacing: -0.576,
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      // margin:EdgeInsets.only(left:20),
                      width:MediaQuery.of(context).size.width-52,
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
                      child:FlatButton(
                        minWidth:double.infinity,
                        height:double.infinity,
                        // padding:EdgeInsets.only(left:0),
                        child:Align(
                          alignment:Alignment.centerLeft,
                          child:Text(
                            strSelectedCountry,
                            style:TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:16,
                            ),
                          ),
                        ),
                        onPressed:() {
                          FocusScope.of(context).unfocus();
                          _openFilteredCountryPickerDialog();
                        },
                      )
                    ),
                  ],
                ),
                SizedBox(height:16,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select medium for lesson',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        // color: AppColors.primaryText,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.w400,
                        fontSize:17,
                        // letterSpacing: -0.576,
                      ),
                    ),
                    SizedBox(height:5),
                    Container(
                      // margin:EdgeInsets.only(left:20),
                      width:MediaQuery.of(context).size.width-52,
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
                      child:FlatButton(
                        minWidth:double.infinity,
                        height:double.infinity,
                        child:Align(
                          alignment:Alignment.centerLeft,
                          child:Text(
                            selectedMedium,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize:16,
                            ),
                          ),
                        ),
                        onPressed:() {
                          FocusScope.of(context).unfocus();
                          select_medium(context);
                        },
                      )
                    ),
                  ],
                ),
                SizedBox(height:50,),
                Center(
                  child:Container(
                      width:200,
                      height:56,
                      alignment:Alignment.center,
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
                          'Post',
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            // color: AppColors.primaryText,
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.w400,
                            fontSize:18,
                            // letterSpacing: -0.576,
                          ),
                        ),
                        onPressed:() {
                          if (txtLessonTitle.text.isEmpty) {
                            errorMessage('Enter lesson title', context);
                          } else if (strSelectedCategory == 'Select a category-') {
                            errorMessage('Select a category', context);
                          } else if (txtLessonDescription.text.isEmpty) {
                            errorMessage('Enter lesson description', context);
                          } else if (txtBudget.text.isEmpty) {
                            errorMessage('Enter lesson budget', context);
                          } else if (txtLessonDuration.text.isEmpty) {
                            errorMessage('Enter lesson duration', context);
                          } else if (strSelectedCountry == 'Select a country') {
                            errorMessage('Select a teacher location', context);
                          } else if (selectedMedium == 'Video / Image / Text') {
                            errorMessage('Select a midium', context);
                          } else {
                            post_Lesson();
                          }
                        },
                      )
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}




