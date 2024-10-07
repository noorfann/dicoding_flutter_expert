// Mocks generated by Mockito 5.4.4 from annotations
// in ditonton/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:convert' as _i29;
import 'dart:typed_data' as _i30;

import 'package:core/core.dart' as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:ditonton/common/watch_category_enum.dart' as _i15;
import 'package:ditonton/data/datasources/db/database_helper.dart' as _i13;
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart'
    as _i11;
import 'package:ditonton/data/datasources/tv_series/tv_series_remote_data_source.dart'
    as _i19;
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart'
    as _i22;
import 'package:ditonton/data/models/movie/movie_detail_model.dart' as _i3;
import 'package:ditonton/data/models/movie/movie_model.dart' as _i12;
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart'
    as _i4;
import 'package:ditonton/data/models/tv_series/tv_series_model.dart' as _i20;
import 'package:ditonton/data/models/watchlist_table.dart' as _i23;
import 'package:ditonton/domain/entities/movie/movie.dart' as _i9;
import 'package:ditonton/domain/entities/movie/movie_detail.dart' as _i10;
import 'package:ditonton/domain/entities/tv_series/tv_series.dart' as _i17;
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart'
    as _i18;
import 'package:ditonton/domain/repositories/movie_repository.dart' as _i5;
import 'package:ditonton/domain/repositories/tv_series_repository.dart' as _i16;
import 'package:ditonton/domain/repositories/watchlist_repository.dart' as _i21;
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart'
    as _i25;
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart'
    as _i26;
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart'
    as _i27;
import 'package:ditonton/domain/usecases/movies/search_movies.dart' as _i28;
import 'package:http/http.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i24;
import 'package:sqflite/sqflite.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailResponse_1 extends _i1.SmartFake
    implements _i3.MovieDetailResponse {
  _FakeMovieDetailResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetailResponse_2 extends _i1.SmartFake
    implements _i4.TvSeriesDetailResponse {
  _FakeTvSeriesDetailResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieRepository_3 extends _i1.SmartFake
    implements _i5.MovieRepository {
  _FakeMovieRepository_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_4 extends _i1.SmartFake implements _i6.Response {
  _FakeResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_5 extends _i1.SmartFake
    implements _i6.StreamedResponse {
  _FakeStreamedResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i5.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>.value(
                _FakeEither_0<_i8.Failure, _i10.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i10.MovieDetail>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i11.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i12.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]),
      ) as _i7.Future<List<_i12.MovieModel>>);

  @override
  _i7.Future<List<_i12.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]),
      ) as _i7.Future<List<_i12.MovieModel>>);

  @override
  _i7.Future<List<_i12.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i7.Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]),
      ) as _i7.Future<List<_i12.MovieModel>>);

  @override
  _i7.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i7.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i3.MovieDetailResponse>);

  @override
  _i7.Future<List<_i12.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i7.Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]),
      ) as _i7.Future<List<_i12.MovieModel>>);

  @override
  _i7.Future<List<_i12.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i7.Future<List<_i12.MovieModel>>.value(<_i12.MovieModel>[]),
      ) as _i7.Future<List<_i12.MovieModel>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i13.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i14.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i7.Future<_i14.Database?>.value(),
      ) as _i7.Future<_i14.Database?>);

  @override
  _i7.Future<int> insertWatchlist(Map<String, dynamic>? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlist],
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<int> removeWatchlist({
    required int? id,
    required _i15.WatchCategory? category,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [],
          {
            #id: id,
            #category: category,
          },
        ),
        returnValue: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  _i7.Future<Map<String, dynamic>?> getWatchlistById({
    required int? id,
    required _i15.WatchCategory? category,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [],
          {
            #id: id,
            #category: category,
          },
        ),
        returnValue: _i7.Future<Map<String, dynamic>?>.value(),
      ) as _i7.Future<Map<String, dynamic>?>);

  @override
  _i7.Future<List<Map<String, dynamic>>> getWatchlist(
          _i15.WatchCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [category],
        ),
        returnValue: _i7.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i7.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [TVSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesRepository extends _i1.Mock
    implements _i16.TVSeriesRepository {
  MockTVSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>
      getAiringTodayTVSeries() => (super.noSuchMethod(
            Invocation.method(
              #getAiringTodayTVSeries,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i17.TVSeries>>(
              this,
              Invocation.method(
                #getAiringTodayTVSeries,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>
      getPopularTVSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTVSeries,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i17.TVSeries>>(
              this,
              Invocation.method(
                #getPopularTVSeries,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>
      getTopRatedTVSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTVSeries,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i17.TVSeries>>(
              this,
              Invocation.method(
                #getTopRatedTVSeries,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, _i18.TVSeriesDetail>> getTVSeriesDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesDetail,
          [id],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, _i18.TVSeriesDetail>>.value(
                _FakeEither_0<_i8.Failure, _i18.TVSeriesDetail>(
          this,
          Invocation.method(
            #getTVSeriesDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, _i18.TVSeriesDetail>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>
      getTVSeriesRecommendations(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getTVSeriesRecommendations,
              [id],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i17.TVSeries>>(
              this,
              Invocation.method(
                #getTVSeriesRecommendations,
                [id],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTVSeries,
          [query],
        ),
        returnValue:
            _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>.value(
                _FakeEither_0<_i8.Failure, List<_i17.TVSeries>>(
          this,
          Invocation.method(
            #searchTVSeries,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>);
}

/// A class which mocks [TVSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesRemoteDataSource extends _i1.Mock
    implements _i19.TVSeriesRemoteDataSource {
  MockTVSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<List<_i20.TVSeriesModel>> getAiringTodayTVSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAiringTodayTVSeries,
          [],
        ),
        returnValue:
            _i7.Future<List<_i20.TVSeriesModel>>.value(<_i20.TVSeriesModel>[]),
      ) as _i7.Future<List<_i20.TVSeriesModel>>);

  @override
  _i7.Future<List<_i20.TVSeriesModel>> getPopularTVSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularTVSeries,
          [],
        ),
        returnValue:
            _i7.Future<List<_i20.TVSeriesModel>>.value(<_i20.TVSeriesModel>[]),
      ) as _i7.Future<List<_i20.TVSeriesModel>>);

  @override
  _i7.Future<List<_i20.TVSeriesModel>> getTopRatedTVSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedTVSeries,
          [],
        ),
        returnValue:
            _i7.Future<List<_i20.TVSeriesModel>>.value(<_i20.TVSeriesModel>[]),
      ) as _i7.Future<List<_i20.TVSeriesModel>>);

  @override
  _i7.Future<_i4.TvSeriesDetailResponse> getTVSeriesDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesDetail,
          [id],
        ),
        returnValue: _i7.Future<_i4.TvSeriesDetailResponse>.value(
            _FakeTvSeriesDetailResponse_2(
          this,
          Invocation.method(
            #getTVSeriesDetail,
            [id],
          ),
        )),
      ) as _i7.Future<_i4.TvSeriesDetailResponse>);

  @override
  _i7.Future<List<_i20.TVSeriesModel>> getTVSeriesRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTVSeriesRecommendations,
          [id],
        ),
        returnValue:
            _i7.Future<List<_i20.TVSeriesModel>>.value(<_i20.TVSeriesModel>[]),
      ) as _i7.Future<List<_i20.TVSeriesModel>>);

  @override
  _i7.Future<List<_i20.TVSeriesModel>> searchTVSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTVSeries,
          [query],
        ),
        returnValue:
            _i7.Future<List<_i20.TVSeriesModel>>.value(<_i20.TVSeriesModel>[]),
      ) as _i7.Future<List<_i20.TVSeriesModel>>);
}

