import 'package:flutter/material.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';

import '../../../core/customWidgets/MovieItem.dart';
import '../../auth/data/model/Search.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = 'movie_details';

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final List<Movie> movies = [
      Movie(title: "Black Widow", image: "https://upload.wikimedia.org/wikipedia/en/e/e9/Black_Widow_%282021_film%29_poster.jpg?20211004145350", rating: 7.7),
      Movie(title: "Captain America",image: 'https://upload.wikimedia.org/wikipedia/en/e/e9/Black_Widow_%282021_film%29_poster.jpg?20211004145350', rating: 7.7),
    ];
    List <String> genres = ['Action','Sci-Fi','Adventure','Fantasy','Horror'];

    List <Cast> cast = [
      Cast(image: ImageAssets.cast, name: 'Hayley Atwell', character: 'Captain Carter')
    ];
    List<String> screenShots = [ImageAssets.screenshot1,ImageAssets.screenshot3,
      ImageAssets.screenshot2];
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: height * 0.6,
                  width: width,
                  child: Image.asset(
                    ImageAssets.DoctorStrange,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: height * 0.6,
                  width: width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.blackCover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.20),
                    Image.asset(ImageAssets.startWatch),
                    SizedBox(height: height * 0.04),
                    Text(
                      'Doctor Strange in the Multiverse of Madness',
                      style: FontManager.robotoBold24White,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      '2022',
                      style: FontManager.robotoBold20White,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.05),
                    CustomButton(
                      title: 'Watch',
                      buttonColor: ColorManager.redColor,
                      style: FontManager.robotoBold20White,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImageAssets.loveIcon),
                        Text('15',style: FontManager.robotoBold24White,)
                      ],
                    ),
                  ),
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImageAssets.timeIcon),
                        Text('90',style: FontManager.robotoBold24White,)
                      ],
                    ),
                  ),
                  Container(
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.darkGrey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImageAssets.starIcon),
                        Text('7.6',style: FontManager.robotoBold24White,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),
              child: Text('Screen Shots',style: FontManager.robotoBold24White),
            ),
            SizedBox(
              height: height*0.6,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: screenShots.length,
                  itemBuilder: (context,index){
                return Image.asset(screenShots[index]);
              }),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width*0.05,top: height*0.02),
              child: Text('Similar',style: FontManager.robotoBold24White),
            ),
            SizedBox(
              height: height*0.4,
              child: GridView.builder(
                itemCount: movies.length,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieItem(
                      title: movie.title!,
                      rating: movie.rating!,
                      image: movie.image!);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width*0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Summary',style: FontManager.robotoBold24White),
                  SizedBox(height: height*0.02,),
                  Text('Following the events of Spider-Man No Way Home, '
                      'Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. '
                      'With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez '
                      'while traveling through various realities and working to restore reality as he knows it.'
                      ' Along the way, Strange and his allies realize they must take on a powerful new adversary'
                      ' who seeks to take over the multiverse.—Blazer346',style: FontManager.robotoRegular16White,)

                ],
              ),
            ),
            SizedBox(height: height*0.02,),
            Text('  Cast',style: FontManager.robotoBold24White,),
            SizedBox(height: height*0.02,),
            SizedBox(
              height: height*0.4,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: cast.length,
                  itemBuilder: (context,index){
                    return buildCastCard(cast: cast, width: width, height: height, index: index);
                  }
              ),
            ),
            SizedBox(height: height*0.02,),
            Text('  Genres',style: FontManager.robotoBold24White,),
            SizedBox(height: height*0.02,),
            SizedBox(
              height: height*0.2,
              child: GridView.builder(
                itemCount: genres.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 3),
                  itemBuilder: (context,index){
                    return buildGenresCard(genre: genres[index], width: width, height: height);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget buildCastCard({required List<Cast> cast,required int index, required double width, required double height}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width *0.02,vertical: height*0.01),
    decoration: BoxDecoration(
      color: ColorManager.darkGrey,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Image.asset(cast[index].image,width: 70,height: 70,),
        SizedBox(width: width*0.02,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name : ${cast[index].name}',style: FontManager.robotoRegular20White,),
            Text('Character : ${cast[index].character}',style: FontManager.robotoRegular20White,),
          ],
        )
      ],
    ),
  );
}
Widget buildGenresCard({ required String genre ,required double width, required double height}){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: width *0.02,vertical: height*0.01),
    decoration: BoxDecoration(
      color: ColorManager.darkGrey,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(genre , style: FontManager.robotoRegular16White,)
  );
}
class Cast {
  String image;
  String name;
  String character;
  Cast({required this.image,required this.name , required this.character});
}

