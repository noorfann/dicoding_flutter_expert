import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_bloc/now_playing_tv_series_bloc.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiringTodayTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/airing-today-tv-series';

  @override
  _AiringTodayTvSeriesPageState createState() =>
      _AiringTodayTvSeriesPageState();
}

class _AiringTodayTvSeriesPageState extends State<AiringTodayTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<NowPlayingTVSeriesBloc>().add(OnGetNowPlayingTVSeries()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NowPlayingTVSeriesBloc, NowPlayingTVSeriesState>(
          builder: (context, state) {
            if (state is GetNowPlayingTVSeriesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetNowPlayingTVSeriesHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.result[index];
                  return TVSeriesCard(tvSeries);
                },
                itemCount: state.result.length,
              );
            } else if (state is GetNowPlayingTVSeriesError) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
