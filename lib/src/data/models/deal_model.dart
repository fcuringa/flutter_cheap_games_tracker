import 'package:cheap_games/src/domain/entities/deal/deal.dart';

/// Model for a [Deal] in the REST API
class DealModel {
  final String internalName;
  final String title;
  final String? metacriticLink;
  final String dealID;
  final String storeID;
  final String gameID;
  final String salePrice;
  final String normalPrice;
  final String isOnSale;
  final String savings;
  final String metacriticScore;
  final String? steamRatingText;
  final String steamRatingPercent;
  final String steamRatingCount;
  final String? steamAppID;
  final int releaseDate;
  final int lastChange;
  final String dealRating;
  final String thumb;
  const DealModel(this.internalName, this.title, this.metacriticLink, this.dealID,
      this.storeID, this.gameID, this.salePrice, this.normalPrice,
      this.isOnSale, this.savings, this.metacriticScore, this.steamRatingText,
      this.steamRatingPercent, this.steamRatingCount, this.steamAppID,
      this.releaseDate, this.lastChange, this.dealRating, this.thumb);

  factory DealModel.fromJson(Map<String, dynamic> map){
    print("Deal JSON: $map");
    return DealModel(
      map['internalName'],
      map['title'],
      map['metacriticLink'],
      map['dealID'],
      map['storeID'],
      map['gameID'],
      map['salePrice'],
      map['normalPrice'],
      map['isOnSale'],
      map['savings'],
      map['metacriticScore'],
      map['steamRatingText'],
      map['steamRatingPercent'],
      map['steamRatingCount'],
      map['steamAppID'],
      map['releaseDate'],
      map['lastChange'],
      map['dealRating'],
      map['thumb']
    );
  }
}
