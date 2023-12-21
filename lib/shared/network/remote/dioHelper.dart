import 'package:dio/dio.dart';
import 'package:news/shared/components/constants.dart';

class dioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: serverApi,
        receiveDataWhenStatusError: true,
      ),
    );
    print("init");
  }

  static Future<Response<dynamic>> getData({
    required String url,
    required Map<String, dynamic> queryParameter,
  }) async {
    return await dio!.get(
      url,
      queryParameters: queryParameter,
    );
  }
}
