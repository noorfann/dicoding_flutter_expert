import 'package:core/core.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  WatchCategory _watchCategory = WatchCategory.movie;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistNotifier>(context, listen: false)
            .fetchWatchlistMovies());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    _fetchData();
  }

  _fetchData() {
    switch (_watchCategory) {
      case WatchCategory.movie:
        Provider.of<WatchlistNotifier>(context, listen: false)
            .fetchWatchlistMovies();
        break;
      case WatchCategory.tvSeries:
        Provider.of<WatchlistNotifier>(context, listen: false)
            .fetchWatchlistTVSeries();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
          bottom: TabBar(
            onTap: (index) {
              if (index == 0) {
                _watchCategory = WatchCategory.movie;
              } else {
                _watchCategory = WatchCategory.tvSeries;
              }

              _fetchData();
            },
            tabs: [
              Tab(
                text: 'Movie',
              ),
              Tab(
                text: 'TVSeries',
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: TabBarView(children: [
            _movieTab(),
            _tvSeriesTab(),
          ]),
        ),
      ),
    );
  }

  Consumer<WatchlistNotifier> _movieTab() {
    return Consumer<WatchlistNotifier>(
      builder: (context, data, child) {
        if (data.watchlistMovieState == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.watchlistMovieState == RequestState.Loaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = data.watchlistMovies[index];
              return MovieCard(movie);
            },
            itemCount: data.watchlistMovies.length,
          );
        } else if (data.watchlistMovieState == RequestState.Empty) {
          return Center(
            key: Key('empty_message'),
            child: Text(data.messageMovie),
          );
        } else {
          return Center(
            key: Key('error_message'),
            child: Text(data.messageMovie),
          );
        }
      },
    );
  }

  Consumer<WatchlistNotifier> _tvSeriesTab() {
    return Consumer<WatchlistNotifier>(
      builder: (context, data, child) {
        if (data.watchlistTvSeriesState == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.watchlistTvSeriesState == RequestState.Loaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final tvSeries = data.watchlistTvSeries[index];
              return TVSeriesCard(tvSeries);
            },
            itemCount: data.watchlistTvSeries.length,
          );
        } else if (data.watchlistTvSeriesState == RequestState.Empty) {
          return Center(
            key: Key('empty_message'),
            child: Text(data.messageTvSeries),
          );
        } else {
          return Center(
            key: Key('error_message'),
            child: Text(data.messageTvSeries),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
