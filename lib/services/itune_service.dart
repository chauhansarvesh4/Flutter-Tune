import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertune/bloc/itune_bloc.dart';
import 'package:fluttertune/constants/app_constant.dart';
import 'package:fluttertune/models/itune_resposne.dart';

import 'network.dart';

class ItuneService {
  MyNetwork _myNetwork;
  ItuneBloc _ituneBloc;

  ItuneService(ItuneBloc ituneBloc) {
    _ituneBloc = ituneBloc;
    _myNetwork = MyNetwork();
  }

  void getItuneResponse() async {
    ItuneResponse ituneResponse;
    try {
      Response response = await _myNetwork.dio.get(AppConstant.tuneUrl);
      if (response.statusCode == 200) {
        ItuneModel ituneModel = ItuneModel.fromJson(response.data);
        ituneResponse =
            ItuneResponse(response.statusCode, ituneModel, 'Successful');
        _ituneBloc.add(ituneResponse);
      } else {
        ituneResponse = ItuneResponse(response.statusCode, null, 'Failed');
        _ituneBloc.add(ituneResponse);
      }
    } catch (e) {
      ituneResponse = ItuneResponse(0, null, e.toString());
      _ituneBloc.add(ituneResponse);
    }
  }
}
