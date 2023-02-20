import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Model/PostmodelApi.dart';
import 'package:http/http.dart' as http;

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Future<PostModel> getPostApi() async {
    final response =
        await http.get(Uri.parse("http://api.aladhan.com/asmaAlHusna/1,2"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return PostModel.fromJson(data);
    } else {
      return PostModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<PostModel>(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(snapshot.data!.data![index].number
                                    .toString()),
                                Text(snapshot.data!.data![index].name
                                    .toString()),
                                Text(snapshot.data!.data![index].transliteration
                                    .toString()),
                              ],
                            );
                          });
                    } else {
                      return Text("Loading....");
                    }
                  }))
        ],
      ),
    );
  }
}
