
import 'package:airnews/screens/screens.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName:(context) => SplashScreen(),
  LoginScreen.routeName:(context) => LoginScreen(),
  RegisterScreen.routeName:(context) => RegisterScreen(),
  LupaPasswordScene.routeName:(context) => LupaPasswordScene(),
  MainScreen.routeName:(context) => MainScreen(),
  NewsDetailScreen.routeName:(context) => NewsDetailScreen(),
  ProfileScreen.routeName:(context) => ProfileScreen(),
};