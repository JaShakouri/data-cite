import 'package:bloc/bloc.dart';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/utils/page_utils.dart';
import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';
import 'package:de_dtcite/feature/client/domain/usecases/client_usecase.dart';
import 'package:de_dtcite/feature/client/presenteration/bloc/status/load_client_status.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'client_event.dart';

part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientUseCase useCase;

  String providerId;

  final PagingController<int, ClientsTotals> pagingController =
      PagingController(firstPageKey: 1);

  ClientBloc(
    this.useCase,
    this.providerId,
  ) : super(ClientState(client: LoadingState())) {
    on<LoadClientEvent>((event, emit) async {
      emit(state.copyWith(client: LoadingState()));

      var result = await useCase.call(
        providerId,
      );

      pagingController.refresh();

      if (result is DataSuccess) {
        pagingController.appendLastPage(result.data!.clients);

        emit(
          state.copyWith(
            client: ClientLoadedState(pagingController.value.itemList ?? []),
          ),
        );
      } else if (result is DataFailed) {
        emit(
          state.copyWith(
            client: ErrorState(
              result.error ?? "Fatal error",
            ),
          ),
        );
      }
    });

    add(LoadClientEvent());
  }

  callDio(String? clientId) {
    goToDoiView(args: clientId);
  }
}
