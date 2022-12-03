import 'package:budget_monthlay_app_clone/jason/activity_jason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../theme/colors.dart';
import 'balance_page.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getbody(),
    );
  }

  Widget getbody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [appBarCurve(), appBarBalance()],
            ),
          ),
          SizedBox(height: 35,),
          getActivity(),
          SizedBox(height: 35,),
          getverification(),
          SizedBox(
            height: 35,
          ),
         getNewsPromo(),
        ],
      ),
    );
  }

  Widget appBarCurve() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: size.height * 0.25,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primary,
              secondary,
            ]),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BalancePage()));
                  },
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                          Text(
                            "1752",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Available Balance",
                        style: TextStyle(color: Colors.white.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.statusfacebook.com/profile_pictures/cute_cats/cute_cats_profile_pictures_13.jpg'))),
                    ),
                    Positioned(
                        top: 35,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: primary)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarBalance() {
    var size = MediaQuery.of(context).size;

    return Positioned(
        bottom: 5,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: size.width,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 10,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Flexible(
                       child: Row(
                         children: [
                           Container(
                               height: 10,
                               width: 10,
                               decoration: BoxDecoration(
                                 color: Colors.red,
                                 shape: BoxShape.circle,
                               )),
                           SizedBox(
                             width: 15,
                           ),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Spent',
                                 style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.black.withOpacity(0.5)),
                               ),
                               SizedBox(
                                 height: 3,
                               ),
                               Text(
                                 '\$1460',
                                 style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.w500,
                                     ),
                               ),
                             ],
                           )
                         ],
                       ),
                     ) ,Flexible(
                       child: Row(
                         children: [
                           Container(
                               height: 10,
                               width: 10,
                               decoration: BoxDecoration(
                                 color: primary,
                                 shape: BoxShape.circle,
                               )),
                           SizedBox(
                             width: 15,
                           ),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Earned',
                                 style: TextStyle(
                                     fontSize: 14,
                                     color: Colors.black.withOpacity(0.5)),
                               ),
                               SizedBox(
                                 height: 3,
                               ),
                               Text(
                                 '\$3,850',
                                 style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.w500,
                               ),),
                             ],
                           )
                         ],
                       ),
                     )
                   ],
                 ),
                 SizedBox(height: 15,), Divider(),
                  SizedBox(height: 5,),
Text('You Spent \$1230 on during out this month . let\'s try to make it lower',style: TextStyle(fontSize: 14,height: 1.6), ),
                  SizedBox(height: 15,),
                  Text('Tell me more',style: TextStyle(fontSize: 15,color: primary,fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),
        ));
  }

  Widget getActivity(){
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Activity',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
        SizedBox(height: 15,),
        Wrap(
          spacing: 25,
          children:
            List.generate(items.length, (index) {
              return Container(
                width: (size.width/3)-30,
                height:(size.width/3)-25,
                decoration:BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.015),
                      spreadRadius: 10,
                      blurRadius: 10
                    ),

                  ]

                ) ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            primary,secondary
                          ]
                        )
                      ),
                      child: Center(
                        child: Icon(items[index]['icon'],color: Colors.white,size: 20,),
                      ),

                    ),
                    SizedBox(height: 12,),
                    Text(items[index]['title'],style: TextStyle(fontSize: 13,color: Colors.black.withOpacity(0.5)),)
                  ],
                ),
              );
            }

        )

        )],
    ),
  );
  }

  Widget getverification(){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Complete Verification',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
          SizedBox(height: 15,),
          Container(
            width:double.infinity ,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 10,
                  blurRadius: 10,
                )
              ]

            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('60% ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                      ,Text('3 of 10 completed',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black.withOpacity(0.5)),)


                    ],
                  ),
                  SizedBox(height: 15,),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.04),
                        ),
                      ),     Container(
                        width: size.width* 0.5,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.person,size: 30,color: primary,),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('personal Imformation',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black),),
                          SizedBox(height: 8,),
                          Text('When you register for an account .',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5),
                          ),),
                          SizedBox(height: 8,),
                          Text('We collect personal imformation',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5),),),
                          SizedBox(height: 12,),
                          Text('Continue',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: primary),),

                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),
                  Row(


                    children: [
                      Icon(Icons.perm_contact_cal_outlined,color: primary,size: 30,),
                      SizedBox(width: 20,),
                      Text('Verification',style: TextStyle(fontSize: 15,color: Colors.black),)
                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),
                  Row(


                    children: [
                      Icon(Icons.email,color: primary,size: 30),
                      SizedBox(width: 20,),
                      Text('Confirm Email',style: TextStyle(fontSize: 15,color: Colors.black),)
                    ],
                  )


                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget getNewsPromo(){
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('News and Promo',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
          SizedBox(height: 15,),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.015),
                  spreadRadius: 10,
                  blurRadius: 10,

                ),
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(image:DecorationImage(
                    image: AssetImage('assets/image/img_1.png'),fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ))
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Share and Invite Your friends',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                      SizedBox(height: 5,),
                      Text('Invite friends to register on our app . for every user you invite ,you will earn up to \$10.,',style: TextStyle(fontSize: 14,height: 1.6),),
                      SizedBox(height: 12,),
                      Text('Invite Now' ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: primary),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
