import 'package:dio/dio.dart';

class ApiService {
  String baseUrl = 'https://the-vegan-recipes-db.p.rapidapi.com/';

  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get() async {
    var response = await _dio.get(
      baseUrl,
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '7701ce5370mshd182d531b7ff0b8p1f2791jsn9fe389c57f43',
          'X-RapidAPI-Host': 'the-vegan-recipes-db.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }
}
