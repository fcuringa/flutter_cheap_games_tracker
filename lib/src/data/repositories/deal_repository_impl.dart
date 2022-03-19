import 'dart:io';

import 'package:cheap_games/src/core/datastate/data_state.dart';
import 'package:cheap_games/src/data/datasources/remote/deal/deals_api_service.dart';
import 'package:cheap_games/src/data/datasources/remote/store/stores_api_service.dart';
import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:cheap_games/src/domain/entities/store/store.dart';
import 'package:cheap_games/src/domain/repositories/deal_repository.dart';
import 'package:dio/dio.dart';

/// Implementation of a [DealRepository]
class DealRepositoryImpl implements DealRepository {
  final DealsApiService _dealsApiService;
  final StoresApiService _storesApiService;

  const DealRepositoryImpl(this._dealsApiService, this._storesApiService);

  @override
  Future<DataState<List<Deal>>> getDeals({int page = 1}) async {
    try {
      final httpResponseStores = await _storesApiService.getStores();
      final httpResponseDeals = await _dealsApiService.getDeals(page);

      if (httpResponseStores.response.statusCode == HttpStatus.ok) {
        var storeList = httpResponseStores.data.map(
                (e) => Store(e.storeID, e.storeName, e.isActive == 1));
        if (httpResponseDeals.response.statusCode == HttpStatus.ok) {
          return DataSuccess(httpResponseDeals.data.map(
                  (e) =>
                  Deal(
                      e.internalName,
                      e.title,
                      e.metacriticLink,
                      e.dealID,
                      storeList.firstWhere((element) =>
                      element.storeID == e.storeID),
                      e.gameID,
                      double.parse(e.salePrice),
                      double.parse(e.normalPrice),
                      e.isOnSale == "1",
                      double.parse(e.savings),
                      int.parse(e.metacriticScore))).toList()
          );
        } else {
          return DataFailed(DioError(
            error: httpResponseDeals.response.statusMessage,
            response: httpResponseDeals.response,
            requestOptions: httpResponseDeals.response.requestOptions
          ));
        }
      } else {
        return DataFailed(DioError(
            error: httpResponseStores.response.statusMessage,
            response: httpResponseStores.response,
            requestOptions: httpResponseStores.response.requestOptions
        ));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

}