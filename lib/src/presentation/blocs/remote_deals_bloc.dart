import 'package:cheap_games/src/core/bloc/bloc_with_state.dart';
import 'package:cheap_games/src/core/datastate/data_state.dart';
import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:cheap_games/src/domain/usecases/deal/get_deals_use_case.dart';
import 'package:cheap_games/src/presentation/blocs/remote_deals_event.dart';
import 'package:cheap_games/src/presentation/blocs/remote_deals_state.dart';


class RemoteDealsBloc extends BlocWithState<RemoteDealsEvent, RemoteDealsState> {
  final GetDealsUseCase _getDealsUseCase;
  RemoteDealsBloc(this._getDealsUseCase): super(RemoteDealsLoading()){
    on<GetDeals>((event, emit) async {
      var state = await _getDeals2();
      emit(state);
    });
  }

  final List<Deal> _deals = [];
  int _pageNumber = 1;
  static const int _pageSize = 60;


  Future<RemoteDealsState> _getDeals2() async {
    var dataState = await _getDealsUseCase(_pageNumber);

    if (dataState is DataSuccess && (dataState.data ?? []).isNotEmpty) {
      // We know data is not null
      List<Deal> deals = dataState.data!;

      // Print for logging
      print("Got deals: ${deals.map((e) => e.title)}");

      var noMoreData = deals.length < _pageSize;
      _deals.addAll(deals);
      print("Total: ${_deals.length} deals found");
      _pageNumber++;

      return RemoteDealsDone(_deals.reversed.toList(), noMoreData);
    } else if (dataState is DataFailed) {
      // TODO error nullable?
      return RemoteDealsError(dataState.error!);
    }

    return RemoteDealsDone([], true);
  }
}