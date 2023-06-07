import 'dart:async';
import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/widgets/app_scaffold.dart';
import 'package:de_dtcite/core/widgets/common_widgets.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/provider_bloc.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/status/load_provider_status.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/widgets/header_with_seachbox.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/widgets/provider_card.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/utils/toast_utils.dart';
import 'package:de_dtcite/config/di/locator.dart' as di;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  var bloc = di.locator<ProviderBloc>();
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            child: _loadBodyConsumer(),
          ),
          HeaderWithSearchBox(
            size: MediaQuery.of(context).size,
            onChange: _onSearchChanged,
          ),
        ],
      ),
    );
  }

  _loadBodyConsumer() {
    return BlocConsumer<ProviderBloc, ProviderState>(
      listenWhen: (previous, current) => previous.provider != current.provider,
      listener: (context, state) {
        if (state.provider is ErrorState) {
          var error = (state.provider as ErrorState).error;
          toastError(error);
        }
      },
      buildWhen: (previous, current) => previous.provider != current.provider,
      builder: (context, state) {
        if (state.provider is LoadingState) {
          return readAllLoading();
        }

        if (state.provider is ProviderLoadedState) {
          var _list = (state.provider as ProviderLoadedState).list;
          return _readAllComplete(_list);
        }

        return emptyView();
      },
    );
  }

  _readAllComplete(List<ProviderData> list) {
    if (list.isNotEmpty) {
      return PagedListView<int, ProviderData>(
        pagingController: bloc.pagingController,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: 200,
        ),
        builderDelegate: PagedChildBuilderDelegate<ProviderData>(
          itemBuilder: (context, item, index) => DelayedDisplay(
            fadeIn: true,
            delay: const Duration(milliseconds: 200),
            child: ProviderCard(
              entity: item,
              onClick: bloc.callClient,
            ),
          ),
        ),
      );
    } else {
      return emptyView();
    }
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      bloc.add(LoadProviderEvent(query));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
