class AllChapterModel {
  int chapter_number;
  int verses_count;
  int id;
  String chapter_summary;
  String chapter_summary_hindi;
  String image_name;
  String name;
  String name_meaning;
  String name_translation;
  String json_path;

  AllChapterModel({
    required this.id,
    required this.chapter_number,
    required this.chapter_summary,
    required this.chapter_summary_hindi,
    required this.image_name,
    required this.json_path,
    required this.name,
    required this.name_meaning,
    required this.name_translation,
    required this.verses_count,
  });

  factory AllChapterModel.fromJson({required Map data}) {
    return AllChapterModel(
        id: data['id'],
        chapter_number: data['chapter_number'],
        chapter_summary: data['chapter_summary'],
        chapter_summary_hindi: data['chapter_summary_hindi'],
        image_name: data['image_name'],
        json_path: data['json_path'],
        name: data['name'],
        name_meaning: data['name_meaning'],
        name_translation: data['name_translation'],
        verses_count: data['verses_count']);
  }
}
