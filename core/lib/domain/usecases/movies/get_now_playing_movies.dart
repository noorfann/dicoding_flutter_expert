import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovies();
  }
}
