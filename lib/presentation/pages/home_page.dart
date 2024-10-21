import 'package:about/about.dart';
import 'package:core/common/watch_category_enum.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:tv_series/presentation/bloc/now_playing_tv_series_bloc/now_playing_tv_series_bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tv_series_bloc/popular_tv_series_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv_series_bloc/top_rated_tv_series_bloc.dart';
import 'package:movie/presentation/bloc/now_playing_movies_bloc/now_playing_movies_bloc.dart';
import 'package:movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movie/presentation/bloc/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:movie/presentation/pages/movie/home_movie_page.dart';
import 'package:movie/presentation/pages/movie/search_movie_page.dart';
import 'package:tv_series/presentation/pages/tv_series/home_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series/search_tv_series_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WatchCategory _watchCategory = WatchCategory.movie;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NowPlayingMoviesBloc>().add(OnGetNowPlayingMovies());
      context.read<PopularMoviesBloc>().add(OnGetPopularMovies());
      context.read<TopRatedMoviesBloc>().add(OnGetTopRatedMovies());
    });
  }

  _fetchData() {
    switch (_watchCategory) {
      case WatchCategory.movie:
        context.read<NowPlayingMoviesBloc>().add(OnGetNowPlayingMovies());
        context.read<PopularMoviesBloc>().add(OnGetPopularMovies());
        context.read<TopRatedMoviesBloc>().add(OnGetTopRatedMovies());
        break;
      case WatchCategory.tvSeries:
        context.read<NowPlayingTVSeriesBloc>().add(OnGetNowPlayingTVSeries());
        context.read<PopularTVSeriesBloc>().add(OnGetPopularTVSeries());
        context.read<TopRatedTVSeriesBloc>().add(OnGetTopRatedTVSeries());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
                backgroundColor: Colors.grey.shade900,
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
              ),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                onCategoryChanged(context, WatchCategory.movie);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('TV Series'),
              onTap: () {
                onCategoryChanged(context, WatchCategory.tvSeries);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              if (_watchCategory == WatchCategory.movie) {
                Navigator.pushNamed(context, SearchMoviePage.ROUTE_NAME);
              } else {
                Navigator.pushNamed(context, SearchTvSeriesPage.ROUTE_NAME);
              }
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: (_watchCategory == WatchCategory.movie)
          ? HomeMoviePage()
          : HomeTvSeriesPage(),
    );
  }

  void onCategoryChanged(BuildContext context, WatchCategory category) {
    setState(() {
      // not fetching data is category still the same
      if (_watchCategory == category) {
        return;
      }

      _watchCategory = category;
    });
    Navigator.pop(context);
    // fetch data
    _fetchData();
  }
}
