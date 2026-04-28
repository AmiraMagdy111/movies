
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/movies_details/widgets/custom_filled_button.dart';
import 'package:movies/features/movies_details/widgets/movie_poster_section.dart';
import 'package:movies/model/history_model/history_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api/models/movies_response/Movies.dart';
import '../../../clean_architecture/domain/repository/auth_repository.dart';
import '../../../core/di/di.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../model/watchlist_movies_model/watchlist_movies_model.dart';
import 'movie_info_item.dart';

class MovieHeaderSection extends StatefulWidget {
  final String? ytTrailerCode;
  final Movies movie;

  const MovieHeaderSection({
    super.key,
    required this.movie,
    required this.ytTrailerCode,
  });

  @override
  State<MovieHeaderSection> createState() => _MovieHeaderSectionState();
}

class _MovieHeaderSectionState extends State<MovieHeaderSection> {
  final authRepository = getIt<AuthRepository>();
  final uid = FirebaseAuth.instance.currentUser!.uid;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addToHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoviePosterSection(
          image: widget.movie.largeCoverImage ?? "",
          title: widget.movie.title ?? "",
          year: widget.movie.year.toString(),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.w),
          child: CustomFilledButton(
            onPressed: () {
              if (widget.ytTrailerCode != null &&
                  widget.ytTrailerCode!.isNotEmpty) {
                final url =
                    "https://www.youtube.com/watch?v=${widget.ytTrailerCode}";
                launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.inAppWebView,
                );
              }
            },
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: StreamBuilder<List<WatchlistMoviesModel>>(
                  stream: authRepository.getMoviesFromFirestore(uid: uid),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    }

                    final movies = snapshot.data!;

                    final isFavorite = movies.any(
                          (m) => m.id == widget.movie.id.toString(),
                    );
                    return MovieInfoItem(
                      icon: isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite
                          ? ColorsManager.secondaryOrange
                          : ColorsManager.grayDad,
                      text: movies.length.toString(),
                      //text: widget.movie.likeCount?.toString() ?? "0",
                      onPressed: isFavorite
                          ? null
                          : () async {
                        final watchlistMovie = WatchlistMoviesModel(
                          id: widget.movie.id.toString(),
                          title: widget.movie.title,
                          image: widget.movie.mediumCoverImage,
                          rating: widget.movie.rating,
                        );
                        await authRepository.addMovie(
                          movie: watchlistMovie,
                          uid: uid,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: MovieInfoItem(
                  icon: Icons.access_time,
                  color: ColorsManager.secondaryOrange,
                  text: widget.movie.runtime?.toString() ?? "",
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: MovieInfoItem(
                  icon: Icons.star,
                  color: ColorsManager.secondaryOrange,
                  text: widget.movie.rating?.toString() ?? "",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void addToHistory() async{
    final history = HistoryModel(widget.movie.id.toString(),
        widget.movie.title,
        widget.movie.mediumCoverImage,
        widget.movie.rating,
        Timestamp.now());
    await authRepository.addHistoryToFirestore(history: history, uid: uid);
  }
}