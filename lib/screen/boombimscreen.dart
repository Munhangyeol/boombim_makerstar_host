import 'package:flutter/material.dart';

class BoombimScreen extends StatefulWidget {
  const BoombimScreen({Key? key}) : super(key: key);

  @override
  _BoombimScreenState createState() => _BoombimScreenState();
}

class _BoombimScreenState extends State<BoombimScreen> {
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
                      top: 0,
                      bottom: size.height*0.28,
                      child: FloatingActionButton.small(
                        backgroundColor: Color(0xffC7C7C7),
                        onPressed: () {},
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Positioned(
                      right: size.width * 0.02,
                      top: 0,
                      bottom: size.height*0.28,
                      child: FloatingActionButton.small(
                        backgroundColor: Color(0xffC7C7C7),
                        onPressed: () {},
                        child: Icon(Icons.home),
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

                        Text('유캔두잇 세종대점',style: TextStyle( fontFamily: 'InterBold',fontSize: 26,
                         color:Colors.black,fontWeight: FontWeight.w700),
                        ),
                  Text('서울 광진구 능동로 209 세종대학교 광개토관 15층',style: TextStyle(fontSize: 13,
                    fontFamily: 'InterSemiBold',color:Color(0xff5E5E5E),fontWeight: FontWeight.w500)
                  ),



                      ],
                    ),

                    IconButton(
                        onPressed: (){}, icon: Icon(


                        Icons.star,
                            size:35.0,
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

            ],
          ),
        ),
      ),
    );
  }
}