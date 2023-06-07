import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';

abstract class DoiRepository {
  Future<DataState<ResponseDoiModel>> loadDoi(
    String clientId,
    int pageSize,
    int pageIndex,
  );
}
