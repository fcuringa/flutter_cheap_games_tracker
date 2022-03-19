import 'package:cheap_games/src/config/routes/app_routes.dart';
import 'package:cheap_games/src/injector.dart';
import 'package:cheap_games/src/presentation/blocs/remote_deals_bloc.dart';
import 'package:cheap_games/src/presentation/blocs/remote_deals_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initializeDependencies();

  runApp(CheapGamesApp());
}

class CheapGamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteDealsBloc>(
        create: (_) => injector()..add(GetDeals()),
      child: MaterialApp(
        title: "Game deals",
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
