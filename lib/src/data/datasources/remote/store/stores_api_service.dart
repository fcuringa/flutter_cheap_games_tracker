import 'package:cheap_games/src/core/utils/constants.dart';
import 'package:cheap_games/src/data/models/store_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'stores_api_service.g.dart';

@RestApi(baseUrl: kApiBaseUrl)
abstract class StoresApiService {
  factory StoresApiService(Dio dio) = _StoresApiService;
  
  @GET("/stores")
  Future<HttpResponse<List<StoreModel>>> getStores();
}