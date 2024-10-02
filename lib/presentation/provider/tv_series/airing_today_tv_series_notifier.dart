import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:flutter/foundation.dart';

class AiringTodayTVSeriesNotifier extends ChangeNotifier {
  final GetAiringTodayTVSeries getAiringTodayTVSeries;

  AiringTodayTVSeriesNotifier(this.getAiringTodayTVSeries);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TVSeries> _tvSeries = [];
  List<TVSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchAiringTodayTVSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTodayTVSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvSeries = tvSeriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
