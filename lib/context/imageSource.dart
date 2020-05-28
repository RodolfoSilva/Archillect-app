import 'package:archillect/context/lastPost.dart';
import 'package:http/http.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

Future<String> imageSource(int lastPostId) async{
  String imageSource;
  var client = Client();

  Response response2 = await client.get('https://archillect.com/$lastPostId');
  var document2 = parse(response2.body);
  List<Element> links2 = document2.querySelectorAll('img');

  List<Map<String, dynamic>> linkMap2 = [];

  for (var link2 in links2) {
    linkMap2.add({
      'src': link2.attributes['src'],
    });

    imageSource = link2.attributes['src'];
  }

  return imageSource;
}
