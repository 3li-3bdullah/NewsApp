import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/shared/cubit/cubit/app_cubit.dart';
import 'package:news_app/shared/network/network_helper.dart';

void main() {
  NetworkHelper.initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.deepPurple,
              appBarTheme: const AppBarTheme(
                elevation: 0.0,
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                // backwardsCompatibility: false,
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
                titleTextStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  unselectedItemColor: Colors.grey,
                  elevation: 0.0),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0)),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: primaryColor,
              primarySwatch: Colors.deepPurple,
              appBarTheme: const AppBarTheme(
                 titleSpacing: 20.0,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                // backwardsCompatibility: false,
                backgroundColor: primaryColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarColor: primaryColor,
                ),
                titleTextStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  unselectedItemColor: Colors.white,
                  elevation: 0.0),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0)),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
