import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';
import 'package:de_dtcite/feature/client/domain/repository/client_repository_impl.dart';
import 'package:de_dtcite/feature/client/domain/usecases/client_usecase.dart';
import 'package:de_dtcite/feature/doi/data/repository/dio_repository.dart';
import 'package:de_dtcite/feature/doi/domain/repository/doi_repository_impl.dart';
import 'package:de_dtcite/feature/doi/domain/usecases/doi_usecase.dart';
import 'package:de_dtcite/feature/provider/data/repository/provider_repository.dart';
import 'package:de_dtcite/feature/provider/domain/repository/provider_repository_impl.dart';
import 'package:de_dtcite/feature/provider/domain/usecases/provider_usecase.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/provider_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  late GetIt locator;

  setUp(() async {
    locator = GetIt.instance;
  });

  group("Register singleton test for check locator", () {
    test("Test get it common things", () {
      locator.registerSingleton<DioClient>(DioClient());
      expect(locator<DioClient>(), isNotNull);
    });

    test("Test get it for repositories", () {
      locator.registerLazySingleton<ProviderRepository>(
          () => ProviderRepositoryImpl(locator()));

      locator.registerLazySingleton<ClientRepository>(
          () => ClientRepositoryImpl(locator()));

      locator.registerLazySingleton<DoiRepository>(
          () => DoiRepositoryImpl(locator()));

      expect(locator<ProviderRepository>(), isNotNull);
      expect(locator<ClientRepository>(), isNotNull);
      expect(locator<DoiRepository>(), isNotNull);
    });

    test("Test get it for use cases", () {
      locator.registerLazySingleton<ProviderUseCase>(
        () => ProviderUseCase(locator()),
      );

      locator.registerLazySingleton<ClientUseCase>(
        () => ClientUseCase(locator()),
      );

      locator.registerLazySingleton<DoiUseCase>(
        () => DoiUseCase(locator()),
      );

      expect(locator<ProviderUseCase>(), isNotNull);
      expect(locator<ClientUseCase>(), isNotNull);
      expect(locator<DoiUseCase>(), isNotNull);
    });

    test("Test get it for blocs", () {
      locator.registerLazySingleton<ProviderBloc>(
        () => ProviderBloc(
          providerUseCase: locator(),
        ),
      );

      expect(locator<ProviderBloc>(), isNotNull);
    });
  });
}
