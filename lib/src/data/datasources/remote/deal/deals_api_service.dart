import 'package:cheap_games/src/core/utils/constants.dart';
import 'package:cheap_games/src/data/models/deal_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'deals_api_service.g.dart';

@RestApi(baseUrl: kApiBaseUrl)
abstract class DealsApiService {
  factory DealsApiService(Dio dio) = _DealsApiService;

  @GET('/deals')
  Future<HttpResponse<List<DealModel>>> getDeals(@Query("pageNumber") int page);
}
