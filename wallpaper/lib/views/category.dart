import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/model/wallpaper_model.dart';
import 'package:wallpaper/widgets/widget.dart';

class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({this.categorieName});
  //const Categorie({Key key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
List<WallpaperModel> wallpapers = [];
  getSearchWallpapers(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=15",
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
   getSearchWallpapers(widget.categorieName); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BrandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(child: Column(
          children: <Widget> [
            
              SizedBox(
                height: 16,
              ),
              
              wallpapersList(wallpapers: wallpapers, context: context),
          ],
        ),),
      ),
    );
  }
}