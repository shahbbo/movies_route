import 'package:flutter/material.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';

import '../../auth/data/model/Search.dart';

class SearchTab extends StatefulWidget {
  static const String routeName = 'SearchTab';
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<SearchTab> {
  final List<Movie> movies = [
    Movie(title: "Black Widow", image: "assets/image/blackWidowImage.png", rating: '7.7'),
    Movie(title: "Captain America",image: 'assets/image/CaptainAmerica.png', rating: '7.7'),
    Movie(title: "Iron Man 3", image: "assets/image/IronMan.png", rating: '7.7'),
    Movie(title: "Civil War", image: "assets/image/CivilWar.png", rating: '7.7'),
    Movie(title: "Avengers", image: "assets/image/Avengers.png", rating: '7.7'),
    Movie(title: "Doctor Strange", image: "assets/image/DoctorStrange.png", rating: '7.7'),
  ];
  List<Movie> MoviesApp = [];
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    MoviesApp = movies;
  }
  void filterSearch(String query) {
    setState(() {
      MoviesApp = movies
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
              itemCount: MoviesApp.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final movie = MoviesApp[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                         movie.image ??  'assets/image/defaultImage.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: ColorManager.blackOn.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text(
                                movie.rating.toString(),
                                style: TextStyle(color: ColorManager.offWhite, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.star, color: ColorManager.yellowColor, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    ),
    );
  }
}


