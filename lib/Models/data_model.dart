class JsonModel {
  int verse;
  int ch;
  String san;
  String eng;
  String guj;
  String hi;

  JsonModel({
    required this.verse,
    required this.ch,
    required this.eng,
    required this.guj,
    required this.hi,
    required this.san,
  });

  factory JsonModel.fromJson({required Map data}){
    return JsonModel(verse: data['verse'],
        ch: data['ch'],
        eng: data['eng'],
        guj: data['guj'],
        hi: data['hi'],
        san: data ['san']);
  }
}
