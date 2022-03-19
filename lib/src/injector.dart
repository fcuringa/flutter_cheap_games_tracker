import 'package:cheap_games/src/data/datasources/remote/deal/deals_api_service.dart';
import 'package:cheap_games/src/data/datasources/remote/store/stores_api_service.dart';
import 'package:cheap_games/src/data/repositories/deal_repository_impl.dart';
import 'package:cheap_games/src/domain/repositories/deal_repository.dart';
import 'package:cheap_games/src/domain/usecases/deal/get_deals_use_case.dart';
import 'package:cheap_games/src/presentation/blocs/remote_deals_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

/// Setup Dependency Injection
void initializeDependencies() {
  // Dio HTTP client
  injector.registerSingleton(Dio());

  // Dependencies
  injector.registerSingleton(DealsApiService(injector()));
  injector.registerSingleton(StoresApiService(injector()));
  injector.registerSingleton<DealRepository>(DealRepositoryImpl(injector(), injector()));

  // Use cases
  injector.registerSingleton(GetDealsUseCase(injector()));

  // Blocs
  injector.registerFactory(() => RemoteDealsBloc(injector()));
}