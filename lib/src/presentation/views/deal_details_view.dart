import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

class DealDetailsView extends HookWidget {
  final Deal deal;
  static final String routeName = "/deal";

  DealDetailsView(this.deal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deal.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  deal.title,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Metacritic score: ${deal.metacriticScore}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Store: ${deal.store.storeName}",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Normal price: \$${deal.normalPrice}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sale price: \$${deal.salePrice}"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Savings: ${deal.savings}\%"),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(onPressed: () async{
                    await launch("https://www.cheapshark.com/redirect?dealID=${deal.dealID}");
                  }, child: Text("Buy on ${deal.store.storeName}")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
