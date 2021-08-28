import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User user = FirebaseAuth.instance.currentUser;

  Map<String,dynamic> dictUserData = Map<String,dynamic>();
  String strProfilePicture = '';
  var txtFirstName = TextEditingController();
  var txtLastName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPhoneNumber = TextEditingController();

  bool isProfessionalProfile = false;
  File  _image;
  final picker = ImagePicker();

  Future openCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
      uploadImage();
    });
  }

  Future openGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
      uploadImage();
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

  getUserData() {
    if (user != null) {
      showLoading(context);
      FirebaseFirestore.instance.collection(tblUsersProfile).
      doc(user.email+kFireBaseConnect+user.uid)
          .get().then((DocumentSnapshot documentSnapshot) {

        dismissLoading(context);

        if (documentSnapshot.exists) {
          dictUserData = documentSnapshot.data();
          strProfilePicture = dictUserData[kProfilePicture].toString();
          txtFirstName.text = dictUserData[kFirstName].toString();
          txtLastName.text = dictUserData[kLastName].toString();
          txtEmail.text = dictUserData[kEmail].toString();
          txtPhoneNumber.text = dictUserData[kPhoneNumber].toString();

          setState(() {

          });

          return;
        }
      }).catchError((error) {
        dismissLoading(context);
        errorMessage(error.message, context);
      });
    }
  }

  updateUserData() {
    showLoading(context);
    FirebaseFirestore.instance.collection(tblUsersProfile)
        .doc(user.email+kFireBaseConnect+user.uid).update({
      kProfilePicture :strProfilePicture,
      kFirstName :txtFirstName.text,
      kLastName :txtLastName.text,
      kEmail :txtEmail.text,
      kPhoneNumber :txtPhoneNumber.text,
    }).then((value) {
      dismissLoading(context);
      successeMessage('Profile updated successfully',context);
      return;
    }).catchError((error) {
      dismissLoading(context);
      errorMessage(error.message, context);
    });
  }

  uploadImage() async {
    showLoading(context);
    var ref = FirebaseStorage.instance.ref().child('userProfilePicture/')
        .child(user.email+kFireBaseConnect+user.uid);
    var uploadTask = ref.putFile(_image);
    var storageTaskSnapshot = await uploadTask.whenComplete(() {
      print('uploaded');
      dismissLoading(context);
    });

    strProfilePicture = await storageTaskSnapshot.ref.getDownloadURL();
    print(strProfilePicture);

    showLoading(context);
    FirebaseFirestore.instance.collection(tblUsersProfile)
        .doc(user.email+kFireBaseConnect+user.uid).update({
      kProfilePicture :strProfilePicture,
    }).then((value) {
      dismissLoading(context);
      successeMessage('Profile picture updated', context);

      return;
    }).catchError((error) {
      dismissLoading(context);
      errorMessage(error.message, context);
    });
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds:4),() {
      getUserData();
    });

  }

  @override
  Widget build(BuildContext context) {
    var sizeWidget = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:HexColor(themeColorBG),
        appBar:AppBar(
          centerTitle:true,
          elevation:0.5,
          backgroundColor:HexColor(themeColorSecondary),
          title:Text(
            'Edit Profile',
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
        body:SafeArea(
            child:Container(
              width:sizeWidget,
              child:SingleChildScrollView(
                  padding:EdgeInsets.only(bottom:20,top:20),
                  child:Column(
                    children:[
                      Container(
                        width:MediaQuery.of(context).size.width-110,
                        height:50,
                        decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(25),
                            border:Border.all(
                                color:Colors.white,
                                width:1
                            )
                        ),
                        child:Row(
                          children: [
                            Container(
                              decoration:!isProfessionalProfile
                                  ? BoxDecoration(
                                  color:HexColor(themeColorSecondary),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0),
                                  )
                              )
                                  : BoxDecoration(),
                              child:FlatButton(
                                height:double.infinity,
                                // minWidth:(MediaQuery.of(context).size.width-100)/2-1.5,
                                child:Text(
                                  'Profile',
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                    fontSize:17,
                                  ),
                                ),
                                onPressed:() {
                                  isProfessionalProfile = false;
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                            Container(
                              height:50,
                              width:1,
                              color:Colors.white,
                            ),
                            Expanded(
                              child:Container(
                                decoration:isProfessionalProfile
                                    ? BoxDecoration(
                                    color:HexColor(themeColorSecondary),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                    )
                                )
                                    : BoxDecoration(),
                                child:FlatButton(
                                  height:double.infinity,
                                  // minWidth:(MediaQuery.of(context).size.width-200),
                                  child:Text(
                                    'Professional Profile',
                                    style: TextStyle(
                                      color:Colors.black,
                                      fontFamily: "Times New Roman",
                                      fontWeight: FontWeight.normal,
                                      fontSize:17,
                                    ),
                                  ),
                                  onPressed:() {
                                    isProfessionalProfile = true;
                                    setState(() {

                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height:16,
                      ),
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
                              ? ClipRRect(
                            borderRadius:BorderRadius.circular(75),
                            child:FadeInImage(
                              fit:BoxFit.fill,
                              height:150,
                              width:150,
                              image:NetworkImage(
                                  strProfilePicture
                              ),
                              placeholder:AssetImage(
                                'assets/images/userDefault.png',
                              ),
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
                      SizedBox(
                        height:30,
                      ),
                      Container(
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
                              'Update',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                // color: AppColors.primaryText,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.w400,
                                fontSize:17,
                                // letterSpacing: -0.576,
                              ),
                            ),
                            onPressed:() {
                              bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(txtEmail.text);

                              if (strProfilePicture.isEmpty) {
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
                              } else {
                                updateUserData();
                              }

                            }
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
