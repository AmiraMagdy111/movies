import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies/core/assets_image/app_assets.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/tabs/home_tab/widgets/movie_card.dart';
import '../../api/api_service.dart';
import '../../api/models/movies_response/Movies.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});
  @override
  State<SearchTab> createState() => _SearchTabState();
}
class _SearchTabState extends State<SearchTab> {
  final searchController = TextEditingController();
  Timer? _debounce;
  bool isLoading = false;
  bool hasSearched = false;
  List<Movies> movies = [];

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchMovies(query);
    });
  }

  void fetchMovies(String query) async {
    if (query.isEmpty) {
      setState(() {
        movies = [];
        hasSearched = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    try {
      final results = await ApiService.searchMovies(query);
      setState(() {
        movies = results;
      });
    } catch (e) {
      print("Error fetching movies: $e");
      setState(() {
        movies = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: searchController,
                    hintText: "Search",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        IconsManager.searchIcon,
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: onSearchChanged,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: buildSearchResults(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildSearchResults() {
    if (!hasSearched) {
      return Center(
        child: Image.asset(
          AppAssets.searchTabEmpty,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      );
    } else if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.yellow,
        ),
      );
    } else if (movies.isEmpty) {
      return Center(
        child: Text(
          "No movies found",
          style: StylesManager.googleFont18WhiteRegular,
        ),
      );
    } else {
      return GridView.builder(
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  Routes.moviesDetails,
                  arguments: movies[index].id,
                );
              },
              child: MovieCard(movie: movies[index]));
        },
      );
    }
  }
}
