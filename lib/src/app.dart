import 'package:flutter/material.dart';
import 'package:ptu/src/routes/routes.dart';

class Ptu extends StatefulWidget {
  const Ptu({Key? key}) : super(key: key);

  @override
  State<Ptu> createState() => _PtuState();
}

class _PtuState extends State<Ptu> {
  Widget SomethingWentWrong(context) {
    final GlobalKey<_PtuState> somethingWentWrongKey =
        new GlobalKey<_PtuState>();

    return MaterialApp(
      key: somethingWentWrongKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Container(
        child: Center(child: Text('Algo salió mal')),
      ),
      theme: ThemeData(primaryColor: Colors.red),
    );
  }

  Widget Loading(context) {
    final GlobalKey<_PtuState> loadingKey = new GlobalKey<_PtuState>();

    print("Cargando...........");

    return MaterialApp(
      key: loadingKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Container(
        color: Colors.blue,
        child: Center(
            child: Text(
          'Cargando',
        )),
      ),
    );
  }

  // Set default `_initialized` and `_error` state to false
  bool _initialized = true;
  bool _error = false;
  bool _autenticated = true;

  // Define an async function to initialize FlutterFire
  void initializeAPP() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      // _autenticated = await _auth.loginFromLocalStorage(context);

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
      print("Falló");
    }
  }

  @override
  void initState() {
    initializeAPP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // new RefreshIndicator(key: new GlobalKey<RefreshIndicatorState>(), child: null,;

    // Show error message if initialization failed
    if (_error) {
      return SomethingWentWrong(context);
    }
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      print("Aun no se inicializaaaaaaaaaaaaaaaa.");

      return Loading(context);
    }

    final GlobalKey<_PtuState> homeAux = new GlobalKey<_PtuState>();

    if (_initialized) {
      return MaterialApp(
          key: homeAux,
          debugShowCheckedModeBanner: false,
          routes: getApplicationRoutes(),
          initialRoute: '/',
          // initialRoute: _autenticated ? 'justification' : 'justification',
          // home: HomePage(), //this is the calling screen
          // onGenerateRoute: (RouteSettings settings) =>
          // MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          theme: ThemeData(primaryColor: Colors.green));
    }
    return SomethingWentWrong(context);
  }
}
