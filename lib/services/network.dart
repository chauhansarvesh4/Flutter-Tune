import 'package:dio/dio.dart';
import 'package:fluttertune/constants/app_constant.dart';

class MyNetwork {
  Dio dio;
  static final MyNetwork _myNetwork = MyNetwork._internal();

  factory MyNetwork() {
    return _myNetwork;
  }

  MyNetwork._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: AppConstant.baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 8000,
    );
    dio = Dio(options);
  }
}
