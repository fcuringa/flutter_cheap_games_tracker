import 'package:cheap_games/src/domain/entities/store/store.dart';
import 'package:equatable/equatable.dart';

/// A deal on a game in a [Store]
class Deal extends Equatable {
  final String internalName;
  final String title;
  final String? metacriticLink;
  final String dealID;
  final Store store;
  final String gameID;
  final double salePrice;
  final double normalPrice;
  final bool isOnSale;
  final double savings;
  final int metacriticScore;

  const Deal(this.internalName, this.title, this.metacriticLink, this.dealID,
      this.store, this.gameID, this.salePrice, this.normalPrice,
      this.isOnSale, this.savings, this.metacriticScore);

  @override
  List<Object> get props => [dealID];

  @override
  bool get stringify => true;
}