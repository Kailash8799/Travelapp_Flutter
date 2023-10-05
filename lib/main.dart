import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/screens/homescreen.dart';
import 'package:travel_app/screens/onboardingscreen.dart';
import 'package:travel_app/screens/onboardingslider.dart';
import 'package:travel_app/screens/splashscreen.dart';
import 'package:travel_app/themes/dark_theme.dart';
import 'package:travel_app/themes/light_theme.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/app_services.dart';
import 'dart:convert';
import 'package:realm/realm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config realmConfig = await Config.getConfig('assets/config/atlasConfig.json');

  // await MongoDatabase.connect();
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

  void transferScreen(bool isOpen, bool isLogin) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => isLogin
                ? const HomeScreen()
                : isOpen
                    ? const OnboardingScreen()
                    : const Onboardingslider(),
          ),
          (route) => false);
    });
  }

  void checkUSerisFirstTimeonApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? firsttime = prefs.getString('userfirsttime');
    final String? isLogin = prefs.getString('userloginornot');
    if (firsttime == null) {
      await prefs.setString('userfirsttime', 'Welcome to our app');
      transferScreen(false, false);
    } else if (isLogin == null) {
      transferScreen(true, false);
    } else {
      transferScreen(true, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
    return MaterialApp(
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: realmServices.currentUser != null &&
              realmServices.currentUser!.provider != AuthProviderType.anonymous
          ? const HomeScreen()
          : const SplashScreen(),
      // home: const LoginScreen(),
      // home: const OnboardingScreen(),
    );
  }
}

class Config extends ChangeNotifier {
  late String appId;
  late String atlasUrl;
  late Uri baseUrl;

  Config._create(dynamic realmConfig) {
    appId = realmConfig['appId'];
    atlasUrl = realmConfig['dataExplorerLink'];
    baseUrl = Uri.parse(realmConfig['baseUrl']);
  }

  static Future<Config> getConfig(String jsonConfigPath) async {
    dynamic realmConfig =
        json.decode(await rootBundle.loadString(jsonConfigPath));
    var config = Config._create(realmConfig);

    return config;
  }
}
