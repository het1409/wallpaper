import "package:flutter/material.dart";
import "package:wallpaper/model/wallpaper_model.dart";

// ignore: non_constant_identifier_names
Widget BrandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      Text(
        "Fresh",
        style: TextStyle(color: Colors.black87),
      ),
      Text("Walls",style: TextStyle(color: Colors.blue),),
    ],
  );
}


Widget wallpapersList(List<WallpaperModel> wallpapers, context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
    childAspectRatio: 0.6,
    mainAxisSpacing: 6.0,
    crossAxisSpacing: 6.0,
    children: wallpapers.map((wallpaper){
      return GridTile(
        child: Container(
          child: Image.network(wallpaper.src.portrait),
      ),
      );
    }).toList(),
    ),
  );
}

