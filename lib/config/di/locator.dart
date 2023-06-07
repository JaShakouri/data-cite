import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';
import 'package:de_dtcite/feature/client/domain/repository/client_repository_impl.dart';
import 'package:de_dtcite/feature/client/domain/usecases/client_usecase.dart';
import 'package:de_dtcite/feature/client/presenteration/bloc/client_bloc.dart';
import 'package:de_dtcite/feature/doi/data/repository/dio_repository.dart';
import 'package:de_dtcite/feature/doi/domain/repository/doi_repository_impl.dart';
import 'package:de_dtcite/feature/doi/domain/usecases/doi_usecase.dart';
import 'package:de_dtcite/feature/provider/data/repository/provider_repository.dart';
import 'package:de_dtcite/feature/provider/domain/repository/provider_repository_impl.dart';
import 'package:de_dtcite/feature/provider/domain/usecases/provider_usecase.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/provider_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() async {
  await _commonSetup();
  await _repositorySetup();
  await _useCasesSetup();
  await _blocSetup();
}

_commonSetup() async {
  // Dio client config
  locator.registerLazySingleton<DioClient>(
    () => DioClient(),
  );
}

_repositorySetup() async {
  // Provider repository
  locator.registerLazySingleton<ProviderRepository>(
    () => ProviderRepositoryImpl(locator()),
  );

  // Client repository
  locator.registerLazySingleton<ClientRepository>(
    () => ClientRepositoryImpl(locator()),
  );

  // Doi repository
  locator.registerLazySingleton<DoiRepository>(
    () => DoiRepositoryImpl(locator()),
  );
}

_useCasesSetup() async {
  // Provider use case
  locator.registerLazySingleton<ProviderUseCase>(
    () => ProviderUseCase(locator()),
  );

  // Client use case
  locator.registerLazySingleton<ClientUseCase>(() => ClientUseCase(locator()));

  // Doi use case
  locator.registerLazySingleton<DoiUseCase>(() => DoiUseCase(locator()));
}

_blocSetup() async {
  // Provider Bloc
  locator.registerLazySingleton<ProviderBloc>(
    () => ProviderBloc(providerUseCase: locator()),
  );
}
