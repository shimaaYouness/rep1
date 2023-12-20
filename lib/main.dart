import 'package:flutter/material.dart';
import 'package:untitled/features/water/presentation/providers/year_provider.dart';
import 'package:untitled/features/water/presentation/screens/water_provider_screen.dart';
import 'core/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'features/water/presentation/providers/bill_provider.dart';
import 'features/water/presentation/providers/get_all_briza_provider.dart';


void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BrizaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BillProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => YearProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portal',
        theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black87,
            )),
        home: WaterScreen()
      ),
    );


  }
}

