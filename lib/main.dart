import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:theshave/screens/barber_register_screen.dart';
import 'package:theshave/screens/login_screen.dart';
import 'package:theshave/screens/status_screen.dart';
import 'google_sign_in.dart';
import 'screens/auth_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 120.0,
        duration:1500,
        nextScreen: const HomePage(),
        splash: Splash(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StatusPage());

  //         @override
  // Widget build(BuildContext context) => Scaffold(
  //     body: StreamBuilder(
  //         stream: FirebaseAuth.instance.authStateChanges(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return (const Center(
  //               child: CircularProgressIndicator(),
  //             ));
  //           } else if (snapshot.hasData) {
  //             return  Center(
  //               child: /*LoginScreen()BarberRegistryScreen()*/StatusPage(),
  //             );
  //           } else if (snapshot.hasError) {
  //             return const Center(
  //               child: Text('Cannot Log In'),
  //             );
              
  //           } else {
  //             return AuthScreen();
  //           }
  //         }));

}


class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
        ElevatedButton.icon(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            icon: const Icon(Icons.login),
            label: const Text('Log In')),
      ],
    );
  }
}

class MainActivity extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
  );
  @override
  Widget build(BuildContext context) {
    return const AuthButtons();
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            // Icon(Icons.cut),
            Image.asset('images/logo.png',fit: BoxFit.fitWidth,height: 100,), 
         ],
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Form Styling Demo';
//     return ChangeNotifierProvider(
//         create: (context) => GoogleSignInProvider(),
//         child: MaterialApp(
//           title: appTitle,
//           home: Scaffold(
//             appBar: AppBar(
//               title: const Text(appTitle),
//             ),
//             body:  MainActivity(),
//           ),
//         ));
//   }
// }