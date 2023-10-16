import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider_v2/productApi/model_product.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  List<ProductData> productData = [];

  Future<List<ProductData>> getData() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.sampleapis.com/beers/ale'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> index in data) {
          productData.add(ProductData.fromJson(index));
        }
        return productData;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            return ListView.builder(
              itemCount: productData.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Image.network('${productData[index].image}'),
                      Text(
                        'Name: ${productData[index].name}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Average: ${productData[index].rating.average}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Reviews ${productData[index].rating.reviews}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Price ${productData[index].price}',
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
