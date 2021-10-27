import 'package:flutter/material.dart';
import 'package:theshave/screens/shopside.dart';

class ShopRegistryScreen extends StatefulWidget {
  const  ShopRegistryScreen({Key? key}) : super(key: key);

  @override
  State< ShopRegistryScreen> createState() =>  ShopRegistryScreenState();
}

class  ShopRegistryScreenState extends State< ShopRegistryScreen> {
  TextEditingController shopName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register as a Shop',style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:  [ TextField(
            controller: shopName,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter shop name',
          labelStyle: TextStyle( color: Colors.black,),
        ),
    ),
    const SizedBox(height: 20.0,),
     TextField(
      controller: phone,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Phone Number',
          labelStyle: TextStyle( color: Colors.black,),
        ),
    ),  const SizedBox(height: 20.0,),
     TextField(
       controller: location,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Location',
          labelStyle: TextStyle( color: Colors.black),
        ),
    ),
    const SizedBox(height: 20.0,),
      ElevatedButton.icon(onPressed: (){

         if (shopName.text.isNotEmpty && phone.text.isNotEmpty && location.text.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Shop(
                          
                        );
                      }));
                    }
      }, icon: const Icon(Icons.mark_email_unread_sharp), 
      style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              textStyle:
                 const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          label: const Text('Start Service'),)
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
