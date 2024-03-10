


import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

import 'package:path/path.dart' as p;
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
   var playlist = await yt.playlists.get('PLgH5QX0i9K3p4ckbNCy71LRr_dG0AWGw9');

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
         videoUrl: 'https://www.youtube.com/watch?v=${video.id}'
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


 String extractVideoId(String url) {



 }


  }







