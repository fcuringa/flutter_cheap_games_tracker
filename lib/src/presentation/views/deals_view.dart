import 'package:cheap_games/src/domain/entities/deal/deal.dart';
import 'package:cheap_games/src/presentation/blocs/remote_deals_bloc.dart';
import 'package:cheap_games/src/presentation/views/deal_details_view.dart';
import 'package:cheap_games/src/presentation/widgets/deal/deal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../blocs/remote_deals_event.dart';
import '../blocs/remote_deals_state.dart';

class DealsView extends HookWidget {
  DealsView({Key? key}) : super(key: key);

  void _tapCallback(Deal deal, BuildContext context) {
    print("Tapped ${deal.title}");
    Navigator.pushNamed(context, DealDetailsView.routeName, arguments: deal);
  }

  List<Widget> _buildDealsFeed(RemoteDealsDone state, BuildContext context) {
    var dealsCards = state.deals.reversed
        .map((e) => DealCard(deal: e, tapCallback: (Deal deal){
          return _tapCallback(deal, context);
    }))
        .toList();
    print("Got ${dealsCards.length} cards!");
    return [
      ...dealsCards,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Best deals right now"),
      ),
      body: BlocBuilder<RemoteDealsBloc, RemoteDealsState>(
        builder: (_, state) {
          // Handle deals bloc state
          switch (state.runtimeType) {
            case RemoteDealsLoading:
              return Center(child: CircularProgressIndicator());
            case RemoteDealsDone:
              var feedWidgets = _buildDealsFeed(state as RemoteDealsDone, context);
              return Center(
                  child: NotificationListener<ScrollEndNotification>(
                onNotification: (ScrollEndNotification t) {
                  if (t.metrics.pixels > 0 && t.metrics.atEdge) {
                    var remoteDealsBloc =
                        BlocProvider.of<RemoteDealsBloc>(context);
                    remoteDealsBloc.add(GetDeals());
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  child: Column(children: feedWidgets),
                ),
              ));
            case RemoteDealsError:
              return Center(child: Text("Error"));
            default:
              return Center(child: Text("?"));
          }
        },
      ),

    );
  }
}
