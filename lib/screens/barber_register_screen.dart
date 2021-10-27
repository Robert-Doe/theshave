import 'package:flutter/material.dart';
import 'package:theshave/screens/barberside.dart';

class BarberRegistryScreen extends StatefulWidget {
  const BarberRegistryScreen({Key? key}) : super(key: key);

  @override
  State<BarberRegistryScreen> createState() => _BarberRegistryScreenState();
}

class _BarberRegistryScreenState extends State<BarberRegistryScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController shopCode = TextEditingController();
  bool er1 = false, er2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Register as a Barber',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: fullName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your full name',
                    labelStyle: TextStyle(
                      color: er1 == false ? Colors.black : Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: phone,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: er2 == false ? Colors.black : Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: shopCode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Shop SHORT CODE',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (fullName.text.isNotEmpty && phone.text.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Barber(
                          name: fullName.text,
                          phone: phone.text,
                        );
                      }));
                    } else {
                      if (fullName.text.isEmpty) {
                        setState(() {
                          er1 = true;
                        });
                        if (phone.text.isEmpty) {
                          setState(() {
                            er2 = true;
                          });
                        }
                      }
                    }
                  },
                  icon: const Icon(Icons.mark_email_unread_sharp),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  label: const Text('Start Service'),
                )
              ],
            ),
          ),
        ));
  }
}

// class CustomTextBox extends StatelessWidget {

//   CustomTextBox({
//     Key? key,
//     required this.type,
//     required this.hint, required this.controller,
//   }) : super(key: key);
  
//   final TextEditingController controller;
//   final TextInputType type;
//   final String hint;

//   @override
//   Widget build(BuildContext context) {
//     return const TextField(
//       keyboardType: ,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: '',
//         labelStyle: TextStyle( color: Colors.blue,),
//       ),
//     );
//   }
// }
