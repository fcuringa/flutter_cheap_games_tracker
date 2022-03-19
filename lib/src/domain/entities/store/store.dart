import 'package:equatable/equatable.dart';

/// A store selling games, such as Steam, GOG, etc.
class Store extends Equatable {
  final String storeID;
  final String storeName;
  final bool isActive;

  const Store(this.storeID, this.storeName, this.isActive);

  @override
  List<Object> get props => [storeID, storeName];

  @override
  bool get stringify => true;
}