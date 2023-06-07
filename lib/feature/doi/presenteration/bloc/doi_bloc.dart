import 'package:bloc/bloc.dart';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/utils/page_utils.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/domain/usecases/doi_usecase.dart';
import 'package:de_dtcite/feature/doi/presenteration/bloc/status/doi_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'doi_event.dart';

part 'doi_state.dart';

class DoiBloc extends Bloc<DoiEvent, DoiState> {
  final DoiUseCase useCase;
  final String clientId;

  final _pageSize = 20;
  var _pageIndex = 1;
  var _loading = false;

  final PagingController<int, DoiData> pagingController =
      PagingController(firstPageKey: 1);

  DoiBloc(this.useCase, this.clientId) : super(DoiState(doi: LoadingState())) {
    pagingController.addPageRequestListener((pageKey) async {
      if (_loading) return;
      _loading = true;
      var result = await useCase.call(
        clientId,
        _pageSize,
        pageKey,
      );

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.total) {
          pagingController.appendLastPage(result.data!.dois);
        } else {
          _pageIndex++;
          pagingController.appendPage(result.data!.dois, _pageIndex);
        }
      }
    });

    on<LoadDoiEvent>((event, emit) async {
      emit(state.copyWith(doi: LoadingState()));

      _pageIndex = 1;

      var result = await useCase.call(
        clientId,
        _pageSize,
        _pageIndex,
      );

      pagingController.refresh();

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.total) {
          pagingController.appendLastPage(result.data!.dois);
        } else {
          _pageIndex++;
          pagingController.appendPage(result.data!.dois, _pageIndex);
        }

        emit(
          state.copyWith(
            doi: DoiLoadedState(pagingController.value.itemList ?? []),
          ),
        );
      } else if (result is DataFailed) {
        emit(
          state.copyWith(
            doi: ErrorState(
              result.error ?? "Fatal error",
            ),
          ),
        );
      }
    });

    add(LoadDoiEvent());
  }

  callDioDetails(DoiData value) {
    goToDoiDetailsView(args: value);
  }
}
