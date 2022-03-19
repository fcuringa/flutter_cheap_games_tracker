import 'package:cheap_games/src/core/datastate/data_state.dart';
import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:cheap_games/src/domain/repositories/deal_repository.dart';

/// Use case to get available [Deal]s in a [DealRepository]
class GetDealsUseCase {
  final DealRepository _dealRepository;

  GetDealsUseCase(this._dealRepository);

  /// get available [Deal]s
  Future<DataState<List<Deal>>> call(int page) {
    return _dealRepository.getDeals(page: page);
  }
}