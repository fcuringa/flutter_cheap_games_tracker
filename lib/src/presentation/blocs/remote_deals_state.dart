import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// BLOC state for [Deal] fetch
abstract class RemoteDealsState extends Equatable {
  final List<Deal> deals;
  final bool noMoreData;
  final DioError? error;

  const RemoteDealsState(this.deals, this.noMoreData, this.error);

  @override
  List<Object?> get props => [deals, noMoreData, error];
}

/// State for [Deals] fetching not being done yet
class RemoteDealsLoading extends RemoteDealsState {
  RemoteDealsLoading() : super(List.empty(), false, null);
}

/// State for [Deals] fetching being done
class RemoteDealsDone extends RemoteDealsState {
  RemoteDealsDone(List<Deal> deals, bool noMoreData)
      : super(deals, noMoreData, null);
}

/// State for [Deals] fetching having failed with some [DioError]
class RemoteDealsError extends RemoteDealsState {
  RemoteDealsError(DioError error): super(List.empty(), false, null);
}