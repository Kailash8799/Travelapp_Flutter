import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/screens/splashscreen.dart';
import 'package:travel_app/themes/light_theme.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/app_services.dart';
import 'package:realm/realm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config realmConfig = await Config.getConfig('assets/config/atlasConfig.json');
  final appConfig = AppConfiguration(realmConfig.appId);
  final app = App(appConfig);
  if (app.currentUser == null) {
    try {
      final anonCredentials = Credentials.anonymous();
      await app.logIn(anonCredentials);
    } catch (e) {
      print(e);
    }
  }
  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (_) => GlobalValue()),
      ChangeNotifierProvider<Config>(create: (_) => realmConfig),
      ChangeNotifierProvider<AppServices>(
          create: (_) => AppServices(realmConfig.appId, realmConfig.baseUrl)),
      ChangeNotifierProxyProvider<AppServices, RealmServices?>(
          // RealmServices can only be initialized only if the user is logged in.
          create: (context) => null,
          update: (BuildContext context, AppServices appServices,
              RealmServices? realmServices) {
            return RealmServices(appServices.app);
          }),
    ],
    builder: (context, child) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // checkUSerisFirstTimeonApp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context, listen: false);
    return MaterialApp(
      theme: lightTheme,
      title: "Air Travel",
      themeMode: ThemeMode.system,
      darkTheme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: realmServices.currentUser != null &&
              realmServices.currentUser!.provider != AuthProviderType.anonymous
          ? const HomeScreen()
          : const SplashScreen(),
    );
  }
}
