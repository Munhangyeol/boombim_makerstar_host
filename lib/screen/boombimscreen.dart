import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BoombimScreen extends StatefulWidget {
  const BoombimScreen({Key? key}) : super(key: key);

  @override
  _BoombimScreenState createState() => _BoombimScreenState();
}

class _BoombimScreenState extends State<BoombimScreen> {
  double percentValue=0.5;
  String phoneNumber="02-1234-5678";
  String timeCurrentDay="10:00 ~ 18:00";
  int totalTableNumber=30;
  int occupyTableNumber=10;
  var image;
  bool isAccessImaged=false;
  bool isEditing=false;
  bool isCaffeTimeEditing=false;
  bool isCaffePhoneEditing=false;
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  String caffeName="유캔두잇 세종대점";
  String caffeAddress="서울 광진구 능동로 209 세종대학교 광개토관 15층";
  TextEditingController phoneController=TextEditingController();
  final firestore=FirebaseFirestore.instance;
  String url1='aa';
  String url2='aa';
  String url3='aa';


  getPermission() async{
    var status=await Permission.storage.request();
    if(status.isGranted){
      print('허락됨');
      setState(() {
        isAccessImaged=true;
      });
    }

    else if(status.isDenied){
      print('거부됨');
      Permission.photos.request();

    }
  }
  getData() async {
    var a1 = await FirebaseFirestore.instance.collection('ucandoit').doc('photo').get().
    then((DocumentSnapshot ds){
      final data =ds.data() as Map<String,dynamic>;
      setState(() {
        try {
          url1 = data["url1"];
        }
        catch(e){
          print(e);
        }
      });

    });
    var a2 = await FirebaseFirestore.instance.collection('ucandoit').doc('photo').get().
    then((DocumentSnapshot ds){
      final data =ds.data() as Map<String,dynamic>;
      setState(() {
        try {
          url2 = data["url2"];
        }
        catch(e){
          print(e);
        }
      });
    });
    var a3 = await FirebaseFirestore.instance.collection('ucandoit').doc('photo').get().
    then((DocumentSnapshot ds){
      final data =ds.data() as Map<String,dynamic>;
      setState(() {
        try {
          url3 = data["url3"];
        }
        catch(e){
          print(e);
        }
      });
    });
    var caffe_info = await FirebaseFirestore.instance.collection('ucandoit')
        .doc('caffe_information').get()
        .
    then((DocumentSnapshot ds) {
      final data = ds.data() as Map<String, dynamic>;
      setState(() {
        phoneNumber = data["caffe_phoneNumber"];
        timeCurrentDay = data["caffe_time"];
        caffeName = data["caffe_name"];
        caffeAddress = data["caffe_address"];
        print("$caffeName");
      });
    });
  }
    void initState() {
      super.initState();

      getPermission();
      getData();
    }






