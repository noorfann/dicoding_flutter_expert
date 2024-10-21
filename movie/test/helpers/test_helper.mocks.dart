// Mocks generated by Mockito 5.4.4 from annotations
// in movie/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:io' as _i5;

import 'package:core/common/watch_category_enum.dart' as _i14;
import 'package:core/core.dart' as _i7;
import 'package:core/data/datasources/db/database_helper.dart' as _i12;
import 'package:core/data/datasources/movie/movie_remote_data_source.dart'
    as _i10;
import 'package:core/data/datasources/watchlist_local_data_source.dart' as _i18;
import 'package:core/data/models/movie/movie_detail_model.dart' as _i3;
import 'package:core/data/models/movie/movie_model.dart' as _i11;
import 'package:core/data/models/watchlist_table.dart' as _i19;
import 'package:core/domain/entities/movie/movie.dart' as _i8;
import 'package:core/domain/entities/movie/movie_detail.dart' as _i9;
import 'package:core/domain/entities/tv_series/tv_series.dart' as _i17;
import 'package:core/domain/entities/tv_series/tv_series_detail.dart' as _i16;
import 'package:core/domain/repositories/movie_repository.dart' as _i4;
import 'package:core/domain/repositories/watchlist_repository.dart' as _i15;
import 'package:core/domain/usecases/movies/get_movie_detail.dart' as _i25;
import 'package:core/domain/usecases/movies/get_now_playing_movies.dart'
    as _i21;
import 'package:core/domain/usecases/movies/get_popular_movies.dart' as _i22;
import 'package:core/domain/usecases/movies/get_top_rated_movies.dart' as _i23;
import 'package:core/domain/usecases/movies/search_movies.dart' as _i24;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i20;
import 'package:sqflite/sqflite.dart' as _i13;

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

