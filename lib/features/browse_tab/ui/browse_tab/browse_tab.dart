import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/resources/app_localizations.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/home_tab/logic/home_tab_cubit.dart';
import '../../../../core/customWidgets/MovieItem.dart';
import '../widgets/tab_category_widget.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;
  String selectedCategory = "Action";
  @override
  void initState() {
    super.initState();
    final homeCubit = BlocProvider.of<HomeTabCubit>(context);
    selectedCategory = homeCubit.selectedGenre;

    final categories = [
      "action",
      "adventure",
      "animation",
      "biography",
    ];

    selectedIndex = categories.indexOf(selectedCategory);
    BlocProvider.of<HomeTabCubit>(context).getMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "action".tr(context),
      "adventure".tr(context),
      "animation".tr(context),
      "biography".tr(context),
    ];

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(children: [
              DefaultTabController(
                  length: categories.length,
                  child: TabBar(
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                          selectedCategory = categories[index];
                          BlocProvider.of<HomeTabCubit>(context)
                              .filterMoviesBySelectedGenre(selectedCategory);
                        });
                      },
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: ColorManager.blackColor,
                      dividerColor: ColorManager.transparentColor,
                      labelPadding: EdgeInsets.symmetric(horizontal: 4),
                      tabs: categories.map((filmCategory) {
                        return TabCategoryWidget(
                            isSelected: selectedIndex ==
                                categories.indexOf(filmCategory),
                            filmCategory: filmCategory);
                      }).toList())),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<HomeTabCubit, HomeTabState>(
                  builder: (context, state) {
                    if (state is HomeTabLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is HomeTabError) {
                      return Center(
                          child: Text(state.error,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)));
                    } else if (state is HomeTabLoaded) {
                      final cubit = HomeTabCubit.get(context);
                      final filteredMovies = cubit.filteredMovies;
                      return filteredMovies.isEmpty
                          ? Center(
                              child: Text("No movies found!",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)))
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                childAspectRatio: 0.7,
                              ),
                              itemCount: filteredMovies.length,
                              itemBuilder: (context, index) {
                                final movie = filteredMovies[index];
                                return MovieItem(
                                  movieId: movie.id!,
                                  title: movie.title!,
                                  rating: movie.rating!,
                                  image: movie.largeCoverImage!,
                                );
                              },
                            );
                    }

                    return Container();
                  },
                ),
              )
            ])));
  }
}
