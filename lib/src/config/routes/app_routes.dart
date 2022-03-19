import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:cheap_games/src/presentation/views/deal_details_view.dart';
import 'package:cheap_games/src/presentation/views/deals_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => DealsView());
      case '/deal':
        final deal = settings.arguments as Deal;
        return MaterialPageRoute(builder: (_) => DealDetailsView(deal));
      default:
        // Default case: home page
        return MaterialPageRoute(builder: (_) => DealsView());
    }
  }
}