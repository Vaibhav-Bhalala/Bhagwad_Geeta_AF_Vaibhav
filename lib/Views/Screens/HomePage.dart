import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/json_decode_model.dart';
import '../../Providers/json_decode_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
        .loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 0.5,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/1277842283/photo/opened-bhagavad-gita-and-rosary-lying-on-a-wooden-table.jpg?s=612x612&w=0&k=20&c=XwqtQYxq3Ty8nSRlIFJccalUAVfQmCACshUHZ1p6Plk="),
                        fit: BoxFit.fill),
                  ),
                )),
            Expanded(
              flex: 13,
              child: ListView.builder(
                itemCount: Provider.of<ChapterJsonDecodeProvider>(context)
                    .chapterJsonDecodeModel
                    .allChapter
                    .length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://e0.pxfuel.com/wallpapers/954/241/desktop-wallpaper-indian-art-painting-mahabharat-bhagavad-gita-krishna-arjun-mahabharata.jpg"),
                            fit: BoxFit.fill)),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          chapterIndex = index;
                          Navigator.of(context)
                              .pushNamed("chapter_detail_page");
                        },
                        leading: Text(
                          "${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].id}",
                          style: TextStyle(color: Colors.white),
                        ),
                        title: Text(
                          Provider.of<ChapterJsonDecodeProvider>(context,
                                  listen: false)
                              .chapterJsonDecodeModel
                              .allChapter[index]
                              .nameHindi,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "Verses : ${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].versesCount}",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
