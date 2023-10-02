import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Models/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BHAGWAD GEETA"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("all_chapters.json"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List DecodedData = jsonDecode(snapshot.data!);
            List<AllChapterModel> allData =
                DecodedData.map((e) => AllChapterModel.fromJson(data: e))
                    .toList();
            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (ctx, i) {
                return Card(
                  child: ListTile(
                    title: Text(
                      "${allData[i].san}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("${allData[i].eng}"),
                    trailing: Text("${allData[i].verse}"),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
