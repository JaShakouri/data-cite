import 'dart:convert';

import 'package:de_dtcite/config/api/api_const.dart';
import 'package:de_dtcite/config/api/dio_client.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/data/repository/dio_repository.dart';

class DoiRepositoryImpl extends DoiRepository {
  final DioClient dioClient;

  DoiRepositoryImpl(this.dioClient);

  @override
  Future<DataState<ResponseDoiModel>> loadDoi(
      String clientId, int pageSize, int pageIndex) async {
    try {
      var result = await dioClient.get(
        getDois,
        queryParameters: {
          "client-id": clientId,
          "page[number]": pageIndex,
          "page[size]": pageSize,
        },
      );

      if (result != null && result.statusCode == 200) {
        var mapper = responseDioModelFromJson(jsonEncode(result.data));
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
