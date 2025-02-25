import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/common/watch_category_enum.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/presentation/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendation_bloc/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_watchlist_bloc/movie_watchlist_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/movie-detail';

  final int id;
  MovieDetailPage({required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieDetailBloc>().add(OnGetMovieDetail(widget.id));
      context
          .read<MovieRecommendationBloc>()
          .add(OnGetMovieRecommendation(widget.id));
      context
          .read<MovieWatchlistBloc>()
          .add(OnGetWatchlistStatus(widget.id, WatchCategory.movie));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieDetailHasData) {
            final movie = state.result;
            return SafeArea(
              child: DetailContent(
                movie,
              ),
            );
          } else if (state is MovieDetailError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final MovieDetail movie;

  DetailContent(this.movie);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<MovieWatchlistBloc, MovieWatchlistState>(
      builder: (context, watchlistState) {
        final isAddedWatchlist = watchlistState is WatchlistStatusLoaded
            ? watchlistState.isAddedToWatchlist
            : false;

        return BlocListener<MovieWatchlistBloc, MovieWatchlistState>(
          listener: (context, state) {
            // show success snackbar
            if (state is SaveWatchlistSuccess ||
                state is RemoveWatchlistSuccess) {
              var saveMessage = (state is SaveWatchlistSuccess)
                  ? state.message
                  : (state as RemoveWatchlistSuccess).message;
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(saveMessage)));
            }

            // show failed dialog
            if (state is SaveWatchlistError || state is RemoveWatchlistError) {
              var errMessage = (state is SaveWatchlistError)
                  ? state.message
                  : (state as RemoveWatchlistError).message;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(errMessage),
                    );
                  });
            }
          },
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: screenWidth,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48 + 8),
                child: DraggableScrollableSheet(
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: kRichBlack,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        right: 16,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: kHeading5,
                                  ),
                                  FilledButton(
                                    onPressed: () {
                                      if (!isAddedWatchlist) {
                                        context
                                            .read<MovieWatchlistBloc>()
                                            .add(OnSaveWatchlist(movie));
                                      } else {
                                        context.read<MovieWatchlistBloc>().add(
                                            OnRemoveWatchlist(
                                                movie.id, WatchCategory.movie));
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(isAddedWatchlist
                                            ? Icons.check
                                            : Icons.add),
                                        const Text('Watchlist'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    _showGenres(movie.genres),
                                  ),
                                  Text(
                                    _showDuration(movie.runtime),
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: movie.voteAverage / 2,
                                        itemCount: 5,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: kMikadoYellow,
                                        ),
                                        itemSize: 24,
                                      ),
                                      Text('${movie.voteAverage}')
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Overview',
                                    style: kHeading6,
                                  ),
                                  Text(
                                    movie.overview,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Recommendations',
                                    style: kHeading6,
                                  ),
                                  BlocBuilder<MovieRecommendationBloc,
                                      MovieRecommendationState>(
                                    builder: (context, state) {
                                      if (state is MovieRecommendationLoading) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (state
                                          is MovieRecommendationError) {
                                        return Text(state.message);
                                      } else if (state
                                          is MovieRecommendationHasData) {
                                        var recommendations = state.result;
                                        return SizedBox(
                                          height: 150,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              final movie =
                                                  recommendations[index];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                      context,
                                                      MovieDetailPage
                                                          .ROUTE_NAME,
                                                      arguments: movie.id,
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                      placeholder:
                                                          (context, url) =>
                                                              const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: recommendations.length,
                                          ),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: Colors.white,
                              height: 4,
                              width: 48,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  // initialChildSize: 0.5,
                  minChildSize: 0.25,
                  // maxChildSize: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: kRichBlack,
                  foregroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
