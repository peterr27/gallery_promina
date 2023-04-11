import 'package:dio/dio.dart';

abstract class AppApiDataServices {
  Future get({required String endpoint});
  Future post({required dynamic payload, required String endPoint, Options? options});
}

class ApiServices implements AppApiDataServices {
  final String _baseUrl = 'https://technichal.prominaagency.com/api';
  final Dio dio;
  ApiServices(this.dio);

  @override
  Future get({required String endpoint, Options? options}) async {
    final response = await dio.get('$_baseUrl/$endpoint', options: options);
    return response.data;
  }

  @override
  Future post({required dynamic payload, required String endPoint, Options? options}) async {
    final response = await dio.post('$_baseUrl/$endPoint', data: payload, options: options);
    return response;
  }
}
