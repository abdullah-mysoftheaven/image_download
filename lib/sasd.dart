import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart';

class YouTubeWebScraper {
  static Future<List<String>> getPlaylistVideos(String playlistUrl) async {
    final response = await http.get(Uri.parse(playlistUrl));

    if (response.statusCode == 200) {
      final document = htmlParser.parse(response.body);
      final List<Element> videoElements = document.querySelectorAll('.yt-simple-endpoint');

      final videoLinks = videoElements.map((element) {
        return 'https://www.youtube.com${element.attributes['href']}';
      }).toList();

      return videoLinks;
    } else {
      throw Exception('Failed to load playlist videos');
    }
  }
}
