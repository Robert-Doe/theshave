 import 'package:flutter/material.dart';
import 'package:theshave/screens/clientside.dart';

class ClientRegistryScreen extends StatefulWidget {
  const ClientRegistryScreen({Key? key}) : super(key: key);

  @override
  State<ClientRegistryScreen> createState() => ClientRegistryScreenState();
}

class ClientRegistryScreenState extends State<ClientRegistryScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  //TextEditingController shopCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as a Client',style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:  [ TextField(
            controller: fullName,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your full name',
          labelStyle: TextStyle( color: Colors.black,),
        ),
    ),
    const SizedBox(height: 20.0,),
     TextField(
       controller: phone,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Phone Number',
          labelStyle: TextStyle( color: Colors.black,),
        ),
    ),  const SizedBox(height: 20.0,),
    TextField(
       controller: phone,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          labelStyle: TextStyle( color: Colors.black,),
        ),
    ),
    
    const SizedBox(height: 20.0,),
      ElevatedButton.icon(onPressed: (){

if (fullName.text.isNotEmpty && phone.text.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Client();
                      }));
                    } else {
                      if (fullName.text.isEmpty) {
                        
                        // setState(() {
                        //   er1 = true;
                        // });
                        // if (phone.text.isEmpty) {
                        //   setState(() {
                        //     er2 = true;
                        //   });
                        // }
                      }
                    }

      }
      
      , icon: const Icon(Icons.app_registration), 
      style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              textStyle:
                 const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          label: const Text('Register'),)
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