class _FakeMovieRepository_2 extends _i1.SmartFake
    implements _i4.MovieRepository {
  _FakeMovieRepository_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDuration_3 extends _i1.SmartFake implements Duration {
  _FakeDuration_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientRequest_4 extends _i1.SmartFake
    implements _i5.HttpClientRequest {
  _FakeHttpClientRequest_4(
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
class MockMovieRepository extends _i1.Mock implements _i4.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i10.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i11.MovieModel>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieModel>>.value(<_i11.MovieModel>[]),
      ) as _i6.Future<List<_i11.MovieModel>>);

  @override
  _i6.Future<List<_i11.MovieModel>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieModel>>.value(<_i11.MovieModel>[]),
      ) as _i6.Future<List<_i11.MovieModel>>);

  @override
  _i6.Future<List<_i11.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieModel>>.value(<_i11.MovieModel>[]),
      ) as _i6.Future<List<_i11.MovieModel>>);

  @override
  _i6.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i6.Future<_i3.MovieDetailResponse>.value(
            _FakeMovieDetailResponse_1(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.MovieDetailResponse>);

  @override
  _i6.Future<List<_i11.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieModel>>.value(<_i11.MovieModel>[]),
      ) as _i6.Future<List<_i11.MovieModel>>);

  @override
  _i6.Future<List<_i11.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue:
            _i6.Future<List<_i11.MovieModel>>.value(<_i11.MovieModel>[]),
      ) as _i6.Future<List<_i11.MovieModel>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i12.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i13.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i6.Future<_i13.Database?>.value(),
      ) as _i6.Future<_i13.Database?>);

  @override
  _i6.Future<int> insertWatchlist(Map<String, dynamic>? watchlist) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [watchlist],
        ),
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<int> removeWatchlist({
    required int? id,
    required _i14.WatchCategory? category,
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
        returnValue: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<Map<String, dynamic>?> getWatchlistById({
    required int? id,
    required _i14.WatchCategory? category,
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
        returnValue: _i6.Future<Map<String, dynamic>?>.value(),
      ) as _i6.Future<Map<String, dynamic>?>);

  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlist(
          _i14.WatchCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [category],
        ),
        returnValue: _i6.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [WatchlistRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistRepository extends _i1.Mock
    implements _i15.WatchlistRepository {
  MockWatchlistRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistMovie(
          _i9.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistMovie,
          [movie],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistMovie,
            [movie],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistTVSeries(
          _i16.TVSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlistTVSeries,
          [tvSeries],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlistTVSeries,
            [tvSeries],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlist(
    int? id,
    _i14.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [
            id,
            category,
          ],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, String>>.value(
            _FakeEither_0<_i7.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [
              id,
              category,
            ],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, String>>);

  @override
  _i6.Future<bool> isAddedToWatchlist(
    int? id,
    _i14.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [
            id,
            category,
          ],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i17.TVSeries>>>
      getWatchlistTVSeries() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTVSeries,
              [],
            ),
            returnValue:
                _i6.Future<_i2.Either<_i7.Failure, List<_i17.TVSeries>>>.value(
                    _FakeEither_0<_i7.Failure, List<_i17.TVSeries>>(
              this,
              Invocation.method(
                #getWatchlistTVSeries,
                [],
              ),
            )),
          ) as _i6.Future<_i2.Either<_i7.Failure, List<_i17.TVSeries>>>);
}

/// A class which mocks [WatchlistLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistLocalDataSource extends _i1.Mock
    implements _i18.WatchlistLocalDataSource {
  MockWatchlistLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlist(
    _i19.WatchlistTable? watchlis,
    _i14.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlist,
          [
            watchlis,
            category,
          ],
        ),
        returnValue: _i6.Future<String>.value(_i20.dummyValue<String>(
          this,
          Invocation.method(
            #insertWatchlist,
            [
              watchlis,
              category,
            ],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<String> removeWatchlist(
    int? id,
    _i14.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [
            id,
            category,
          ],
        ),
        returnValue: _i6.Future<String>.value(_i20.dummyValue<String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [
              id,
              category,
            ],
          ),
        )),
      ) as _i6.Future<String>);

  @override
  _i6.Future<_i19.WatchlistTable?> getWatchlistById(
    int? id,
    _i14.WatchCategory? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistById,
          [
            id,
            category,
          ],
        ),
        returnValue: _i6.Future<_i19.WatchlistTable?>.value(),
      ) as _i6.Future<_i19.WatchlistTable?>);

  @override
  _i6.Future<List<_i19.WatchlistTable>> getWatchlist(
          _i14.WatchCategory? category) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlist,
          [category],
        ),
        returnValue: _i6.Future<List<_i19.WatchlistTable>>.value(
            <_i19.WatchlistTable>[]),
      ) as _i6.Future<List<_i19.WatchlistTable>>);
}

