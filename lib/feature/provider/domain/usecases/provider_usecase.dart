import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/usecases/use_case.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/feature/provider/data/repository/provider_repository.dart';

class ProviderUseCase
    extends UseCase<DataState<ResponseProviderModel>, String> {
  final ProviderRepository repository;

  ProviderUseCase(this.repository);

  @override
  Future<DataState<ResponseProviderModel>> call(
    String param,
    int? pageSize,
    int? pageIndex,
  ) async {
    return await repository.loadProvider(
      param,
      pageSize ?? 20,
      pageIndex ?? 1,
    );
  }
}
