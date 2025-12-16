import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  //** */ =>> This class is implemented using the Singleton Pattern <<= ** //

  DioFactory._(); // => Private Constructor
  //no object
  static Dio? dio;
  static Dio getDio() {
    Duration timeout = const Duration(seconds: 3);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout =
            timeout // => .. => Cascade Operator
        ..options.receiveTimeout = timeout;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
