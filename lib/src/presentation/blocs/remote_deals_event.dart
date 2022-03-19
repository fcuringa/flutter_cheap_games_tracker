import 'package:equatable/equatable.dart';

/// Generic event for remote [Deal]s
abstract class RemoteDealsEvent extends Equatable {
  const RemoteDealsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to get remote [Deal]s
class GetDeals extends RemoteDealsEvent {
  const GetDeals();
}