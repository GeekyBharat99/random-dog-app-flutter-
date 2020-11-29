import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Dog extends StatefulWidget {
  @override
  _DogState createState() => _DogState();
}

class _DogState extends State<Dog> {
  var url = "https://dog.ceo/api/breeds/image/random";
  var imageUrl = null;

  getdata() async {
    var response = await http.get(url);
    var jsondata = convert.jsonDecode(response.body);
    var jsonUrl = jsondata["message"];
    setState(() {
      imageUrl = jsonUrl;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("random Dog"),
        centerTitle: true,
      ),
      body: imageUrl == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                child: Image(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext ctx, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                          child: Image(image: AssetImage("download.jfif")));
                    }
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: getdata,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
