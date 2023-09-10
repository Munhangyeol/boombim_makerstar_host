import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() =>_TestScreenState();
}


class _TestScreenState extends State<TestScreen> {
  getPermission()async{
    var status=await Permission.storage.request();
    if(status.isGranted){
      print('허락됨');
    }

    else if(status.isDenied){
      print('거부됨');
      Permission.photos.request();

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {

            },
            child: Text('Open Gallery'),
          ),
        ),
      ),
    );
  }

}