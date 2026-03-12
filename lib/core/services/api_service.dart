import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class ApiService {
  static final Dio _dio = Dio();
  static final ApiService _apiServices = ApiService._();
  static final _baseURL = "https://jsonplaceholder.typicode.com";

  ApiService._();

  factory ApiService() {
    init();
    return _apiServices;
  }

  static void init() {
    _dio.options.baseUrl = _baseURL;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<Either<String, Response>> getData(String endPoint) async {
    try {
      final Response response = await _dio.get(endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response);
      } else {
        return Left(response.statusMessage ?? "Something went wrong");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
