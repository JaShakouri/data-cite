import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';

abstract class ProviderRepository {
  Future<DataState<ResponseProviderModel>> loadProvider(
    String consortiumId,
    int pageSize,
    int pageIndex,
  );
}
