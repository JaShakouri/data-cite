import 'package:context_holder/context_holder.dart';
import 'package:de_dtcite/feature/client/presenteration/bloc/client_bloc.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/bloc/provider_bloc.dart';
import 'package:de_dtcite/feature/provider/presenteration/provider/screens/provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/di/locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init dependency injection
  await di.setup();

  runApp(
    const App(),
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProviderBloc>(
          create: (_) => di.locator<ProviderBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: ContextHolder.key,
        home: const ProviderScreen(),
      ),
    );
  }
}
