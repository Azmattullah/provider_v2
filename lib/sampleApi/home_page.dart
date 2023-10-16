import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_v2/sampleApi/models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SamplePost> samplePost = [];

  Future<List<SamplePost>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePost.add(SamplePost.fromJson(index));
      }
      return samplePost;
    } else {
      return samplePost;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            return ListView.builder(
              itemCount: samplePost.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 250,
                  color: Colors.blueGrey.shade100,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User id: ${samplePost[index].userId}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Id: ${samplePost[index].id}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'User Title: ${samplePost[index].title}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'User Body: ${samplePost[index].body}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
