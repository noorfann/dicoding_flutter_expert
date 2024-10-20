import 'package:ditonton/common/utils.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Future.microtask(
        () => context.read<WatchlistBloc>().add(OnGetWatchlistMovie()));
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
        context.read<WatchlistBloc>().add(OnGetWatchlistMovie());
        break;
      case WatchCategory.tvSeries:
        context.read<WatchlistBloc>().add(OnGetWatchlistTVSeries());
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

  Widget _movieTab() {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        if (state is GetWatchlistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetWatchlistMovieHasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = state.watchlistMovie[index];
              return MovieCard(movie);
            },
            itemCount: state.watchlistMovie.length,
          );
        } else if (state is GetWatchlistEmpty) {
          return Center(
            key: Key('empty_message'),
            child: Text(state.message),
          );
        } else if (state is GetWatchlistError) {
          return Center(
            key: Key('error_message'),
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _tvSeriesTab() {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        if (state is GetWatchlistLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetWatchlistTVSeriesHasData) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = state.watchlistTVSeries[index];
              return TVSeriesCard(movie);
            },
            itemCount: state.watchlistTVSeries.length,
          );
        } else if (state is GetWatchlistEmpty) {
          return Center(
            key: Key('empty_message'),
            child: Text(state.message),
          );
        } else if (state is GetWatchlistError) {
          return Center(
            key: Key('error_message'),
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox();
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
