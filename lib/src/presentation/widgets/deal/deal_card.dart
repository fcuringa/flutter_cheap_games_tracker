import 'package:flutter/material.dart';

import '../../../domain/entities/deal/deal.dart';

class DealCard extends StatelessWidget {
  final Deal deal;
  final void Function(Deal deal)? tapCallback;

  const DealCard({Key? key, required this.deal, this.tapCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          if (tapCallback != null) {
            tapCallback!(deal);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.gamepad_outlined),
              title: Text(deal.title),
              subtitle: Text(deal.store.storeName),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Normal price: \$${deal.normalPrice}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Current price: \$${deal.salePrice}, you save ${deal.savings}\%"),
            ),
          ],
        ),
      ),
    );
  }
}