/// A class which mocks [WatchlistRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistRepository extends _i1.Mock
    implements _i21.WatchlistRepository {
  MockWatchlistRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlistMovie(
          _i10.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistMovie,
          [movie],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistMovie,
            [movie],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> saveWatchlistTVSeries(
          _i18.TVSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTVSeries,
          [tvSeries],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTVSeries,
            [tvSeries],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, String>> removeWatchlist(
    int? id,
    _i15.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [
            id,
            category,
          ],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, String>>.value(
            _FakeEither_0<_i8.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [
              id,
              category,
            ],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, String>>);

  @override
  _i7.Future<bool> isAddedToWatchlist(
    int? id,
    _i15.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [
            id,
            category,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>
      getWatchlistTVSeries() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTVSeries,
              [],
            ),
            returnValue:
                _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>.value(
                    _FakeEither_0<_i8.Failure, List<_i17.TVSeries>>(
              this,
              Invocation.method(
                #getWatchlistTVSeries,
                [],
              ),
            )),
          ) as _i7.Future<_i2.Either<_i8.Failure, List<_i17.TVSeries>>>);
}

/// A class which mocks [WatchlistLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistLocalDataSource extends _i1.Mock
    implements _i22.WatchlistLocalDataSource {
  MockWatchlistLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<String> insertWatchlist(
    _i23.WatchlistTable? watchlis,
    _i15.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [
            watchlis,
            category,
          ],
        ),
        returnValue: _i7.Future<String>.value(_i24.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchlist,
            [
              watchlis,
              category,
            ],
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<String> removeWatchlist(
    int? id,
    _i15.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [
            id,
            category,
          ],
        ),
        returnValue: _i7.Future<String>.value(_i24.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [
              id,
              category,
            ],
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<_i23.WatchlistTable?> getWatchlistById(
    int? id,
    _i15.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [
            id,
            category,
          ],
        ),
        returnValue: _i7.Future<_i23.WatchlistTable?>.value(),
      ) as _i7.Future<_i23.WatchlistTable?>);

  @override
  _i7.Future<List<_i23.WatchlistTable>> getWatchlist(
          _i15.WatchCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [category],
        ),
        returnValue: _i7.Future<List<_i23.WatchlistTable>>.value(
            <_i23.WatchlistTable>[]),
      ) as _i7.Future<List<_i23.WatchlistTable>>);
}

/// A class which mocks [GetNowPlayingMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingMovies extends _i1.Mock
    implements _i25.GetNowPlayingMovies {
  MockGetNowPlayingMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.MovieRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [GetPopularMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularMovies extends _i1.Mock implements _i26.GetPopularMovies {
  MockGetPopularMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.MovieRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [GetTopRatedMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedMovies extends _i1.Mock implements _i27.GetTopRatedMovies {
  MockGetTopRatedMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.MovieRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [SearchMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchMovies extends _i1.Mock implements _i28.SearchMovies {
  MockSearchMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_3(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i5.MovieRepository);

  @override
  _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>.value(
            _FakeEither_0<_i8.Failure, List<_i9.Movie>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i7.Future<_i2.Either<_i8.Failure, List<_i9.Movie>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i6.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i6.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<_i6.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i29.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i7.Future<_i6.Response>.value(_FakeResponse_4(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i7.Future<_i6.Response>);

  @override
  _i7.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<String>.value(_i24.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i7.Future<String>);

  @override
  _i7.Future<_i30.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i7.Future<_i30.Uint8List>.value(_i30.Uint8List(0)),
      ) as _i7.Future<_i30.Uint8List>);

  @override
  _i7.Future<_i6.StreamedResponse> send(_i6.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i7.Future<_i6.StreamedResponse>.value(_FakeStreamedResponse_5(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i7.Future<_i6.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
