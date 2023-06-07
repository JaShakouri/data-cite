import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/usecases/use_case.dart';
import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';

class ClientUseCase extends UseCase<DataState<ResponseClientModel>, String> {
  final ClientRepository repository;

  ClientUseCase(this.repository);

  @override
  Future<DataState<ResponseClientModel>> call(
    String param,
    int? pageSize,
    int? pageIndex,
  ) async {
    return await repository.loadClient(
      param,
      pageSize ?? 20,
      pageIndex ?? 1,
    );
  }
}
