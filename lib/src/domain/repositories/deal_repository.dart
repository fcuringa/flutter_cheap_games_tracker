import 'package:cheap_games/src/core/datastate/data_state.dart';
import 'package:cheap_games/src/domain/entities/deal/deal.dart';

abstract class DealRepository {
  Future<DataState<List<Deal>>> getDeals({int page = 1});
}