import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/feature/provider/data/repository/provider_repository.dart';
import 'package:de_dtcite/feature/provider/domain/repository/provider_repository_impl.dart';
import 'package:de_dtcite/feature/provider/domain/usecases/provider_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  late GetIt locator;

  setUpAll(() async {
    locator = GetIt.instance;
  });

  group("Register singleton test for check provider api calls", () {
    test(
        "Test GetIt for register DioClient, ProviderRepository and ProviderUseCase",
        () {
      locator.registerSingleton<DioClient>(DioClient());
      locator.registerSingleton<ProviderRepository>(
        ProviderRepositoryImpl(locator()),
      );
      locator.registerSingleton<ProviderUseCase>(
        ProviderUseCase(locator()),
      );
      expect(locator<DioClient>(), isNotNull);
      expect(locator<ProviderRepository>(), isNotNull);
      expect(locator<ProviderUseCase>(), isNotNull);
    });
  });

  group("Call provider api for fetching data", () {
    test("Fetch data for get providers with 'daraco' test param", () async {
      var useCase = locator<ProviderUseCase>();
      var result = await useCase('daraco');
      expect(result.error, isNull);
      expect(result.data, isNotNull);
    });
  });
}
