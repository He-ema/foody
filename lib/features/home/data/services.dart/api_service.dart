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
              '229abfe9cbmsh5d68b54532908eap192ab2jsnd73d04c64082',
          'X-RapidAPI-Host': 'the-vegan-recipes-db.p.rapidapi.com'
        },
      ),
    );
    return response.data;
  }
}
