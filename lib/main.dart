
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_download/utils/assets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveImageFromUrl extends StatelessWidget {
  final String imageUrl =
      'https://drive.google.com/uc?export=view&id=1VxXLQglhtZHR7_xIUToZIXhA10yxRzWf'; // Replace with your image URL

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
              image:"https://drive.google.com/uc?export=view&id=1VxXLQglhtZHR7_xIUToZIXhA10yxRzWf",
              // image:"https://drive.google.com/uc?export=view&id=1eR3DSNCPmROsKuoHq8ryPGCZTveIar1u",
              // image:"https://drive.google.com/uc?export=view&id=1qvMo2-XoTWA-VQpicRBMSi9mMJfEsbDc",
              // image:"https://drive.google.com/file/d/1qvMo2-XoTWA-VQpicRBMSi9mMJfEsbDc",

              /// https://drive.google.com/uc?export=view&id=YOUR_FILE_ID. this formet will be
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
