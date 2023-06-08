import 'package:bloc/bloc.dart';
import 'package:context_holder/context_holder.dart';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/utils/page_utils.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/feature/provider/domain/usecases/provider_usecase.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/status/load_provider_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'provider_event.dart';

part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  final ProviderUseCase providerUseCase;
  
  var _consortiumId = "";
  var _loading = false;

  final PagingController<int, ProviderData> pagingController =
      PagingController(firstPageKey: 0);

  ProviderBloc({
    required this.providerUseCase,
  }) : super(ProviderState(
          provider: ProviderLoadedState(
            const [],
          ),
        )) {
    pagingController.addPageRequestListener((pageKey) async {
      if (_loading) return;
      _loading = true;
      var result = await providerUseCase.call(
        _consortiumId,
        pageSize: kPageSize,
        pageIndex: pageKey,
      );

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.totalPages) {
          pagingController.appendLastPage(result.data!.providers);
        } else {
          pagingController.appendPage(
            result.data!.providers,
            ((result.data?.meta?.page ?? 1) + 1) as int?,
          );
        }
      } else if (result is DataFailed) {
        pagingController.error = result.error ?? "Fatal error";
        pagingController
            .notifyStatusListeners(PagingStatus.subsequentPageError);
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
                add(LoadProviderEvent(_consortiumId));
              },
            ),
          ),
        );
      }
    });

    on<LoadProviderEvent>((event, emit) async {
      if (_loading) return;
      _loading = true;

      emit(state.copyWith(provider: LoadingState()));

      _consortiumId = event.consortiumId;

      var result = await providerUseCase.call(
        event.consortiumId,
        pageSize: kPageSize,
        pageIndex: 1,
      );

      pagingController.refresh();

      if (result is DataSuccess) {
        if (result.data?.meta?.page == result.data?.meta?.totalPages) {
          pagingController.appendLastPage(result.data!.providers);
        } else {
          pagingController.appendPage(
            result.data!.providers,
            ((result.data?.meta?.page ?? 1) + 1) as int?,
          );
        }
        emit(
          state.copyWith(
            provider:
                ProviderLoadedState(pagingController.value.itemList ?? []),
          ),
        );
      } else if (result is DataFailed) {
        pagingController.error = result.error ?? "Fatal error";
        pagingController.notifyStatusListeners(PagingStatus.firstPageError);
        emit(
          state.copyWith(
            provider: ErrorState(
              result.error ?? "Fatal error",
            ),
          ),
        );
      }

      _loading = false;
    });
  }

  callClient(ProviderData value) async {
    goToClientView(args: value);
  }
}
