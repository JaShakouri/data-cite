import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/feature/doi/data/repository/dio_repository.dart';
import 'package:de_dtcite/feature/doi/domain/repository/doi_repository_impl.dart';
import 'package:de_dtcite/feature/doi/domain/usecases/doi_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  late GetIt locator;

  setUpAll(() async {
    locator = GetIt.instance;
  });

  group("Register singleton test for check provider api calls", () {
    test(
        "Test GetIt for register DioClient, ClientRepository and ClientUseCase",
        () {
      locator.registerSingleton<DioClient>(DioClient());
      locator.registerSingleton<DoiRepository>(
        DoiRepositoryImpl(locator()),
      );
      locator.registerSingleton<DoiUseCase>(
        DoiUseCase(locator()),
      );
      expect(locator<DioClient>(), isNotNull);
      expect(locator<DoiRepository>(), isNotNull);
      expect(locator<DoiUseCase>(), isNotNull);
    });
  });

  group("Call doi api for fetching data", () {
    test("Fetch data with 'gesis.csda' test param", () async {
      var useCase = locator<DoiUseCase>();
      var result = await useCase('gesis.csda');
      expect(result.error, isNull);
      expect(result.data, isNotNull);
    });
  });
}
