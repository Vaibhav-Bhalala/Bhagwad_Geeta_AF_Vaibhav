import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/data_model.dart';
import 'package:untitled/Providers/theme_provider.dart';

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
        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.50),
        title: Text(
          "BHAGWAD GEETA",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeProvider>(context, listen: true)
                .themeChange
                .isDark,
            onChanged: (val) {
              Provider.of<ThemeProvider>(context, listen: false).ChangeTheme();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/homepagebg.gif"),
                    fit: BoxFit.cover)),
          ),
          FutureBuilder(
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
                      margin: EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 15,
                      ),
                      color: Colors.deepOrangeAccent.withOpacity(0.35),
                      child: ListTile(
                        title: Text(
                          "${allData[i].name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          "verse : ${allData[i].verses_count}",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),color: Colors.white,
                          onPressed: () {
                            AllChapterModel a = AllChapterModel(
                                id: allData[i].id,
                                chapter_number: allData[i].chapter_number,
                                chapter_summary: allData[i].chapter_summary,
                                chapter_summary_hindi:
                                    allData[i].chapter_summary_hindi,
                                image_name: allData[i].image_name,
                                json_path: allData[i].json_path,
                                name: allData[i].name,
                                name_meaning: allData[i].name_meaning,
                                name_translation: allData[i].name_translation,
                                verses_count: allData[i].verses_count);
                            Navigator.pushNamed(context,'detailpage',arguments: a );
                          },
                        ),
                        leading: Text(
                          "${allData[i].chapter_number}",
                          style: TextStyle(color: Colors.white),
                        ),
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
        ],
      ),
    );
  }
}
