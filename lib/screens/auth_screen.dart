import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as fa;

class AuthScreen extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
  );
  AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AuthButtons();
  }
}

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
      child: SizedBox(
        width: 400.0,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              onPrimary: Colors.white,
              shadowColor: Colors.red,
              elevation: 5,
            ),
            onPressed:null,
            icon: const Icon(Icons.mark_email_read),
            label: const Text('Sign in with email')),
      ),
    ),
        AuthButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },name: 'Sign  in with Google',
        ),
         Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
      child: SizedBox(
        width: 400.0,
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
              onPrimary: Colors.white,
              shadowColor: Colors.red,
              elevation: 5,
            ),
            onPressed:null,
            icon: const Icon(Icons.phone_android),
            label: const Text('Sign in with phone')),
      ),
    ),
        SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton(
      {required this.name, required this.onPressed});
  // ignore: empty_constructor_bodies
  final String name;
  //final IconData iconData;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
      child: SizedBox(
        width: 400.0,
        child: ElevatedButton.icon(
          
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Colors.red,
              onPrimary: Colors.white,
              shadowColor: Colors.black,
              elevation: 5,
            
            ),
            onPressed:onPressed,
            icon: const fa.FaIcon(fa.FontAwesomeIcons.google),
            label: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Text(name),
            )),
      ),
    );
  }
}

var style = ElevatedButton.styleFrom();
