// ignore_for_file: depend_on_referenced_packages

import "dart:convert";

import "package:flutter/material.dart";
import "package:wallpaper/data/data.dart";
import "package:wallpaper/model/categories_model.dart";
import "package:wallpaper/model/wallpaper_model.dart";
import 'package:wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  //const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpaperModel> wallpapers = [];

getTrendingWallpapers() async{
  var response = await http.get(Uri.https('https://api.pexels.com/v1/curated?per_page=15'), 
  headers: {
    "Authorization": apiKey
  }
  );

  //print(response.body.toString());

  Map<String,dynamic> jsonData = jsonDecode(response.body);
  jsonData["photos"].forEach((element){
  
  WallpaperModel wallpaperModel = new WallpaperModel();
  wallpaperModel = WallpaperModel.fromMap(element);
  wallpapers.add(wallpaperModel);

  });
  setState(() {
    
  });
}

  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BrandName(),
        elevation: 0.0,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 240),
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: TextField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "search"),
                  ),
                ),
                Icon(Icons.search)
              ],
            ),
          ),


          SizedBox(
            height: 16,
          ),
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //wallpapers[index].src.portrait;
                  return CategoriesTile(
                    title: categories[index].categoriesName,
                    imgUrl: categories[index].imgUrl,
                  );
                }),
          ),
          wallpapersList(wallpapers: wallpapers, context: context),
          SizedBox(
            height: 16,
          ),
          
        ]),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrl, title;
  CategoriesTile({
    @required this.title,
    @required this.imgUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
        child: Stack(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imgUrl, height: 50, width: 100, fit: BoxFit.cover,)),
      Container(
        color: Colors.black26,
        height: 50, width: 100,
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),),
      ),
    ]));
  }
}
