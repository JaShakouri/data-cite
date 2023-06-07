import 'dart:convert';

import 'package:de_dtcite/config/api/api_const.dart';
import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/feature/provider/data/repository/provider_repository.dart';

class ProviderRepositoryImpl extends ProviderRepository {
  final DioClient dioClient;

  ProviderRepositoryImpl(this.dioClient);

  @override
  Future<DataState<ResponseProviderModel>> loadProvider(
    String consortiumId,
    int pageSize,
    int pageIndex,
  ) async {
    try {
      var result = await dioClient.get(
        getProviders,
        queryParameters: {
          "consortium-id": consortiumId,
          "page[number]": pageIndex,
          "page[size]": pageSize,
        },
      );

      if (result != null && result.statusCode == 200) {
        var mapper = responseProviderModelFromJson(jsonEncode(result.data));
        return DataSuccess(
          mapper,
        );
      }

      return DataFailed(
        "Error connection",
      );
    } catch (ex) {
      return DataFailed(ex.toString());
    }
  }
}
