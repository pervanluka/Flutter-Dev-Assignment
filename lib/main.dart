import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assignment/home.dart';
import 'package:flutter_dev_assignment/widgets/error_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rolls',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Center(
        child: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var result = snapshot.data;
              if (result == ConnectivityResult.wifi) {
                return const MyHome();
              } else if (result == ConnectivityResult.mobile) {
                return const MyHome();
              } else {
                return const ErrorPage();
              }
            } else {
              return const ErrorPage();
            }
          },
        ),
      ),
    );
  }
}
