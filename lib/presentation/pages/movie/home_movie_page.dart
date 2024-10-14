import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movies_bloc/now_playing_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:ditonton/presentation/pages/movie/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/movie/popular_movies_page.dart';
import 'package:ditonton/presentation/pages/movie/top_rated_movies_page.dart';
import 'package:ditonton/presentation/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMoviePage extends StatelessWidget {
  const HomeMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now Playing',
              style: kHeading6,
            ),
            BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
              builder: (context, state) {
                if (state is GetNowPlayingMoviesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetNowPlayingMoviesHasData) {
                  return MovieList(state.result);
                } else if (state is GetNowPlayingMoviesEmpty) {
                  return Text("Empty data.");
                } else {
                  return Text("Failed to load data");
                }
              },
            ),
            SubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                if (state is GetPopularMoviesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetPopularMoviesHasData) {
                  return MovieList(state.result);
                } else if (state is GetPopularMoviesEmpty) {
                  return Text("Empty data.");
                } else {
                  return Text("Failed to load data");
                }
              },
            ),
            SubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
            ),
            BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
              builder: (context, state) {
                if (state is GetTopRatedMoviesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetTopRatedMoviesHasData) {
                  return MovieList(state.result);
                } else if (state is GetTopRatedMoviesEmpty) {
                  return Text("Empty data.");
                } else {
                  return Text("Failed to load data");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
