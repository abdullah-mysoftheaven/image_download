
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_download/utils/assets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveImageFromUrl extends StatelessWidget {
  final String imageUrl =
      'https://drive.google.com/drive/folders/18-q_b2VpI2YDIfSGOeBE1PXzx0ta56iD'; // Replace with your image URL

  Future<void> saveImageToDeviceGallery() async {
    try {
      var response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // Convert the image bytes to Uint8List
        Uint8List bytes = response.bodyBytes;

        // Save image to gallery
        final result = await ImageGallerySaver.saveImage(bytes);





        if (result['isSuccess']) {

          print('Image saved successfully');
          print('------$result---------');
        } else {
          print('Failed to save image: ${result['errorMessage']}');
        }
      }
      else {
        print('Failed to download image');
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Image Example'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(

            height: 150, width: 150,

            child:FadeInImage.assetNetwork(
              fit: BoxFit.fill,
              placeholder: Assets.profileAvater,
              image:"https://contents.spin.ph/image/resize/image/2018/08/21/mo-salah-1534812024.webp",
              imageErrorBuilder: (context, url, error) =>
                  Image.asset(
                    Assets.profileAvater,
                    fit: BoxFit.fill,
                  ),
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                saveImageToDeviceGallery();
              },
              child: Text('Save Image'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SaveImageFromUrl(),
  ));
}
