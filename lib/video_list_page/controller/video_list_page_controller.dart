

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:http/http.dart' as http;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../YoutubeVieoListModel.dart';




class  VideoListPageController extends GetxController {

 var videoList=<YouTubeVideoListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPlaylistVideos1();




  }
 getPlaylistVideos1( ) async {
   final String imageUrl =
       'https://drive.google.com/uc?export=view&id=1VxXLQglhtZHR7_xIUToZIXhA10yxRzWf'; // Replace with your image URL
   https://www.youtube.com/watch?v=rQYZ3JmZsdI&list=PLgH5QX0i9K3p4ckbNCy71LRr_dG0AWGw9
   var yt = YoutubeExplode();

// Get playlist metadata.
   var playlist = await yt.playlists.get('PLjxrf2q8roU1MH1pe5nxdqt8i6zXASE7H');
   // var playlist = await yt.playlists.get('PLgH5QX0i9K3p4ckbNCy71LRr_dG0AWGw9');

   var title = playlist.title;
   var author = playlist.author;

   await for (var video in yt.playlists.getVideos(playlist.id)) {
     var videoTitle = video.title;
     var videoAuthor = video.author;
   }

   var playlistVideos = await yt.playlists.getVideos(playlist.id);

// Get first 20 playlist videos.
   var somePlaylistVideos = await yt.playlists.getVideos(playlist.id).take(20).toList();



   print("ok");
   // print(playlistVideos);

   List<YouTubeVideoListModel> vdList=[];

   for (var video in somePlaylistVideos) {

     YouTubeVideoListModel youTubeVideoListModel = YouTubeVideoListModel(
         title: video.title,
         author: video.author,
         duration: video.duration.toString(),
         videoUrl: 'https://www.youtube.com/watch?v=${video.id}',
         thumbnelImageUrl: "https://img.youtube.com/vi/${video.id}/hqdefault.jpg"
     );
     vdList.add(youTubeVideoListModel);

     print('First 20 Video Title: ${video.title}');
     print('First 20 Video Author: ${video.author}');
     print('First 20 Video Duration: ${video.duration}');
     print('First 20 Video URL: https://www.youtube.com/watch?v=${video.id}');
     print('------');
   }



   videoList(vdList);
 }



 Future<void> saveAssetImageToDeviceGallery() async {
   // Specify the path to your asset image
   String assetImagePath = 'assets/images/profile_avater.jpg';

   try {
     // Load the asset image as bytes
     ByteData data = await rootBundle.load(assetImagePath);
     Uint8List bytes = data.buffer.asUint8List();

     // Save the image to the device gallery using ImageGallerySaver
     final result = await ImageGallerySaver.saveImage(bytes);

     // Check if the image was saved successfully
     if (result['isSuccess']) {
       print('Image saved successfully');
       print('------$result---------');
     } else {
       print('Failed to save image: ${result['errorMessage']}');
     }
   } catch (e) {
     // Print any errors that may occur during the process
     print('Error: $e');
   }
 }

 Future<void> saveServerImageToDeviceGallery(String imageUrl) async {
   try {
     // Fetch the image from the server
     http.Response response = await http.get(Uri.parse(imageUrl));

     // Check if the request was successful (status code 200)
     if (response.statusCode == 200) {
       // Convert the response body to Uint8List
       Uint8List bytes = response.bodyBytes;

       // Save the image to the device gallery using ImageGallerySaver
       final result = await ImageGallerySaver.saveImage(bytes);

       // Check if the image was saved successfully
       if (result['isSuccess']) {
         print('Image saved successfully');
         print('------$result---------');
       } else {
         print('Failed to save image: ${result['errorMessage']}');
       }
     } else {
       print('Failed to fetch image. Status code: ${response.statusCode}');
     }
   } catch (e) {
     // Print any errors that may occur during the process
     print('Error: $e');
   }
 }

  }







