import 'dart:convert';

import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:cbx_driver/Utils/helperutils.dart';
import 'package:cbx_driver/bloc/UserProfileBloc.dart';
import 'package:cbx_driver/components/rounded_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import '../main.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen>
    with TickerProviderStateMixin {
  _HelpScreenState();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _mobileNumController = TextEditingController();
  final _emailaddressController = TextEditingController();
  SharedPreferences prefs;
  String phoneNumber='+16156809548';
 String website ='https://roadrunnersclub.net';
 // String website ='https://roadrunnersclub.net kadajksdkajsdk asdahjsbdamnsbd kamsd ams,bdmn,adsdfv ajms,dbv sjmdbvashjmdvasmdbasmbv';
  String supportEmail='support@roadrunnersclub.net';
  @override
  void initState() {
    super.initState();

    initPreferences();

    _mobileNumController.addListener(_printLatestValue);
  }

  Future<void> initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    _firstNameController.text = prefs.getString(SharedPrefsKeys.FIRST_NAME);
    _lastNameController.text = prefs.getString(SharedPrefsKeys.LAST_NAME);
    _mobileNumController.text = prefs.getString(SharedPrefsKeys.MOBILE);
    _emailaddressController.text =
        prefs.getString(SharedPrefsKeys.EMAIL_ADDRESS);

    setState(() {});
  }

  _printLatestValue() {
    print("Second text field: ${_mobileNumController.text}");

    // });
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    _mobileNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.white,

      appBar: AppBar(brightness: Brightness.light, backgroundColor: AppTheme.white,elevation: 0,

        title: Text(
          'Help Center',
          style: TextStyle(
            fontSize: 22,
            color: AppTheme.darkText,
            fontWeight: FontWeight.w700,
          ),
        ),

      ),
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(padding: EdgeInsets.all(20),
                child:Text(
                  'Feel Free contact us 24x7 our team available for support.',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  ),

                Padding(padding: EdgeInsets.only(top:20,left: 20,right:20),
                  child:Text(
                    'Call Us',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:10,left: 20,right:20),
                  child:Text(
                    phoneNumber,
                    style: TextStyle(
                      decoration: TextDecoration.underline,

                      fontSize: 18,
                      color: AppTheme.colorPrimaryDark,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                 Padding(padding: EdgeInsets.only(top:20,left: 20,right:20),
                  child:Text(
                    'E-Mail Us',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:10,left: 20,right:20),
                  child:Text(
                    supportEmail,
                    style: TextStyle(
                      decoration: TextDecoration.underline,

                      fontSize: 18,
                      color: AppTheme.colorPrimaryDark,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:20,left: 20,right:20),
                  child:Text(
                    'Visit our website',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:10,left: 20,right:20),
                  child:Text(
                    website,
                    style: TextStyle(
                      decoration: TextDecoration.underline,

                      fontSize: 18,
                      color: AppTheme.colorPrimaryDark,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),


              ],
            ));
          }
        },
      ),
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
                  textStyle: TextStyle(
                      color: Colors.red, fontFamily: AppTheme.fontName),
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
          );
        });
  }
}
