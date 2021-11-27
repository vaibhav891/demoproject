import 'package:demoproject/screens/home/home_screen.dart';
import 'package:demoproject/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store/store.dart';

void main() => runApp(const Shoptronics());

class Shoptronics extends StatefulWidget {
  const Shoptronics({Key? key}) : super(key: key);

  @override
  _ShoptronicsState createState() => _ShoptronicsState();
}

class _ShoptronicsState extends State<Shoptronics> {
  late AppStore store;

  @override
  void initState() {
    store = AppStore();
    store.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AppStore>.value(
      value: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        home: FutureBuilder<dynamic>(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SplashScreen();
              }
              return const HomeScreen();
            }),
      ),
    );
  }
}
