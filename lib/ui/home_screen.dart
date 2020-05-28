import 'package:archillect/context/imageSource.dart';
import 'package:archillect/context/lastPost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imgSrc = '';
  int lastPosting = 0, x = 0;
  String logo = 'https://archillect.com/img/logo_thick.svg';

  Future getContext(int x) async {
    lastPosting = await lastPost() - x;
    imgSrc = await imageSource(lastPosting);
  }

  @override
  void setState(VoidCallback fn) {
    getContext(0);
  }

  @override
  void initState() {
    setState(() {
      getContext(0);
      print(imgSrc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'images/archillect.png',
            alignment: Alignment.center,
            height: 50,
            width: 50,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                'Um texto pta testar essa merda',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              FutureBuilder(
                future: getContext(0),
                builder: (context, image) {
                  if (imgSrc != '')
                    return Image.network(imgSrc);
                  else
                    return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 16),
              FutureBuilder(
                future: getContext(2),
                builder: (context, image) {
                  if (imgSrc != '')
                    return Image.network(imgSrc);
                  else
                    return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
    );
  }
}
