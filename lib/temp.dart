// import 'package:flutter/material.dart';

// class ClientStatusDropDown extends StatefulWidget {
//   ClientStatusDropDown(
//       {Key? key, required this.locations, required this.changeData})
//       : super(key: key);
//   List<String> locations;
//   VoidCallback changeData;
//   @override
//   _ClientStatusDropDownState createState() => _ClientStatusDropDownState();
// }

// class _ClientStatusDropDownState extends State<ClientStatusDropDown> {
//   String? newValue;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 2),
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.black,
//       ),
//       child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
//           child: DropdownButton<String>(
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//             hint: const Text('Choose Status'),
//             isExpanded: false,
//             value: newValue,
//             focusColor: Colors.black,
//             items: widget.locations.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(
//                   value,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               );
//             }).toList(),
//             dropdownColor: Colors.black,
//             onChanged: (value) => {
//               setState(() {
//                 newValue = value;
//                 widget.changeData();
//                 print(newValue);
//               })
//             },
//           )),
//     );
//   }
// }

// class StatusPage extends StatefulWidget {
//   StatusPage({Key? key}) : super(key: key);

//   @override
//   State<StatusPage> createState() => _StatusPageState();
// }

// class _StatusPageState extends State<StatusPage> {
//   final List<String> _locations = ['Shop', 'Tailor', 'Barber'];
//   String selectedTrade = '';
//   bool hasselected = false;

//   void changeSelection(String selected) {

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.black87.withAlpha(80),
//       child: Center(child: ClientStatusDropDown(locations: _locations)} )),
//     );
//   }
// }
