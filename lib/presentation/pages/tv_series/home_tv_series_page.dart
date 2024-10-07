import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/airing_today_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/popular_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/top_rated_tv_series_page.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_list_notifier.dart';
import 'package:ditonton/presentation/widgets/sub_heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Consumer<TVSeriesListNotifier>(builder: (context, data, child) {
              final state = data.nowPlayingState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return TVSeriesList(data.nowPlayingTVSeries);
              } else {
                return Text('Failed');
              }
            }),
            SubHeading(
              title: 'Popular',
              onTap: () =>
                  Navigator.pushNamed(context, PopularTvSeriesPage.ROUTE_NAME),
            ),
            Consumer<TVSeriesListNotifier>(builder: (context, data, child) {
              final state = data.popularTVSeriesState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return TVSeriesList(data.popularTVSeries);
              } else {
                return Text('Failed');
              }
            }),
            SubHeading(
              title: 'Top Rated',
              onTap: () =>
                  Navigator.pushNamed(context, TopRatedTvSeriesPage.ROUTE_NAME),
            ),
            Consumer<TVSeriesListNotifier>(builder: (context, data, child) {
              final state = data.topRatedTVSeriesState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return TVSeriesList(data.topRatedTVSeries);
              } else {
                return Text('Failed');
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
    return Container(
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
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${data.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
