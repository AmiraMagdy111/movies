
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/api/api_service.dart';
import 'package:movies/core/assets_image/app_assets.dart';
import 'package:movies/core/theming/onboarding_image/onboarding_image.dart';
import 'package:movies/model/genre_model/genre_model.dart';
import 'package:movies/tabs/home_tab/widgets/background_gradient.dart';
import 'package:movies/tabs/home_tab/widgets/movie_card.dart';
import 'package:movies/tabs/home_tab/widgets/movies_carousel.dart';
import 'package:movies/tabs/home_tab/widgets/section_header.dart';
import '../../api/models/movies_response/Movies_response.dart';
import '../../core/routing/routes.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}
class _HomeTabState extends State<HomeTab> {
  final genres = GenreModel.genres;
  late Future<MoviesResponse> moviesFuture;
  int currentIndex = 0;
  int genreIndex = 0;
  String selectedGenre = "";
  @override
  void initState() {
    super.initState();
    moviesFuture = ApiService.getLatestMovies();
    selectedGenre = genres[genreIndex].name;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesResponse>(
      future: moviesFuture,

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final movies = snapshot.data!.data!.movies ?? [];

        final filteredMovies = movies.where((movie) {
          return movie.genres?.any(
                (g) => g.toLowerCase() == selectedGenre.toLowerCase(),
          ) ??
              false;
        }).toList();
        return Stack(
          children: [
            Positioned.fill(
              child: movies.isNotEmpty
                  ? Image.network(
                movies[currentIndex].largeCoverImage ?? OnboardingImage.page1,
                fit: BoxFit.cover,
              )
                  : const SizedBox(),
            ),
            Positioned.fill(child: BackgroundGradient()),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 267.w,
                        height: 93.h,
                        child: Image.asset(HomeTabImage.availableNow),
                      ),
                      SizedBox(height: 21.h),
                      MoviesCarousel(
                        movies: movies,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      SizedBox(height: 21.h),
                      SizedBox(
                        width: 354.w,
                        height: 146.h,
                        child: Image.asset(HomeTabImage.watchNow),
                      ),
                      SizedBox(height: 30.h),
                      SectionHeader(
                        title: selectedGenre,
                        onPress: (){},
                          // await Navigator.pushNamed(
                          //     context, Routes.moviesDetails);
                         // setState(() {
                          //  genreIndex++;
                           // if (genreIndex >= genres.length) {
                        //     // genreIndex = 0;
                           // }
                       //     selectedGenre = genres[genreIndex].name;
                          //});
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 220.h,
                        child: ListView.separated(
                          padding: REdgeInsets.only(left: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredMovies.length,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            return MovieCard(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.moviesDetails,
                                arguments: filteredMovies[index].id,
                              );

                              // setState(() {
                              //   genreIndex++;
                              //   if (genreIndex >= genres.length) {
                              //     genreIndex = 0;
                              //   }
                              //   selectedGenre = genres[genreIndex].name;
                              // });
                            },
                            width: 146.w,
                            movie: filteredMovies[index],
                            );

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}