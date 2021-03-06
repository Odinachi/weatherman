import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherman/core/state_management/location_getter.dart';
import 'package:weatherman/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LocationGetter(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: WeatherManHomeScreen()),
    );
  }
}
