import 'package:flutter/material.dart';
import 'package:ireflect/Constant.dart';
import 'package:ireflect/Global.dart';


class SubmitProposal extends StatefulWidget {
  @override
  _SubmitProposalState createState() => _SubmitProposalState();
}

class _SubmitProposalState extends State<SubmitProposal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:HexColor(themeColorBG),
      appBar:AppBar(
        centerTitle:true,
        elevation:0.5,
        backgroundColor:HexColor(themeColorSecondary),
        title:Text(
          'Submit Proposal',
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
      body:AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        margin:EdgeInsets.only(top:16,bottom:0,left: 16,right: 16),
        width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:HexColor(themeColorSecondary),
          borderRadius:BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius:2,
              blurRadius:5,
              offset: Offset(0,0), // changes position of shadow
            ),
          ],
        ),
        child:SingleChildScrollView(
          padding:EdgeInsets.only(left:0,right:0,top:16,bottom:30),
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Text(
                  'Payment Terms',
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:20,
                  ),
                ),
              ),
              SizedBox(height:16,),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Text(
                  'Hourly Rate',
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
              ),
              SizedBox(height:6),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Text(
                  'Total amount the client will see on your proposal',
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.normal,
                    fontSize:12,
                  ),
                ),
              ),
              SizedBox(height:16),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Row(
                  children: [
                    Container(
                      width:163,
                      height:44,
                      padding:EdgeInsets.only(left:10,right:10),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(4),
                          border:Border.all(
                              color:Colors.black,
                              width: 1
                          )
                      ),
                      child:Row(
                        children:[
                          Text(
                            '\$',
                            style:TextStyle(
                              color:Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:30,
                            ),
                          ),
                          Container(
                            padding:EdgeInsets.only(bottom:0,top:0),
                            width:122,
                            height:60,
                            decoration:BoxDecoration(
                              border:Border.all(
                                  color:HexColor(themeColorSecondary),
                                  width:2
                              ),
                              // borderRadius:Radius.circular(10),
                            ),
                            child:TextField(
                              textAlign:TextAlign.right,
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                hintText:'90.0',
                                contentPadding:EdgeInsets.only(bottom:4,top:0),
                                border: InputBorder.none,
                              ),
                              style:TextStyle(
                                color:Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:30,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' / hour',
                      style:TextStyle(
                        color:Colors.black,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize:26,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:16),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Text(
                  '10 % commission will deduct',
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    fontSize:16,
                  ),
                ),
              ),
              SizedBox(height:6),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Row(
                  children: [
                    Container(
                      width:163,
                      height:44,
                      padding:EdgeInsets.only(left:10,right:10),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(4),
                          border:Border.all(
                              color:Colors.black,
                              width: 1
                          )
                      ),
                      child:Row(
                        children:[
                          Text(
                            '\$',
                            style:TextStyle(
                              color:Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:30,
                            ),
                          ),
                          Container(
                            width:122,
                            height:60,
                            decoration: BoxDecoration(
                              border:Border.all(
                                  color:HexColor(themeColorSecondary),
                                  width:2
                              ),
                              // borderRadius:Radius.circular(10),
                            ),
                            child:TextField(
                              textAlign:TextAlign.right,
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                hintText:'90.0',
                                contentPadding:EdgeInsets.only(bottom:4,top:0),
                                border: InputBorder.none,
                              ),
                              style:TextStyle(
                                color:Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:30,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' / hour',
                      style:TextStyle(
                        color:Colors.black,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize:26,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color:Colors.black,
                height:1,
                margin:EdgeInsets.only(top:20),
                width:MediaQuery.of(context).size.width,
              ),
              SizedBox(height:16),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Text(
                  "You'll receive",
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight:FontWeight.bold,
                    fontSize:16,
                  ),
                ),
              ),
              SizedBox(height:16),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Text(
                  'The amount you will receive.',
                  style:TextStyle(
                    color:Colors.black,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.normal,
                    fontSize:12,
                  ),
                ),
              ),
              SizedBox(height:10),
              Container(
                padding:EdgeInsets.only(left:16,right:16),
                child:Row(
                  children: [
                    Container(
                      width:163,
                      height:44,
                      padding:EdgeInsets.only(left:10,right:10),
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(4),
                          border:Border.all(
                              color:Colors.black,
                              width: 1
                          )
                      ),
                      child:Row(
                        children:[
                          Text(
                            '\$',
                            style:TextStyle(
                              color:Colors.black,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.normal,
                              fontSize:30,
                            ),
                          ),
                          Container(
                            width:122,
                            height:60,
                            decoration: BoxDecoration(
                              border:Border.all(
                                  color:HexColor(themeColorSecondary),
                                  width:2
                              ),
                              // borderRadius:Radius.circular(10),
                            ),
                            child:TextField(
                              textAlign:TextAlign.right,
                              keyboardType:TextInputType.number,
                              decoration: InputDecoration(
                                hintText:'90.0',
                                contentPadding:EdgeInsets.only(bottom:4,top:0),
                                border: InputBorder.none,
                              ),
                              style:TextStyle(
                                color:Colors.black,
                                fontFamily: "Times New Roman",
                                fontWeight: FontWeight.normal,
                                fontSize:30,
                              ),
                              maxLines: 1,
                              autocorrect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' / hour',
                      style:TextStyle(
                        color:Colors.black,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize:26,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:30),
              Container(
                width:MediaQuery.of(context).size.width,
                margin:EdgeInsets.only(left: 16,right: 16),
                padding:EdgeInsets.only(left: 16,right: 16,top:10),
                decoration:BoxDecoration(
                    border:Border.all(
                        color:Colors.black,
                        width:1
                    ),
                    borderRadius:BorderRadius.circular(6)
                ),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cover Letter',
                      style:TextStyle(
                        color:Colors.black,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold,
                        fontSize:16,
                      ),
                    ),
                    Container(
                      height:230,
                      width:MediaQuery.of(context).size.width,
                      margin:EdgeInsets.only(left:0,right:0,top:16),
                      padding:EdgeInsets.only(left:10,right:0,top:0),
                      decoration:BoxDecoration(
                        border:Border.all(
                            color:Colors.black,
                            width:1
                        ),
                        borderRadius:BorderRadius.only(
                            topRight:Radius.circular(6),
                            topLeft:Radius.circular(6)
                        ),
                      ),
                      child:TextField(
                        maxLines: null,
                        textAlign:TextAlign.left,
                        keyboardType:TextInputType.name,
                        decoration: InputDecoration(
                          hintText:'',
                          // contentPadding:EdgeInsets.only(bottom:4,top:0),
                          border: InputBorder.none,
                        ),
                        style:TextStyle(
                          color:Colors.black,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.normal,
                          fontSize:16,
                        ),
                      ),
                    ),
                  ],
                ),
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
                        'Continue',
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

                      },
                    )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
