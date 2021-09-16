import 'package:cbx_driver/HomePage/setNewPassword.dart';
import 'package:cbx_driver/app_theme.dart';
import 'package:cbx_driver/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class OTPScreen extends StatefulWidget {

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar:   AppBar(
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: AppTheme.white, //change your color here
      ),

      title: Column(
        children: [
          Text(
            'OTP',
            style: TextStyle(
              fontSize: 20,
              color: AppTheme.white,
              fontWeight: FontWeight.w400,
            ),
          ),

        ],
      ),
      elevation: 0,
      backgroundColor: AppTheme.colorPrimary,
    ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: true,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: 20, ),
                  child: Text("Verification",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20,
                          color: AppTheme.darkerText,
                          fontWeight: FontWeight.w800,
                          fontFamily: "WorkSans")),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(top: 30, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("OTP",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppTheme.darkerText,
                            fontWeight: FontWeight.w600,
                            fontFamily: "WorkSans")),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.8,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: new TextField(
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 6,
                        controller: otpController,
                        decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: 'OTP',
                          counterText: ''
                        ),
                      ),
                    ),

                  ],
                ),
              ),



              SizedBox(
                height: 15,
              ),




            ],
          )),
      bottomNavigationBar: Visibility(
          visible: true,
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.12,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedButton(
                    color: AppTheme.colorPrimary,
                    text: "Verify",
                    press: () async {
                      //   _showMyDialog(context,'Wrong Otp','OTP');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SetNewPassword();
                          },
                        ),
                      );
                    }


                ),
              ],
            ),
          )),

    );
  }
  void _showMyDialog(
      BuildContext context,
      String msg,
      String header,
      ) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {


          return CupertinoAlertDialog(
            title: Text(header),
            content: Padding(
              padding: EdgeInsets.all(10),
              child: Text(msg),
            ),
            actions: <Widget>[
              /*CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Cancel")
          ),*/
              CupertinoDialogAction(
                  textStyle:
                  TextStyle(color: Colors.red, fontFamily: AppTheme.fontName),
                  isDefaultAction: true,
                  onPressed: () async {
                    Navigator.pop(context);


                  },
                  child: Text(
                    "Okay",
                    style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        color: AppTheme.colorPrimaryDark),
                  )),
            ],
          );});
  }
}
