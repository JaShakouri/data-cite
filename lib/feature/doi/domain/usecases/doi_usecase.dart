import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/usecases/use_case.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/data/repository/dio_repository.dart';

class DoiUseCase extends UseCase<DataState<ResponseDoiModel>, String> {
  final DoiRepository repository;

  DoiUseCase(this.repository);

  @override
  Future<DataState<ResponseDoiModel>> call(
    String param, {
    int? pageSize,
    int? pageIndex,
  }) async {
    return await repository.loadDoi(
      param,
      pageSize ?? 20,
      pageIndex ?? 1,
    );
  }
}
