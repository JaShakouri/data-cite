import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/utils/toast_utils.dart';
import 'package:de_dtcite/core/widgets/app_scaffold.dart';
import 'package:de_dtcite/core/widgets/card_skeleton.dart';
import 'package:de_dtcite/core/widgets/common_widgets.dart';
import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';
import 'package:de_dtcite/feature/client/presenteration/widgets/client_card.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/presenteration/bloc/doi_bloc.dart';
import 'package:de_dtcite/feature/doi/presenteration/bloc/status/doi_load_status.dart';
import 'package:de_dtcite/feature/doi/presenteration/widgets/doi_card.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:de_dtcite/config/di/locator.dart' as di;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DoiList extends StatefulWidget {
  const DoiList(this.args, {Key? key}) : super(key: key);

  final ClientData args;

  @override
  State<DoiList> createState() => _DoiListState();
}

class _DoiListState extends State<DoiList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DoiBloc(di.locator(), widget.args.id ?? ""),
      child: AppScaffold(
        appBar: AppBar(
          title: Text("${widget.args.id?.toUpperCase()} - Doi list"),
          backgroundColor: kPrimaryColor,
          elevation: 2.0,
        ),
        body: _loadBodyConsumer(context),
      ),
    );
  }

  _loadBodyConsumer(BuildContext context) {
    return BlocConsumer<DoiBloc, DoiState>(
      listenWhen: (previous, current) => previous.doi != current.doi,
      listener: (context, state) {
        if (state.doi is ErrorState) {
          var error = (state.doi as ErrorState).error;
          toastError(error);
        }
      },
      buildWhen: (previous, current) => previous.doi != current.doi,
      builder: (context, state) {
        if (state.doi is LoadingState) {
          return readAllLoading();
        }

        if (state.doi is DoiLoadedState) {
          var _list = (state.doi as DoiLoadedState).list;
          return _readAllComplete(_list, context);
        }

        return emptyView();
      },
    );
  }

  _readAllComplete(List<DoiData> list, BuildContext context) {
    if (list.isNotEmpty) {
      return PagedListView<int, DoiData>(
        pagingController: context.read<DoiBloc>().pagingController,
        padding: const EdgeInsets.all(16.0),
        builderDelegate: PagedChildBuilderDelegate<DoiData>(
          itemBuilder: (context, item, index) => DelayedDisplay(
            fadeIn: true,
            delay: const Duration(milliseconds: 200),
            child: DoiCard(
              entity: item,
              onClick: context.read<DoiBloc>().callDioDetails,
            ),
          ),
        ),
      );
    } else {
      return emptyView();
    }
  }
}
