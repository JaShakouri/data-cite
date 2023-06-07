import 'package:bloc/bloc.dart';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/utils/page_utils.dart';
import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';
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

  final _pageSize = 20;
  var _pageIndex = 1;
  var _loading = false;

  final PagingController<int, ClientData> pagingController =
      PagingController(firstPageKey: 1);

  ClientBloc(
    this.useCase,
    this.providerId,
  ) : super(ClientState(client: LoadingState())) {
    pagingController.addPageRequestListener((pageKey) async {
      if (_loading) return;
      _loading = true;
      var result = await useCase.call(
        providerId,
        _pageSize,
        pageKey,
      );

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.total) {
          pagingController.appendLastPage(result.data!.clients);
        } else {
          _pageIndex++;
          pagingController.appendPage(result.data!.clients, _pageIndex);
        }
      }
    });

    on<LoadClientEvent>((event, emit) async {
      emit(state.copyWith(client: LoadingState()));

      _pageIndex = 1;

      var result = await useCase.call(
        providerId,
        _pageSize,
        _pageIndex,
      );

      pagingController.refresh();

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.total) {
          pagingController.appendLastPage(result.data!.clients);
        } else {
          _pageIndex++;
          pagingController.appendPage(result.data!.clients, _pageIndex);
        }

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

  callDio(ClientData value) {
    print("value: ${value.attributes?.name}");
    goToDoiView(args: value);
  }
}
