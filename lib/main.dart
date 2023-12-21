import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/newsLayout/newsLayout.dart';
import 'package:news/shared/components/blocObserver.dart';
import 'package:news/shared/components/constants.dart';
import 'package:news/shared/cubit/myNewsCubit.dart';
import 'package:news/shared/cubit/myNewsStates.dart';
import 'package:news/shared/network/local/cacheHelper.dart';
import 'package:news/shared/network/remote/dioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = blocObserver();
  dioHelper.init();
  await cacheHelper.init();
  bool? isDark = cacheHelper.getData(key: "isDark");
  runApp(MyApp(isDark = true));
}

class MyApp extends StatelessWidget {
  late final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((BuildContext context) => newsCubit()
        // ..getBusiness(businessAPI)
        // ..getSports(sportsAPI)
        // ..getScience(scienceAPI)
        ..changeDarkMode(isDarkMode: isDark)),
      child: BlocConsumer<newsCubit, newsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.teal,
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.teal,
                // ward
                // elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.teal,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.white54,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
                bodyText2: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.teal,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.teal,
              ),
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Colors.black,
                // ward
                // elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black12,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white10,
              ),
              scaffoldBackgroundColor: Colors.black12,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white30,
                ),
                bodyText2: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
            ),
            themeMode: newsCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: newsLayout(),
          );
        },
      ),
    );
  }
}
