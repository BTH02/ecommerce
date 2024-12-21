import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/ui/08/bloc/my_cart_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/generated/l10n.dart';

const Locale localeVietNam = Locale('vi', 'VN');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.signIn,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L.delegate.supportedLocales,
      locale: localeVietNam,
      builder: (context, child) {
        return _ProvidersCreator(child: child!);
      },
    );
  }
}

class _ProvidersCreator extends StatefulWidget {
  const _ProvidersCreator({required this.child});

  final Widget child;

  @override
  State<_ProvidersCreator> createState() => _ProvidersCreatorState();
}

class _ProvidersCreatorState extends State<_ProvidersCreator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MyCartBloc(),
        ),
      ],
      child: widget.child,
    );
  }
}
