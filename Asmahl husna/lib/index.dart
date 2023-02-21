import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Model/PostmodelApi.dart';

import 'api_service/asmaul_husna_api.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  APIService apiService = APIService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
      ),
      body: FutureBuilder<PostModel>(
          future: apiService.getPostApi(),
          builder: (context, AsyncSnapshot<PostModel> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(snapshot.data!.data![index].number.toString()),
                        Text(snapshot.data!.data![index].name.toString()),
                        Text(snapshot.data!.data![index].transliteration
                            .toString()),
                        Text(
                            snapshot.data!.data![index].en!.meaning.toString()),
                      ],
                    );
                  });
            } else {
              return Text("Loading....");
            }
          }),
    );
  }
}
