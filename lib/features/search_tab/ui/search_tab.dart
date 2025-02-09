import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/MovieItem.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import '../../auth/data/model/Search.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = 'SearchTab';

  const SearchTab({super.key});
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<SearchTab> {
  final List<Movie> movies = [
    Movie(title: "Black Widow", image: "https://upload.wikimedia.org/wikipedia/en/e/e9/Black_Widow_%282021_film%29_poster.jpg?20211004145350", rating: 7.7),
    Movie(title: "Captain America",image: 'https://upload.wikimedia.org/wikipedia/en/e/e9/Black_Widow_%282021_film%29_poster.jpg?20211004145350', rating: 7.7),
  ];
  List<Movie> moviesApp = [];
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    moviesApp = movies;
  }
  void filterSearch(String query) {
    setState(() {
      moviesApp = movies
          .where((movie) => movie.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: ColorManager.blackOn,
          appBar: AppBar(
            backgroundColor: ColorManager.blackOn,
            title: TextField(
              onChanged: filterSearch,
              style: TextStyle(color: ColorManager.offWhite),
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: ColorManager.darkGrey),
                prefixIcon: Icon(Icons.search, color: ColorManager.offWhite),
                filled: true,
                fillColor: ColorManager.darkGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: moviesApp.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final movie = moviesApp[index];
                return MovieItem(
                    title: movie.title!,
                    rating: movie.rating!,
                    image: movie.image!);
              },
            ),
    ),
    );
  }
}


