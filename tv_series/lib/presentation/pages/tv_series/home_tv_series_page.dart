import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:tv_series/presentation/bloc/now_playing_tv_series_bloc/now_playing_tv_series_bloc.dart';
import 'package:tv_series/presentation/bloc/popular_tv_series_bloc/popular_tv_series_bloc.dart';
import 'package:tv_series/presentation/bloc/top_rated_tv_series_bloc/top_rated_tv_series_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/pages/tv_series/airing_today_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:tv_series/presentation/pages/widgets/sub_heading.dart';

class HomeTvSeriesPage extends StatelessWidget {
  const HomeTvSeriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              title: 'Now Playing',
              onTap: () => Navigator.pushNamed(
                  context, AiringTodayTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<NowPlayingTVSeriesBloc, NowPlayingTVSeriesState>(
                builder: (context, state) {
              if (state is GetNowPlayingTVSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetNowPlayingTVSeriesHasData) {
                return TVSeriesList(state.result);
              } else {
                return const Text('Failed');
              }
            }),
            SubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<PopularTVSeriesBloc, PopularTVSeriesState>(
                builder: (context, state) {
              if (state is GetPopularTVSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetPopularTVSeriesHasData) {
                return TVSeriesList(state.result);
              } else {
                return const Text('Failed');
              }
            }),
            SubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedTvSeriesPage.ROUTE_NAME),
            ),
            BlocBuilder<TopRatedTVSeriesBloc, TopRatedTVSeriesState>(
                builder: (context, state) {
              if (state is GetTopRatedTVSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetTopRatedTVSeriesHasData) {
                return TVSeriesList(state.result);
              } else {
                return const Text('Failed');
              }
            }),
          ],
        ),
      ),
    );
  }
}

class TVSeriesList extends StatelessWidget {
  final List<TVSeries> tvSeries;

  TVSeriesList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: data.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${data.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
