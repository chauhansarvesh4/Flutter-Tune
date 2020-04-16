import 'dart:async';

import 'package:fluttertune/models/itune_resposne.dart';

class ItuneBloc {
  ItuneResponse _ituneResponse = ItuneResponse(0, null, 'started');

  final _ituneStreamController = StreamController<ItuneResponse>.broadcast();

  Stream<ItuneResponse> get ituneStream => _ituneStreamController.stream;

  ItuneBloc() {
    _ituneStreamController.add(_ituneResponse);
  }

  void add(ItuneResponse ituneResponse) {
    if (!_ituneStreamController.isClosed) {
      _ituneStreamController.sink.add(ituneResponse);
    }
  }

  void dispose() {
    _ituneStreamController.close();
  }
}
