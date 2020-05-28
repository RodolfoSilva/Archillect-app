import 'package:http/http.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

Future<int> lastPost() async {
  String lastPosting;
  var client = Client();
  Response response = await client.get('https://archillect.com');

  var document = parse(response.body);

  List<Element> links = document.querySelectorAll('a.post');

  List<Map<String, dynamic>> linkMap = [];

  for (var link in links) {
    linkMap.add({
      'title': link.text,
      'href': link.attributes['href'],
    });

    lastPosting = link.attributes['href'];
  }

  lastPosting = lastPosting.substring(1, lastPosting.length);
  int lastPostId = int.parse(lastPosting);
  lastPostId += 35;

  return lastPostId;
}