import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context);
    print(provider.user);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Face'),
          centerTitle: true,
          actions: [
            TextButton(
              child: const Text('Logout'),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            children: [
              Text('Profile'),
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(provider.user.photoUrl!)),
            ],
          ),
        ));
  }
}
