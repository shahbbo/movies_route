import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/core/resources/color_manager.dart';
import 'package:flutter_projects/features/home_tab/logic/home_tab_cubit.dart';
import 'package:flutter_projects/features/home_tab/ui/widgets/movies_carousel_slider.dart';
import '../data/model/MoviesListModel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabCubit, HomeTabState>(
      listener: (context, state) {},
      builder: (context, state) {
        Size size = MediaQuery.sizeOf(context);
        final cubit = HomeTabCubit.get(context);
        return Column(
          children: [
            Container(
              height: size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(cubit.currentMovieImage ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      ColorManager.mainColor.withOpacity(0.4),
                      ColorManager.mainColor.withOpacity(0.8),
                      ColorManager.mainColor.withOpacity(0.99),
                    ],
                    stops: [0.0, 0.2, 0.5, 0.8,0.9, 1.0],
                  ),
                ),
                child: MoviesCarouselSlider(),
              ),
            ),
          ],
        );
      },
    );
  }
}
