


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/tabs/home_tab/widgets/movie_card.dart';
import 'package:movies/tabs/profile_tab/tab_bar/widget/custom_grid_view_widget.dart';
import 'package:movies/tabs/profile_tab/tab_bar/widget/widget_empty.dart';

import '../../../../clean_architecture/domain/repository/auth_repository.dart';
import '../../../../core/di/di.dart';
import '../../../../features/movies_details/movies_details.dart';

class HistoryTab extends StatelessWidget {
  HistoryTab({super.key, required this.history});

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final authRepository = getIt<AuthRepository>();
  final List history;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authRepository.getHistoryFromFirestore(uid: uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return WidgetEmpty();
        }
        final history = snapshot.data!;
        return CustomGridViewWidget(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16.42,
          childAspectRatio: 0.68,
          itemCount: history.length,
          itemBuilder: (context, index) {
            final movie = history[index];
            return MovieCard(
              image: movie.image,
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
