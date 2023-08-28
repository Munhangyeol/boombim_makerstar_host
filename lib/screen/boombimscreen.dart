import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


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
        child: Container(
          child: Column(
            children: [
              Container(

                width: size.width,
                height: size.height * 0.35,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset('assets/images/americano.jpg',
                              width: size.width, height: size.height * 0.35,
                          fit: BoxFit.cover,),
                          Image.asset('assets/images/caffu.jpg',
                              width: size.width, height: size.height * 0.35),
                          Image.asset('assets/images/latte.jpg',
                              width: size.width, height: size.height * 0.35),
                        ],
                      ),
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
                          var picker = ImagePicker();
                          image = await picker.pickImage(source: ImageSource.gallery);
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
                height: size.height*0.08,

                width: size.width,
                child:Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('유캔두잇 세종대점',style: TextStyle( fontFamily: 'Inter_Bold',fontSize: 25,
                         color:Colors.black,fontWeight: FontWeight.w700),
                        ),
                  Text('서울 광진구 능동로 209 세종대학교 광개토관 15층',style: TextStyle(fontSize: 12,
                    fontFamily: 'InterSemiBold',color:Color(0xff5E5E5E),fontWeight: FontWeight.w500)
                  ),



                      ],
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_rounded)),
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
                height: size.height*0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:size.width,
                      height: size.height*0.03,

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
                height: size.height*0.15,

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
                        Text("     $timeCurrentDay",style: TextStyle(fontWeight:
                        FontWeight.w600,fontSize: 16,color: Color(0xff949494)),

                        ),

                        IconButton(onPressed: (){}, icon: Icon(Icons.expand_more)),

                        IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_rounded))
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
                height:size.height*0.13,
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
                children:[ Text("     $phoneNumber",style: TextStyle(fontWeight:
                FontWeight.w600,fontSize: 16,color: Color(0xff949494)),
                ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_rounded))
                  ]
                ),
                ]
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}