import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';
import 'package:de_dtcite/feature/client/domain/repository/client_repository_impl.dart';
import 'package:de_dtcite/feature/client/domain/usecases/client_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  late GetIt locator;

  setUpAll(() async {
    locator = GetIt.instance;
  });

  group("Register singleton test for check provider api calls", () {
    test("Test GetIt for register DioClient, ClientRepository and ClientUseCase",
        () {
      locator.registerSingleton<DioClient>(DioClient());
      locator.registerSingleton<ClientRepository>(
        ClientRepositoryImpl(locator()),
      );
      locator.registerSingleton<ClientUseCase>(
        ClientUseCase(locator()),
      );
      expect(locator<DioClient>(), isNotNull);
      expect(locator<ClientRepository>(), isNotNull);
      expect(locator<ClientUseCase>(), isNotNull);
    });
  });

  group("Call client api for fetching data", () {
    test("Fetch data with 'csda' test param", () async {
      var useCase = locator<ClientUseCase>();
      var result = await useCase('csda');
      expect(result.error, isNull);
      expect(result.data, isNotNull);
    });
  });
}