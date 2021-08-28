import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ireflect/Screens/TabbarScreen/Teacher/TabbarScreen.dart';
import 'package:ireflect/Screens/TabbarScreen/Student/TabbarStudent.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isAccept = false;

  File _image;
  final picker = ImagePicker();

  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPhoneNumber = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConfirmPassword = TextEditingController();

  createUserWithEmailAndPassword() async {
    showLoading(context);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:txtEmail.text,
          password:txtPassword.text
      ).then((value) async {
        var ref = FirebaseStorage.instance.ref().child('userProfilePicture/').child(value.user.email+kFireBaseConnect+value.user.uid);
        var uploadTask = ref.putFile(_image);
        var storageTaskSnapshot = await uploadTask.whenComplete(() {

        });

        var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        print(downloadUrl);

        FirebaseFirestore.instance.collection(tblUsersProfile)
            .doc(value.user.email+kFireBaseConnect+value.user.uid).set({
          kProfilePicture :downloadUrl,
          kFirstName :txtFirstName.text,
          kLastName :txtLastName.text,
          kEmail :txtEmail.text,
          kPhoneNumber :txtPhoneNumber.text,
          kPassword :txtPassword.text,
          kIsSocial:false
        }).then((value) async {
          dismissLoading(context);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool(kAutoLogin, true);

          Navigator.push(context,
              MaterialPageRoute(builder:(context)=>TabbarScreen())
          );
        });

        return;
      });
    } on FirebaseAuthException catch (e) {
      dismissLoading(context);
      errorMessage(e.message, context);
    } catch (e) {
      print(e.message);
      dismissLoading(context);
      errorMessage(e.message, context);
    }
  }

  Future openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
      // _uploadFile();
    });
  }

  Future openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
      // _uploadFile();
    });
  }

  _settingModalBottomSheet(context,) {
    showModalBottomSheet(
        backgroundColor:Colors.transparent,
        context: context,
        builder:(BuildContext bc) {
          return Container(
              height:280,
              decoration:BoxDecoration(
                color:HexColor(themeColorSecondary),
                borderRadius: BorderRadius.only(
                    topRight:  Radius.circular(20),
                    topLeft:  Radius.circular(20)
                ),
//              border: Border.all(width:3,color: Colors.green,style: BorderStyle.solid)
              ),
              child:Center(
                child:Column(
                  children:<Widget>[
                    SizedBox(height:30),
                    Text(
                      'Please select an option',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize:18,
                      ),
                    ),
                    SizedBox(height:10),
                    FlatButton(
                      child:Text(
                        'Camera',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize:16,
                        ),
                      ),
                      onPressed:() {
                        Navigator.pop(context);
                        openCamera();
                      },
                    ),
                    FlatButton(
                      child:Text(
                        'gallery',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      onPressed:() {
                        Navigator.pop(context);
                        openGallery();
                      },
                    ),
                    SizedBox(height:30,),
                    FlatButton(
                      child:Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
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
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds:3), () {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidget = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:HexColor(themeColorBG),
        body:SafeArea(
          bottom:false,
          child:Container(
            width:sizeWidget,
            child:SingleChildScrollView(
                padding:EdgeInsets.only(bottom:20),
                child:Column(
                  children:[
                    Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius:BorderRadius.circular(75),
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
                        padding:EdgeInsets.all(0),
                        child:_image == null
                            ? FadeInImage(
                          fit:BoxFit.fill,
                          height:150,
                          width:150,
                          image:NetworkImage(
                              ''
                          ),
                          placeholder:AssetImage(
                            'assets/images/defaultUser.png',
                          ),
                        )
                            : CircleAvatar(backgroundImage:FileImage(_image), radius:75.0),
                        onPressed:() {
                          _settingModalBottomSheet(context);
                        },
                      ),
                    ),
                    SizedBox(height:20),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment:Alignment.centerLeft,
                          width:(sizeWidget-40)/2-8,
                          height:60,
                          padding:EdgeInsets.only(left:16,right:16),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            border:Border.all(
                                color:HexColor(themeColorSecondary),
                                width:2
                            ),
                            // borderRadius:Radius.circular(10),
                          ),
                          child:TextField(
                            controller:txtFirstName,
                            keyboardType:TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "First Name",
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                        SizedBox(width:16),
                        Container(
                          alignment:Alignment.centerLeft,
                          width:(sizeWidget-40)/2-8,
                          height:60,
                          padding:EdgeInsets.only(left:16,right:16),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            border:Border.all(
                                color:HexColor(themeColorSecondary),
                                width:2
                            ),
                            // borderRadius:Radius.circular(10),
                          ),
                          child:TextField(
                            controller:txtLastName,
                            keyboardType:TextInputType.name,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              contentPadding: EdgeInsets.all(0),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:20),
                    Container(
                      alignment:Alignment.centerLeft,
                      width:sizeWidget-40,
                      height:60,
                      padding:EdgeInsets.only(left:16,right:16),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        border:Border.all(
                            color:HexColor(themeColorSecondary),
                            width:2
                        ),
                        // borderRadius:Radius.circular(10),
                      ),
                      child:TextField(
                        controller:txtEmail,
                        keyboardType:TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      alignment:Alignment.centerLeft,
                      width:sizeWidget-40,
                      height:60,
                      padding:EdgeInsets.only(left:16,right:16),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        border:Border.all(
                            color:HexColor(themeColorSecondary),
                            width:2
                        ),
                        // borderRadius:Radius.circular(10),
                      ),
                      child:TextField(
                        controller:txtPhoneNumber,
                        keyboardType:TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      alignment:Alignment.centerLeft,
                      width:sizeWidget-40,
                      height:60,
                      padding:EdgeInsets.only(left:16,right:16),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        border:Border.all(
                            color:HexColor(themeColorSecondary),
                            width:2
                        ),
                        // borderRadius:Radius.circular(10),
                      ),
                      child:TextField(
                        controller:txtPassword,
                        keyboardType:TextInputType.name,
                        obscureText:true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      alignment:Alignment.centerLeft,
                      width:sizeWidget-40,
                      height:60,
                      padding:EdgeInsets.only(left:16,right:16),
                      decoration: BoxDecoration(
                        color:Colors.white,
                        border:Border.all(
                            color:HexColor(themeColorSecondary),
                            width:2
                        ),
                        // borderRadius:Radius.circular(10),
                      ),
                      child:TextField(
                        controller:txtConfirmPassword,
                        keyboardType:TextInputType.name,
                        obscureText:true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          contentPadding: EdgeInsets.all(0),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        autocorrect: false,
                      ),
                    ),
                    // SizedBox(
                    //   height:10,
                    // ),
                    // Row(
                    //   children: [
                    //     Row(
                    //       children:[
                    //         SizedBox(
                    //           width:10,
                    //         ),
                    //         IconButton(
                    //           icon:isStudent
                    //               ? Icon(
                    //             Icons.check_box,
                    //             color:Colors.white,
                    //             size:30,
                    //           )
                    //               :Icon(
                    //             Icons.check_box_outline_blank,
                    //             color:Colors.white,
                    //             size:30,
                    //           ),
                    //           onPressed:() {
                    //             isStudent = true;
                    //
                    //             setState(() {
                    //
                    //             });
                    //           },
                    //         ),
                    //         Text(
                    //           'Student',
                    //           style: TextStyle(
                    //             color:Colors.black,
                    //             fontFamily: "Times New Roman",
                    //             fontWeight: FontWeight.normal,
                    //             fontSize:20,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     SizedBox(width:20),
                    //     Row(
                    //       children:[
                    //         SizedBox(
                    //           width:10,
                    //         ),
                    //         IconButton(
                    //           icon:!isStudent
                    //               ? Icon(
                    //             Icons.check_box,
                    //             color:Colors.white,
                    //             size:30,
                    //           )
                    //               :Icon(
                    //             Icons.check_box_outline_blank,
                    //             color:Colors.white,
                    //             size:30,
                    //           ),
                    //           onPressed:() {
                    //             isStudent = false;
                    //
                    //             setState(() {
                    //
                    //             });
                    //           },
                    //         ),
                    //         Text(
                    //           'Teacher',
                    //           style: TextStyle(
                    //             color:Colors.black,
                    //             fontFamily: "Times New Roman",
                    //             fontWeight: FontWeight.normal,
                    //             fontSize:20,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height:40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width:10,
                        ),
                        IconButton(
                          icon:isAccept
                          ? Icon(
                            Icons.check_box,
                            color:Colors.white,
                            size:30,
                          )
                          :Icon(
                            Icons.check_box_outline_blank,
                            color:Colors.white,
                            size:30,
                          ),
                          onPressed:() {
                            isAccept = !isAccept;

                            setState(() {

                            });
                          },
                        ),
                        RichText(
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:"I accept the ",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:16,
                                ),
                              ),
                              TextSpan(
                                text:"terms ",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold,
                                  fontSize:16,
                                ),
                              ),
                              TextSpan(
                                text:"and ",
                                style: TextStyle(
                                  color:Colors.black,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.normal,
                                  fontSize:16,
                                ),
                              ),
                              TextSpan(
                                text:"policy.",
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
                      ],
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
                            'Sign Up',
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
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(txtEmail.text);

                            if (_image == null) {
                              errorMessage('Select an iamge', context);
                            } else if (txtFirstName.text.isEmpty) {
                              errorMessage('Enter your first name', context);
                            } else if (txtLastName.text.isEmpty) {
                              errorMessage('Enter your last name', context);
                            } else if (txtEmail.text.isEmpty) {
                              errorMessage('Enter your email', context);
                            } else if (!emailValid) {
                              errorMessage('Enter a valid email', context);
                            } else if (txtPhoneNumber.text.isEmpty) {
                              errorMessage('Enter your phone number', context);
                            } else if (txtPassword.text.isEmpty) {
                              errorMessage('Enter your password', context);
                            } else if (txtConfirmPassword.text.isEmpty) {
                              errorMessage('Enter your confirm password', context);
                            } else if (txtPassword.text != txtConfirmPassword.text) {
                              errorMessage('Password and Confirm Password must be same', context);
                            } else if (!isAccept) {
                              errorMessage('Please accept the terma and policy', context);
                            } else {
                              createUserWithEmailAndPassword();
                            }
                          },
                        )
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
                                  text:"Already have an account? ",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:16,
                                  ),
                                ),
                                TextSpan(
                                  text:'Sign In',
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
                            Navigator.pop(context);
                          },
                        )
                    ),
                  ],
                )
            ),
          )
        )
    );
  }
}




