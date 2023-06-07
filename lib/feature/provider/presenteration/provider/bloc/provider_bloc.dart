import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/resources/data_state.dart';
import 'package:de_dtcite/core/utils/dialog_utils.dart';
import 'package:de_dtcite/core/utils/page_utils.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/feature/provider/domain/usecases/provider_usecase.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/status/load_provider_status.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/status/provider_status.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'provider_event.dart';

part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  final ProviderUseCase providerUseCase;

  final _pageSize = 20;
  var _pageIndex = 1;
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
        _pageSize,
        pageKey,
      );

      if (result is DataSuccess) {
        if (result.data?.page?.page == result.data?.page?.total) {
          pagingController.appendLastPage(result.data!.providers);
        } else {
          _pageIndex++;
          pagingController.appendPage(result.data!.providers, _pageIndex);
        }
      }
    });

    on<LoadProviderEvent>((event, emit) async {
      emit(state.copyWith(provider: LoadingState()));

      _consortiumId = event.consortiumId;

      var result = await providerUseCase.call(
        event.consortiumId,
        _pageSize,
        _pageIndex,
      );

      pagingController.refresh();

      if (result is DataSuccess) {
        if (result.data?.page?.page == result.data?.page?.total) {
          pagingController.appendLastPage(result.data!.providers);
        } else {
          _pageIndex++;
          pagingController.appendPage(result.data!.providers, _pageIndex);
        }

        emit(
          state.copyWith(
            provider:
                ProviderLoadedState(pagingController.value.itemList ?? []),
          ),
        );
      } else if (result is DataFailed) {
        emit(
          state.copyWith(
            provider: ErrorState(
              result.error ?? "Fatal error",
            ),
          ),
        );
      }
    });
  }

  callClient(ProviderData value) async {
    goToClientView(args: value);
  }
}
