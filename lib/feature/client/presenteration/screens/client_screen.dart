import 'package:de_dtcite/core/base/base_status.dart';
import 'package:de_dtcite/core/utils/constants.dart';
import 'package:de_dtcite/core/utils/toast_utils.dart';
import 'package:de_dtcite/core/widgets/app_scaffold.dart';
import 'package:de_dtcite/core/widgets/common_widgets.dart';
import 'package:de_dtcite/feature/client/data/models/response_clients_totals_model.dart';
import 'package:de_dtcite/feature/client/presenteration/bloc/client_bloc.dart';
import 'package:de_dtcite/feature/client/presenteration/bloc/status/load_client_status.dart';
import 'package:de_dtcite/feature/client/presenteration/widgets/client_card.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:de_dtcite/config/di/locator.dart' as di;
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen(this.args, {Key? key}) : super(key: key);

  final ProviderData args;

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClientBloc(di.locator(), widget.args.id ?? ""),
      child: AppScaffold(
        appBar: AppBar(
          title: Text("${widget.args.id?.toUpperCase()} - Client list"),
          backgroundColor: kPrimaryColor,
          elevation: 2.0,
        ),
        body: _loadBodyConsumer(context),
      ),
    );
  }

  _loadBodyConsumer(BuildContext context) {
    return BlocConsumer<ClientBloc, ClientState>(
      listenWhen: (previous, current) => previous.client != current.client,
      listener: (context, state) {
        if (state.client is ErrorState) {
          var error = (state.client as ErrorState).error;
          toastError(error);
        }
      },
      buildWhen: (previous, current) => previous.client != current.client,
      builder: (context, state) {
        if (state.client is LoadingState) {
          return readAllLoading();
        }

        if (state.client is ClientLoadedState) {
          var _list = (state.client as ClientLoadedState).list;
          return _readAllComplete(_list, context);
        }

        return emptyView();
      },
    );
  }

  _readAllComplete(List<ClientsTotals> list, BuildContext context) {
    if (list.isNotEmpty) {
      return PagedListView<int, ClientsTotals>(
        pagingController: context.read<ClientBloc>().pagingController,
        padding: const EdgeInsets.all(16.0),
        builderDelegate: PagedChildBuilderDelegate<ClientsTotals>(
          itemBuilder: (context, item, index) => DelayedDisplay(
            fadeIn: true,
            delay: const Duration(milliseconds: 200),
            child: ClientCard(
              entity: item,
              onClick: context.read<ClientBloc>().callDio,
            ),
          ),
        ),
      );
    } else {
      return emptyView();
    }
  }
}
