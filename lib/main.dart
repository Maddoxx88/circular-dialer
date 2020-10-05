import 'package:circular_dialer/dialer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: MyApp()
  )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String phoneNum = '+91';
  String previewNum = '0';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
            children: [
              SizedBox(height: height/12,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('$phoneNum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 36.0,
                      letterSpacing: 2,
                      fontFamily: 'Montserrat',
                    )),
              ),
              SizedBox(height: height/12,),
              SingleCircularSlider(
                10,
                1,
                height: height/2.5,
                width: width/2.5,
                handlerColor: Colors.grey,
                handlerOutterRadius: 12.0,
                primarySectors: 10,
                sliderStrokeWidth: 8.0,
                selectionColor: Colors.grey,
                showHandlerOutter: true,
                onSelectionChange: (init, end, laps) {
                  setState(() {
                    previewNum = end.toString();
                  });
                },
                onSelectionEnd: (init, end, laps) {
                  setState(() {
                    if(end == 10) {
                      phoneNum += '0';
                    } else {
                      phoneNum += end.toString();
                    }
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text('$previewNum',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 96.0,
                            fontFamily: 'Montserrat',
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height/12,),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 40.0,
                    icon: Icon(Icons.autorenew, color: Colors.grey,),
                    onPressed: () {
                      setState((){
                        phoneNum = '+91';
                      });
                    },),
                  RawMaterialButton(
                    elevation: 2.0,
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),
                    fillColor: Colors.green,
                    child: Icon(Icons.phone, color: Colors.white,size: 50.0,),
                    onPressed: () {
                      setState((){
                        if(phoneNum.length > 12) {
                          dynamic res = FlutterPhoneDirectCaller.callNumber(phoneNum);
                        }
                      });
                    },),
                  IconButton(
                    iconSize: 40.0,
                    icon: Icon(Icons.backspace, color: Colors.grey,),
                    onPressed: () {
                      setState((){
                        if (phoneNum != null && phoneNum.length > 3) {
                          phoneNum = phoneNum.substring(0, phoneNum.length - 1);
                        }
                      });
                    },),
                ],
              )
            ],
          );
  }
}

