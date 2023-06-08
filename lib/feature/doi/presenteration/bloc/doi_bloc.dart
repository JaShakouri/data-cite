import 'package:bloc/bloc.dart';
import 'package:context_holder/context_holder.dart';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/utils/page_utils.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/domain/usecases/doi_usecase.dart';
import 'package:de_dtcite/feature/doi/presenteration/bloc/status/doi_load_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'doi_event.dart';

part 'doi_state.dart';

class DoiBloc extends Bloc<DoiEvent, DoiState> {
  final DoiUseCase useCase;

  final String clientId;
  var _loading = false;

  final PagingController<int, DoiData> pagingController =
      PagingController(firstPageKey: 1);

  DoiBloc(this.useCase, this.clientId) : super(DoiState(doi: LoadingState())) {

    pagingController.addPageRequestListener((pageKey) async {
      if (_loading) return;
      _loading = true;
      var result = await useCase.call(
        clientId,
        pageSize: kPageSize,
        pageIndex: pageKey,
      );

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.totalPages) {
          pagingController.appendLastPage(result.data!.dois);
        } else {
          pagingController.appendPage(
            result.data!.dois,
            ((result.data?.meta?.page ?? 1) + 1) as int?,
          );
        }
      }

      _loading = false;
    });

    pagingController.addStatusListener((status) {
      if (status == PagingStatus.subsequentPageError) {
        ScaffoldMessenger.of(ContextHolder.currentContext).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching a new page.',
            ),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () => pagingController.retryLastFailedRequest(),
            ),
          ),
        );
      }

      if (status == PagingStatus.firstPageError) {
        ScaffoldMessenger.of(ContextHolder.currentContext).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching data.',
            ),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {
                add(LoadDoiEvent());
              },
            ),
          ),
        );
      }
    });

    on<LoadDoiEvent>((event, emit) async {
      emit(state.copyWith(doi: LoadingState()));

      var result = await useCase.call(
        clientId,
        pageSize: kPageSize,
        pageIndex: 1,
      );

      pagingController.refresh();

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.totalPages) {
          pagingController.appendLastPage(result.data!.dois);
        } else {
          pagingController.appendPage(
            result.data!.dois,
            ((result.data?.meta?.page ?? 1) + 1) as int?,
          );
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