/// A class which mocks [GetNowPlayingMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingMovies extends _i1.Mock
    implements _i21.GetNowPlayingMovies {
  MockGetNowPlayingMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [GetPopularMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularMovies extends _i1.Mock implements _i22.GetPopularMovies {
  MockGetPopularMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [GetTopRatedMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedMovies extends _i1.Mock implements _i23.GetTopRatedMovies {
  MockGetTopRatedMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [SearchMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchMovies extends _i1.Mock implements _i24.SearchMovies {
  MockSearchMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>> execute(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [query],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>.value(
            _FakeEither_0<_i7.Failure, List<_i8.Movie>>(
          this,
          Invocation.method(
            #execute,
            [query],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.Movie>>>);
}

/// A class which mocks [GetMovieDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieDetail extends _i1.Mock implements _i25.GetMovieDetail {
  MockGetMovieDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.MovieRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeMovieRepository_2(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i4.MovieRepository);

  @override
  _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>.value(
            _FakeEither_0<_i7.Failure, _i9.MovieDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i9.MovieDetail>>);
}

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i5.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get idleTimeout => (super.noSuchMethod(
        Invocation.getter(#idleTimeout),
        returnValue: _FakeDuration_3(
          this,
          Invocation.getter(#idleTimeout),
        ),
      ) as Duration);

  @override
  set idleTimeout(Duration? _idleTimeout) => super.noSuchMethod(
        Invocation.setter(
          #idleTimeout,
          _idleTimeout,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set connectionTimeout(Duration? _connectionTimeout) => super.noSuchMethod(
        Invocation.setter(
          #connectionTimeout,
          _connectionTimeout,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set maxConnectionsPerHost(int? _maxConnectionsPerHost) => super.noSuchMethod(
        Invocation.setter(
          #maxConnectionsPerHost,
          _maxConnectionsPerHost,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get autoUncompress => (super.noSuchMethod(
        Invocation.getter(#autoUncompress),
        returnValue: false,
      ) as bool);

  @override
  set autoUncompress(bool? _autoUncompress) => super.noSuchMethod(
        Invocation.setter(
          #autoUncompress,
          _autoUncompress,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set userAgent(String? _userAgent) => super.noSuchMethod(
        Invocation.setter(
          #userAgent,
          _userAgent,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set authenticate(
          _i6.Future<bool> Function(
            Uri,
            String,
            String?,
          )? f) =>
      super.noSuchMethod(
        Invocation.setter(
          #authenticate,
          f,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set connectionFactory(
          _i6.Future<_i5.ConnectionTask<_i5.Socket>> Function(
            Uri,
            String?,
            int?,
          )? f) =>
      super.noSuchMethod(
        Invocation.setter(
          #connectionFactory,
          f,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set findProxy(String Function(Uri)? f) => super.noSuchMethod(
        Invocation.setter(
          #findProxy,
          f,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set authenticateProxy(
          _i6.Future<bool> Function(
            String,
            int,
            String,
            String?,
          )? f) =>
      super.noSuchMethod(
        Invocation.setter(
          #authenticateProxy,
          f,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set badCertificateCallback(
          bool Function(
            _i5.X509Certificate,
            String,
            int,
          )? callback) =>
      super.noSuchMethod(
        Invocation.setter(
          #badCertificateCallback,
          callback,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set keyLog(dynamic Function(String)? callback) => super.noSuchMethod(
        Invocation.setter(
          #keyLog,
          callback,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i5.HttpClientRequest> open(
    String? method,
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #open,
          [
            method,
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #open,
            [
              method,
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> openUrl(
    String? method,
    Uri? url,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #openUrl,
          [
            method,
            url,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #openUrl,
            [
              method,
              url,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> get(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #get,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> getUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #getUrl,
          [url],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #getUrl,
            [url],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> post(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #post,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> postUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #postUrl,
          [url],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #postUrl,
            [url],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> put(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #put,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> putUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #putUrl,
          [url],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #putUrl,
            [url],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> delete(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #delete,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> deleteUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #deleteUrl,
          [url],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #deleteUrl,
            [url],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> patch(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #patch,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> patchUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #patchUrl,
          [url],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #patchUrl,
            [url],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> head(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #head,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  _i6.Future<_i5.HttpClientRequest> headUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #headUrl,
          [url],
        ),
        returnValue:
            _i6.Future<_i5.HttpClientRequest>.value(_FakeHttpClientRequest_4(
          this,
          Invocation.method(
            #headUrl,
            [url],
          ),
        )),
      ) as _i6.Future<_i5.HttpClientRequest>);

  @override
  void addCredentials(
    Uri? url,
    String? realm,
    _i5.HttpClientCredentials? credentials,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addCredentials,
          [
            url,
            realm,
            credentials,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addProxyCredentials(
    String? host,
    int? port,
    String? realm,
    _i5.HttpClientCredentials? credentials,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addProxyCredentials,
          [
            host,
            port,
            realm,
            credentials,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void close({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );
}
