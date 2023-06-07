import 'package:context_holder/context_holder.dart';
import 'package:de_dtcite/feature/client/data/models/response_client_model.dart';
import 'package:de_dtcite/feature/client/presenteration/screens/client_screen.dart';
import 'package:de_dtcite/feature/doi/data/models/response_dio_model.dart';
import 'package:de_dtcite/feature/doi/presenteration/screens/doi_details.dart';
import 'package:de_dtcite/feature/doi/presenteration/screens/doi_list.dart';
import 'package:de_dtcite/feature/provider/data/models/response_provider_model.dart';
import 'package:flutter/material.dart';

goToClientView({required ProviderData args}) {
  Navigator.push(
    ContextHolder.currentContext,
    MaterialPageRoute(
      builder: (context) => ClientScreen(args),
    ),
  );
}

goToDoiView({required ClientData args}) {
  Navigator.push(
    ContextHolder.currentContext,
    MaterialPageRoute(
      builder: (context) => DoiList(args),
    ),
  );
}

goToDoiDetailsView({required DoiData args}) {
  Navigator.push(
    ContextHolder.currentContext,
    MaterialPageRoute(
      builder: (context) => DoiDetails(args),
    ),
  );
}

// goToEditPage(BuildContext context, {required CustomerEntity entity}) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => EditCustomerPage(customerEntity: entity),
//     ),
//   );
// }
//
// goBack(BuildContext context) {
//   Navigator.pop(
//     context,
//   );
// }
