import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/video_list_page_controller.dart';




class VideoListScreenPage extends StatelessWidget {
   final pageController = Get.put(VideoListPageController());
   late BuildContext mContext;
   final GlobalKey<ScaffoldState>  drawerKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    mContext=context;
    final size = MediaQuery.of(context).size;
    return
      PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {

        },


        child: Scaffold(

          body:SafeArea(


            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [


                ///body design
                Expanded(child: Container(

                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15 ),topRight: Radius.circular(15 )),
                  ),

                  child:Column(
                    children: [bodyDesign()],
                  )
                )),
              ],
            ),
          ),
        ),
      );


  }









  ///-----------page body design
  Widget bodyDesign(){

    return
      Expanded(child: Obx(() => ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: pageController.videoList.length, // Number of items in your list
        itemBuilder: (BuildContext context, int index) {
          // Function called for each item in the list
          return Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
            margin: EdgeInsets.only(top: 10,bottom: 10),



            decoration: BoxDecoration(
              color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.black87
            ),
              borderRadius: BorderRadius.circular(10)
              
            ),
            child:Row(
              children: [
                Expanded(child: Column(
                  children: [
                    Row(
                        children: [
                          Expanded(child:Text("Title: ${pageController.videoList[index].title}"),)
                        ]
                    ),
                    SizedBox(height: 10,),

                    Row(
                        children: [
                          Expanded(child:Text("Author: ${pageController.videoList[index].author}"),)
                        ]
                    ),
                    SizedBox(height: 10,),

                    Row(
                        children: [
                          Expanded(child:Text("Duration: ${pageController.videoList[index].duration}"),)
                        ]
                    ),
                    SizedBox(height: 10,),
                    Row(
                        children: [
                          Expanded(child:Text("Video Url: ${pageController.videoList[index].videoUrl}"),)
                        ]
                    ),
                  ],
                ))
              ],
            ),
          );
        },
      )),);



  }

}

