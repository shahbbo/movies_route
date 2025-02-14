import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/customWidgets/custom_button.dart';
import 'package:flutter_projects/core/resources/asset_manager.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/core/resources/text_manager.dart';
import 'package:flutter_projects/features/movie_details/logic/movie_details/movie_details_cubit.dart';
import 'package:flutter_projects/features/movie_details/ui/widgets/rate_runtime_fav.dart';
import 'package:flutter_projects/features/movie_details/ui/widgets/screen_shots_builder.dart';
import 'package:flutter_projects/features/movie_details/ui/widgets/similar_movies.dart';
import 'package:flutter_projects/features/movie_details/ui/widgets/summary_text.dart';
import 'package:flutter_projects/features/movie_details/ui/widgets/yt_trailer_player.dart';

import '../../home_tab/data/model/MoviesListModel.dart';
import '../data/model/MovieModel.dart';
import 'widgets/cast_builder.dart';
import 'widgets/genres_grid.dart';

class MovieDetails extends StatefulWidget {
  static const String routeName = 'movie_details';

  final num movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => MovieDetailsCubit()..getMovieDetails(widget.movieId)..getSuggestions(widget.movieId),
      child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MovieDetailsCubit.of(context);
          final List<Movies> similarMovies = cubit.movieSuggestions.data?.movies ?? [];
          if (state is MovieDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MovieDetailsError) {
            return const Center(child: Text('Failed to load movie details'));
          }
          if (cubit.movieDetails.data != null) {
            final movie = cubit.movieDetails.data!.movie!;
            List<String> genres = movie.genres ?? [];
            List<Cast> movieCast = movie.cast ?? [];
            List<String> screenShots = [
              movie.largeScreenshotImage1 ?? '',
              movie.largeScreenshotImage2 ?? '',
              movie.largeScreenshotImage3 ?? '',
            ];
            return SafeArea(
              child: Scaffold(
                backgroundColor: ColorManager.blackColor,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      cubit.isPlaying ?
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: YtTrailerPlayer(idYtTrailer: movie.ytTrailerCode ?? '',),) :
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.6,
                            width: width,
                            child: CachedNetworkImage(
                              imageUrl: movie.largeCoverImage ?? '',
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                movie.title ?? "Unknown Title",
                                style: FontManager.robotoBold24White,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                movie.dateUploaded ?? "Unknown Date",
                                style: FontManager.robotoBold20White,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: height * 0.05),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          onPressed: () {
                            cubit.playTrailer();
                            if (mounted) cubit.controller.toggleFullScreenMode();
                          },
                          title: cubit.isPlaying ? 'Close Trailer' : 'Play Trailer',
                          buttonColor: ColorManager.redColor,
                          style: FontManager.robotoBold20White,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      RateRuntimeFav(
                        rating: movie.rating,
                        runtime: movie.runtime,
                        likeCount: movie.likeCount,
                      ),
                      ScreenShotsBuilder(screenShots: screenShots),
                      SimilarMovies(movies: similarMovies),
                      SummaryText(
                          descriptionFull: movie.descriptionFull ?? '',
                          descriptionIntro: movie.descriptionIntro ?? ''),
                      SizedBox(height: height * 0.02),
                      CastBuilder(movieCast: movieCast),
                      SizedBox(height: height * 0.02),
                      GenresGrid(genres: genres),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
