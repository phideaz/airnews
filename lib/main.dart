import 'package:airnews/providers/auth_provider.dart';
import 'package:airnews/routes.dart';
import 'package:airnews/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthenticationProvider.userStream,
      child: MultiProvider(
        providers: [
          Provider<AuthenticationProvider>(
            create: (_) => AuthenticationProvider(),
          ),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: SplashScreen.routeName,
          routes: routes,
        ),
      ),
    );
  }
}


