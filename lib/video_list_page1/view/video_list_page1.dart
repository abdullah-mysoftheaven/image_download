import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/video_list_page_controller1.dart';




class VideoListScreenPage1 extends StatelessWidget {
   final pageController = Get.put(VideoListPageController1());
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
                    children: [Expanded(child: bodyDesign())],
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
      Column(

        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 10,),
              Expanded(child: InkWell(
                onTap: (){
                  pageController.saveServerImageToDeviceGallery("https://img.youtube.com/vi/8GZ__M388Z0/sddefault.jpg");
                },
                child: Container(
                color: Colors.green,
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Text("Download",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
                            ),
              )),
              SizedBox(width: 20,),
              Expanded(child: InkWell(
                onTap: (){

                  for(int i=0; i<pageController.videoList.length;i++){



                    // pageController.saveServerImageToDeviceGallery("https://img.youtube.com/vi/8GZ__M388Z0/sddefault.jpg");
                    pageController.saveServerImageToDeviceGallery(pageController.videoList[i].thumbnelImageUrl);
                  }


                },
                child: Container(
                color: Colors.green,
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Text("Download All",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),),
                            ),
              )),
              SizedBox(width: 10,),
            ],
          ),
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

                    Container(
                      margin: EdgeInsets.only(left: 0,right: 10),
                      height: 100,
                      width: 70,
                      child:ClipRRect(

                        child: Image.network(pageController.videoList[index].thumbnelImageUrl,
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ) ,
                    ),

                    Expanded(child: Column(
                      children: [
                        Row(
                            children: [
                              // Expanded(child:Text("Title: ${pageController.videoList[index].title}"),)
                              Expanded(child:Text(" ${pageController.videoList[index].title}"),)
                            ]
                        ),
                        SizedBox(height: 10,),

                        // Row(
                        //     children: [
                        //       Expanded(child:Text("Author: ${pageController.videoList[index].author}"),)
                        //     ]
                        // ),
                        // SizedBox(height: 10,),

                        Row(
                            children: [
                              Expanded(child:Text("${pageController.videoList[index].duration}"),)
                              // Expanded(child:Text("Duration: ${pageController.videoList[index].duration}"),)
                            ]
                        ),
                        SizedBox(height: 10,),
                        // Row(
                        //     children: [
                        //       Expanded(child:Text("Video Url: ${pageController.videoList[index].videoUrl}"),)
                        //     ]
                        // ),
                      ],
                    ))
                  ],
                ),
              );
            },
          )),),
        ],
      );



  }

}

