

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:http/http.dart' as http;
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../YoutubeVieoListModel.dart';




class  VideoListPageController1 extends GetxController {

 var videoList=<YouTubeVideoListModel>[].obs;


 Future<void> captureFrame(String videoUrl, Duration captureTime) async {
   VideoPlayerController _controller = VideoPlayerController.network(videoUrl);

   await _controller.initialize();

   // Set the video controller position to the capture time
   await _controller.seekTo(captureTime);

   // Create a `VideoPlayer` widget to display the video
   VideoPlayer videoPlayer = VideoPlayer(_controller);

   // Create a `GlobalKey` to access the rendered video frame
   GlobalKey videoPlayerKey = GlobalKey();

   // Create a `RepaintBoundary` to capture the rendered frame
   RepaintBoundary boundary = RepaintBoundary(
     key: videoPlayerKey,
     child: videoPlayer,
   );

   // Create a `RenderRepaintBoundary` and trigger the rendering
   RenderRepaintBoundary renderRepaintBoundary =
   videoPlayerKey.currentContext.findRenderObject() as RenderRepaintBoundary;
   ui.Image image = await renderRepaintBoundary.toImage(pixelRatio: 1.0);
   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
   Uint8List pngBytes = byteData.buffer.asUint8List();

   // Save the captured frame as an image file
   File imageFile = File('captured_frame.png');
   await imageFile.writeAsBytes(pngBytes);

   // Dispose of the video controller
   _controller.dispose();
 }

  @override
  void onInit() {
    super.onInit();
    getPlaylistVideos1();




  }
 getPlaylistVideos1( ) async {

   var yt = YoutubeExplode();

   var playlist = await yt.playlists.get('PLjxrf2q8roU3LvrdR8Hv_phLrTj0xmjnD');

   var somePlaylistVideos = await yt.playlists.getVideos(playlist.id).toList();
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







