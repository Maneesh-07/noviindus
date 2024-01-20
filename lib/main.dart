import 'package:flutter/material.dart';
import 'package:noviindus/services/bus_listing.dart';
import 'package:noviindus/services/driver_delete.dart';
import 'package:noviindus/services/driver_listing.dart';
import 'package:noviindus/services/login_service.dart';
import 'package:noviindus/services/post_driver.dart';
import 'package:noviindus/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => BusProviderServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverProviderServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverPostServices(),
        ),
        ChangeNotifierProvider(
          create: (context) => DriverDeletePostServices(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
