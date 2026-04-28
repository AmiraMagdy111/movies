
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/tabs/profile_tab/tab_bar/widget/custom_grid_view_widget.dart';
import '../../../../clean_architecture/domain/repository/auth_repository.dart';
import '../../../../core/di/di.dart';
import '../../../../features/movies_details/movies_details.dart';
import '../../../../model/watchlist_movies_model/watchlist_movies_model.dart';
import '../../../home_tab/widgets/movie_card.dart';
import '../widget/widget_empty.dart';

class WatchListTab extends StatelessWidget {
  final List movies;

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final authRepository = getIt<AuthRepository>();

  WatchListTab({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WatchlistMoviesModel>>(
      stream: authRepository.getMoviesFromFirestore(uid: uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return WidgetEmpty();
        }
        final movies = snapshot.data!;
        return CustomGridViewWidget(
          itemCount: movies.length,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16.24,
          childAspectRatio: 0.68,
          itemBuilder: (context, index) {
            final movie = movies[index];

            return MovieCard(
              width: double.infinity,
              image: movie.image?.isNotEmpty == true
                  ? movie.image
                  : null,
              rating: movie.rating,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MoviesDetails(movieId: int.parse(movie.id!)),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