  void increaseProgress(){
    setState(() {     //setState를 이용해서 상태변경을 알리고 UI를 다시 그려줌.
      percentValue+=0.1;  //별표시를 클릭시에 혼잡도가 증가함.
      if(percentValue>=1){
        percentValue=0.1;
      }
    });
  }
  // Future<void> _pickImage() async {
  //   final status = await Permission.photos.request(); // 갤러리 권한 요청
  //
  //   if (status.isGranted) {
  //     // 권한이 허용되었을 때
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       // 사진을 선택한 경우
  //       setState(() {
  //         // 선택한 사진을 어딘가에 저장하거나 표시
  //       });
  //     }
  //   } else if (status.isDenied) {
  //     // 권한이 거부된 경우
  //     // 사용자에게 권한이 필요하다는 메시지를 표시
  //   } else if (status.isPermanentlyDenied) {
  //     // 권한이 영구적으로 거부된 경우
  //     // 설정 앱으로 사용자를 리디렉션하여 권한을 활성화하도록 안내
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView
          (
          scrollDirection: Axis.vertical,
          child:Container(
          child: Column(
            children: [
              Container(

                width: size.width,
                height: size.height * 0.33,
                child: Stack(
                  children: [
                    PageView(
                      scrollDirection: Axis.horizontal,

                      children: [
                        SizedBox(
                          width:size.width,
                          height: size.height*0.35,
                          child:Image.network("$url2",errorBuilder: (BuildContext context,Object exception, StackTrace? stackTrace) {
                            return Center(

                              child: SizedBox(
                                height: size.height * 0.4,
                                width: size.width * 0.3,
                                child: Lottie.asset(
                                    'assets/lottie/animation_2.json'),

                              ),

                            );
                          },
                          ),
                        ),
                        SizedBox(
                            width:size.width,
                            height: size.height*0.35,
                            child:Image.network("$url1",errorBuilder: (BuildContext context,Object exception, StackTrace? stackTrace) {
                              return Center(

                                child: SizedBox(
                                  height: size.height * 0.4,
                                  width: size.width * 0.3,
                                  child: Lottie.asset(
                                      'assets/lottie/animation_2.json'),

                                ),

                              );
                            },)
                        ),
                        SizedBox(
                            width:size.width,
                            height: size.height*0.35,
                            child:Image.network("$url3",errorBuilder: (BuildContext context,Object exception, StackTrace? stackTrace) {
                              return Center(

                                child: SizedBox(
                                  height: size.height * 0.4,
                                  width: size.width * 0.3,
                                  child: Lottie.asset(
                                      'assets/lottie/animation_2.json'),

                                ),

                              );
                            },)
                        ),
                      ],

                    ),
                    Positioned(
                      left: size.width * 0.02,
                      top: size.width*0.02,
                      bottom: size.height*0.29,
                      child: FloatingActionButton.small(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xffC7C7C7),
                        onPressed: () async {

                          print(isAccessImaged);
                          var picker = ImagePicker();
                          if(isAccessImaged==true) {
                            image =
                            await picker.pickImage(source: ImageSource.gallery);
                            print(image);
                            FirebaseStorage storage=FirebaseStorage.instance;
                            Reference ref=storage.ref().child("test/${DateTime.now().toString()}");
                            try {
                              await ref.putFile(File(image.path));
                              print("upload success");
                              String downloadURL = await ref.getDownloadURL();

                              setState(() {
                                FirebaseFirestore.instance.collection('ucandoit').doc('photo').update({
                                  'url3': downloadURL,  // Field name here will be whatever you want.
                                  // Add any more fields you need here as per your document structure.
                                });
                              });


                              print('Uploaded successfully');
                            }
                            catch(e){
                              print("upload fail");
                              print(e);
                            }

                          }

                          else{
                            Fluttertoast.showToast(
                                msg: "사진의 권한을 허용해주세요.");
                            toastLength:Toast.LENGTH_LONG;

                          }
                          },
                        child: Icon(Icons.add),
                      ),
                    ),
                    Positioned(
                      right: size.width * 0.02,
                      top: size.width*0.02,
                      bottom: size.height*0.29,
                      child: FloatingActionButton.small(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xffC7C7C7),
                        onPressed: () {},
                        child: Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,

                width: size.width,
                child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 35,
                          width:size.width*0.5,
                          child:
                        isEditing?
                            TextField(
                              maxLength: 10,
                              controller: nameController,
                              onSubmitted: (value){
                                setState(() {
                                  print(value);
                                  caffeName=nameController.text;
                                  isEditing=false;
                                  firestore.collection("ucandoit").doc("caffe_information")
                                  .update({'caffe_name':"$caffeName"});



                                });
                              },
                            ): Text("$caffeName",style: TextStyle( fontFamily: 'IBM_Bold',fontSize: 26,
                         color:Colors.black,fontWeight: FontWeight.w700),
                        ),
          ),
                        SizedBox(
                          height: 3,

                        ),
                        Container(
                          height: 30,
                          width:260,
                          child:
                          isEditing?
                          TextField(

                            style: TextStyle(fontSize: 11),
                            maxLength: 30,
                            controller: addressController,
                            onSubmitted: (value){
                              setState(() {
                                caffeAddress=addressController.text;
                                isEditing=false;
                                firestore.collection("ucandoit").doc("caffe_information")
                                    .update({'caffe_address':"$caffeAddress"});




                              });
                            },
                          ): Text("$caffeAddress",style: TextStyle( fontFamily: 'IBM_Bold',fontSize: 11,
                              color:Color(0xff5E5E5E),fontWeight: FontWeight.w500),
                          ),
                        ),




                      ],
                    ),

                    IconButton(onPressed: (){
                      setState(() {
                        isEditing=true;
                        print(isEditing);
                      });
                    }, icon: Icon(Icons.edit_note_rounded)),
                    IconButton(
                        onPressed: increaseProgress, icon: Icon(


                        Icons.star,
                            size:20.0,
                      color:Color(0xffFFCD4A)
                    )
                    ),
                  ]
                ),



              ),
              Container(
                  width: size.width,
                  height: 0.5,
                  color:Color(0xff767676)
              ),
              Container(
                width: size.width,
                height: 5,
              ),
              Container(

                width: size.width,
                height: size.height*0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}
                        , icon: Icon(Icons.home,size: 25,),),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.coffee,size: 25),color:Color(0xffC7C7C7)),
                    IconButton(onPressed: (){},
                    icon:Icon(Icons.rate_review,size: 25),color:Color(0xffC7C7C7))
                  ],
                ),
              ),
              Container(
                  width: size.width,
                  height: 5,
                  color:Color(0xffF2F2F2)
              ),

              Container(

                width: size.width,
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:size.width,
                      height: size.height*0.04,

                    ),
                    Text("    혼잡도",style: TextStyle(fontSize: 19,fontFamily: "InterSemiBold",
                        color: Colors.black,
                        fontWeight:FontWeight.w600)),
                    Container(
                      width: size.width,
                      height: size.height*0.02,
                    ),
                    LinearPercentIndicator(

                      alignment: MainAxisAlignment.center,
                      percent: percentValue,
                      lineHeight: 5,
                      backgroundColor: Color(0xFFD9D9D9),
                      progressColor: Color(0xFFFFCD4A),
                      width: size.width*0.95,
                      ),
                    Container(
                      width: size.width,
                      height: size.height*0.01,
                    ),
                    Text("     테이블 $totalTableNumber개 중 $occupyTableNumber개 사용중",style: TextStyle(fontWeight:
                    FontWeight.w500,fontSize: 14,color: Color(0xff949494)),

                    ),


                  ],
                ),

              ),
              Container(
                width:size.width,
                height: 120,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                  width:size.width,
                  height: size.height*0.04,

                ),
                  Text("    영업시간",style: TextStyle(fontSize: 19,fontFamily: "InterSemiBold",
                        color: Colors.black,
                        fontWeight:FontWeight.w600)),

                    Container(
                      width: size.width,
                      height: size.height*0.005,
                    ),
                    Row(

                      children:[
                        Container(
                            height: 25,
                            width: 150,

                            child: isCaffeTimeEditing?
                            TextField(
                              controller: timeController,
                              onSubmitted: (value){
                                setState(() {
                                  print(value);
                                  timeCurrentDay= timeController.text;
                                  isCaffeTimeEditing=false;
                                  firestore.collection("ucandoit").doc("caffe_information")
                                      .update({'caffe_time':"$timeCurrentDay"});


                                });
                              },




                            ):
                        Text("     $timeCurrentDay",style: TextStyle(fontWeight:
                        FontWeight.w600,fontSize: 16,color: Color(0xff949494)),

                        ),
                        ),

                        IconButton(onPressed: (){

                        }, icon: Icon(Icons.expand_more)),

                        IconButton(onPressed: (){ setState(() {
                          isCaffeTimeEditing=true;
                        });}, icon: Icon(Icons.edit_note_rounded))
                      ]



                    )
]
                ),
              ),
              Container(
                width: size.width,
                height: size.height*0.02,
              ),
              Container(
                width:size.width,
                height:120,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
              Text("    전화번호",style: TextStyle(fontSize: 19,fontFamily: "InterSemiBold",
                  color: Colors.black,
                  fontWeight:FontWeight.w600)),
              Container(
                width: size.width,
                height: size.height*0.02,
              ),
                Row(
                children:[
                  Container(
                      height: 25,
                      width: 150,

                      child: isCaffePhoneEditing?
                      TextField(
                        controller: phoneController,
                        onSubmitted: (value){
                          setState(() {
                            print(value);
                            phoneNumber=phoneController.text;
                            isCaffePhoneEditing=false;
                            firestore.collection("ucandoit").doc("caffe_information")
                                .update({'caffe_phoneNumber':"$phoneNumber"});



                          });
                        },




                      ):Text("     $phoneNumber",style: TextStyle(fontWeight:
                FontWeight.w600,fontSize: 16,color: Color(0xff949494)),
                ),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      isCaffePhoneEditing=true;
                    });}, icon: Icon(Icons.edit_note_rounded))
                  ]
                ),
                ]
              ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}