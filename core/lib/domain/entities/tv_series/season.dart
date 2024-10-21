import 'package:equatable/equatable.dart';

class Season extends Equatable {
  Season({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeCount,
    required this.seasonNumber,
    required this.voteAverage,
    required this.posterPath,
  });

  final int id;
  final String airDate;
  final String name;
  final int episodeCount;
  final int seasonNumber;
  final double voteAverage;
  final String posterPath;

  @override
  List<Object> get props =>
      [id, name, airDate, episodeCount, seasonNumber, voteAverage, posterPath];
}
