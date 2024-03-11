


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:image_download/video_list_page/view/video_list_page.dart';
import 'package:image_download/video_list_page1/view/video_list_page1.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

// 【F】【R】【I】【E】【N】【D】【S】

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return  GetMaterialApp(


      debugShowCheckedModeBanner: false,

      home: VideoListScreenPage1(),


    );
  }

}











// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_download/utils/assets.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as htmlParser;
// import 'package:youtube_explode_dart/youtube_explode_dart.dart';
//
// import 'YoutubeVieoListModel.dart';
//
// class SaveImageFromUrl extends StatelessWidget {
//   final String imageUrl =
//       'https://drive.google.com/uc?export=view&id=1VxXLQglhtZHR7_xIUToZIXhA10yxRzWf'; // Replace with your image URL
//
//   Future<void> saveImageToDeviceGallery() async {
//     try {
//       var response = await http.get(Uri.parse(imageUrl));
//       if (response.statusCode == 200) {
//         // Convert the image bytes to Uint8List
//         Uint8List bytes = response.bodyBytes;
//
//         // Save image to gallery
//         final result = await ImageGallerySaver.saveImage(bytes);
//
//
//
//
//
//         if (result['isSuccess']) {
//
//           print('Image saved successfully');
//           print('------$result---------');
//         } else {
//           print('Failed to save image: ${result['errorMessage']}');
//         }
//       }
//       else {
//         print('Failed to download image');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//
//
//
//
//
//    getPlaylistVideos1( ) async {
//     final String imageUrl =
//         'https://drive.google.com/uc?export=view&id=1VxXLQglhtZHR7_xIUToZIXhA10yxRzWf'; // Replace with your image URL
//     https://www.youtube.com/watch?v=rQYZ3JmZsdI&list=PLgH5QX0i9K3p4ckbNCy71LRr_dG0AWGw9
//     var yt = YoutubeExplode();
//
// // Get playlist metadata.
//     var playlist = await yt.playlists.get('PLgH5QX0i9K3p4ckbNCy71LRr_dG0AWGw9');
//
//     var title = playlist.title;
//     var author = playlist.author;
//
//     await for (var video in yt.playlists.getVideos(playlist.id)) {
//       var videoTitle = video.title;
//       var videoAuthor = video.author;
//     }
//
//     var playlistVideos = await yt.playlists.getVideos(playlist.id);
//
// // Get first 20 playlist videos.
//     var somePlaylistVideos = await yt.playlists.getVideos(playlist.id).take(20).toList();
//
//
//
//     print("ok");
//     // print(playlistVideos);
//
//      List<YouTubeVideoListModel> vdList=[];
//
//      for (var video in somePlaylistVideos) {
//
//        YouTubeVideoListModel youTubeVideoListModel = YouTubeVideoListModel(
//            title: video.title,
//            author: video.author,
//            duration: video.duration.toString(),
//            videoUrl: 'https://www.youtube.com/watch?v=${video.id}'
//        );
//        vdList.add(youTubeVideoListModel);
//
//        print('First 20 Video Title: ${video.title}');
//        print('First 20 Video Author: ${video.author}');
//        print('First 20 Video Duration: ${video.duration}');
//        print('First 20 Video URL: https://www.youtube.com/watch?v=${video.id}');
//        print('------');
//      }
//
//
//
//      youTubeList=vdList;
//   }
//
//   List <YouTubeVideoListModel>  youTubeList=[];
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Save Image Example'),
//       ),
//       body: Column(
//         children: [
//           // SizedBox(height: 50,),
//           // Container(
//           //
//           //   height: 150, width: 150,
//           //
//           //   child:FadeInImage.assetNetwork(
//           //     fit: BoxFit.fill,
//           //     placeholder: Assets.profileAvater,
//           //     image:"https://drive.google.com/uc?export=view&id=1VxXLQglhtZHR7_xIUToZIXhA10yxRzWf",
//           //     // image:"https://drive.google.com/uc?export=view&id=1eR3DSNCPmROsKuoHq8ryPGCZTveIar1u",
//           //     // image:"https://drive.google.com/uc?export=view&id=1qvMo2-XoTWA-VQpicRBMSi9mMJfEsbDc",
//           //     // image:"https://drive.google.com/file/d/1qvMo2-XoTWA-VQpicRBMSi9mMJfEsbDc",
//           //
//           //     /// https://drive.google.com/uc?export=view&id=YOUR_FILE_ID. this formet will be
//           //     imageErrorBuilder: (context, url, error) =>
//           //         Image.asset(
//           //           Assets.profileAvater,
//           //           fit: BoxFit.fill,
//           //         ),
//           //   ),
//           // ),
//
//
//           SizedBox(height: 30,),
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 // saveImageToDeviceGallery();
//
//                 getPlaylistVideos1();
//
//               },
//               child: Text('Save Image'),
//             ),
//           ),
//
//           Expanded(child: ListView.builder(
//             itemCount: youTubeList.length, // The number of items in the list
//             itemBuilder: (BuildContext context, int index) {
//               // The builder function is called for each item in the list
//               return ListTile(
//                 title: Text('Item $index'),
//               );
//             },
//           ))
//
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: SaveImageFromUrl(),
//   ));
// }
//
//
//
//
