import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/usecases/use_case.dart';
import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';
import 'package:de_dtcite/feature/client/data/repository/client_repository.dart';

class ClientUseCase extends UseCase<DataState<ClientsTotal>, String> {
  final ClientRepository repository;

  ClientUseCase(this.repository);

  @override
  Future<DataState<ClientsTotal>> call(
    String param, {
    int? pageSize,
    int? pageIndex,
  }) async {
    return await repository.loadClient(
      param,
    );
  }
}
