import 'package:budget_tracker_app/navigate/home.dart';
import 'package:budget_tracker_app/services/budget_service.dart';
import 'package:budget_tracker_app/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeServices>(create: (_) => ThemeServices()),
        ChangeNotifierProvider<BudgetService>(create: (_) => BudgetService()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeServices = Provider.of<ThemeServices>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.indigo,
                  brightness: themeServices.darkmode
                      ? Brightness.dark
                      : Brightness.light,
                ),
              ),
              home: const Home());
        },
      ),
    );
  }
}
