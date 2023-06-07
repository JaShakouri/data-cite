import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/presenteration/bloc/status/doi_status.dart';

class DoiLoadedState extends DoiStatus {
  final List<DoiData> list;

  DoiLoadedState(this.list);

  @override
  List<Object?> get props => [
    list,
  ];
}
