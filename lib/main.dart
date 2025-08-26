import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/pages/home_page.dart';
import 'package:website/themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => HomePage(),
        // '/accountspage': (context) => AccountsPage(),
        // '/statisticspage': (context) => StatisticsPage(),
        // '/categoriespage': (context) => CategoriesPage(),
        // '/recurringtransactionspage': (context) => RecurringTransactionsPage(),
        // '/setuppage': (context) => SetupPage(),
      },
    );
  }
}
