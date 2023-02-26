// ignore_for_file: non_constant_identifier_names

class WallpaperModel{

  String photographer;
  String photograher_url;
  int photographer_id;
  SrcModel src;


  WallpaperModel({this.src, this.photographer, this.photograher_url, this.photographer_id});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData){
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData["src"]),
      photograher_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      photographer: jsonData["photographer"]
    );
  }
}

class SrcModel{
  String original;
  String small;
  String portrait;

  SrcModel({this.portrait, this.original, this.small});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData){
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      small: jsonData["small"]
    );
  }
}