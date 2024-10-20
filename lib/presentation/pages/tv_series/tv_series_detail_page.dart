import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:core/core.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_recommendation_bloc/tv_series_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_watchlist_bloc/tv_series_watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvSeriesDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/tvSeries-detail';

  final int id;
  TvSeriesDetailPage({required this.id});

  @override
  _TvSeriesDetailPageState createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TVSeriesDetailBloc>().add(OnGetTVSeriesDetail(widget.id));
      context
          .read<TvSeriesRecommendationBloc>()
          .add(OnGetTvSeriesRecommendation(widget.id));
      context
          .read<TvSeriesWatchlistBloc>()
          .add(OnGetWatchlistStatus(widget.id, WatchCategory.tvSeries));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TVSeriesDetailBloc, TVSeriesDetailState>(
        builder: (context, state) {
          if (state is TVSeriesDetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TVSeriesDetailHasData) {
            final tvSeries = state.result;
            return SafeArea(
              child: DetailContent(
                tvSeries,
              ),
            );
          } else if (state is TVSeriesDetailError) {
            return Text(state.message);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TVSeriesDetail tvSeries;

  DetailContent(
    this.tvSeries,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TvSeriesWatchlistBloc, TvWatchlistState>(
      builder: (context, watchlistState) {
        final isAddedWatchlist = watchlistState is WatchlistStatusLoaded
            ? watchlistState.isAddedToWatchlist
            : false;
        print("isAddedWatchlist: $isAddedWatchlist");
        return BlocListener<TvSeriesWatchlistBloc, TvWatchlistState>(
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
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                width: screenWidth,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Container(
                margin: const EdgeInsets.only(top: 48 + 8),
                child: DraggableScrollableSheet(
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
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
                                    tvSeries.originalName,
                                    style: kHeading5,
                                  ),
                                  FilledButton(
                                    onPressed: () {
                                      if (!isAddedWatchlist) {
                                        context
                                            .read<TvSeriesWatchlistBloc>()
                                            .add(OnSaveWatchlist(tvSeries));
                                      } else {
                                        context
                                            .read<TvSeriesWatchlistBloc>()
                                            .add(OnRemoveWatchlist(tvSeries.id,
                                                WatchCategory.tvSeries));
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(isAddedWatchlist
                                            ? Icons.check
                                            : Icons.add),
                                        Text('Watchlist'),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    _showGenres(tvSeries.genres),
                                  ),
                                  Text(
                                    _showDuration(
                                        tvSeries.episodeRunTime.first),
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: tvSeries.voteAverage / 2,
                                        itemCount: 5,
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star,
                                          color: kMikadoYellow,
                                        ),
                                        itemSize: 24,
                                      ),
                                      Text('${tvSeries.voteAverage}')
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Overview',
                                    style: kHeading6,
                                  ),
                                  Text(
                                    tvSeries.overview,
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Recommendations',
                                    style: kHeading6,
                                  ),
                                  BlocBuilder<TvSeriesRecommendationBloc,
                                      TvSeriesRecommendationState>(
                                    builder: (context, state) {
                                      if (state
                                          is TvSeriesRecommendationLoading) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (state
                                          is TvSeriesRecommendationError) {
                                        return Text(state.message);
                                      } else if (state
                                          is TvSeriesRecommendationHasData) {
                                        var recommendations = state.result;
                                        return Container(
                                          height: 150,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              final tvSeries =
                                                  recommendations[index];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                      context,
                                                      TvSeriesDetailPage
                                                          .ROUTE_NAME,
                                                      arguments: tvSeries.id,
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                                                      placeholder:
                                                          (context, url) =>
                                                              Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
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
                    icon: Icon(Icons.arrow_back),
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
      result += genre.name + ', ';
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
