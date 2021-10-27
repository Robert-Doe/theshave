import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bookappointment.dart';

void main() {
  runApp(Client());
}

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  static List<Widget> pages = [
    ClientHome(),
    Center(
      child: Text(
        "Personal Info",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Location()
  ];
  int currentindx = 0;

  void swithnav(int value) {
    setState(() {
      currentindx = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       
        body: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(

                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  background: Location() ,
                ),
              ),
             SliverFillRemaining(
               child:  ClientHome(),
             )



            ],
          ),
        ),
      ),
    );
  }
}

class ClientHome extends StatefulWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  State<ClientHome> createState() => ClientHomeState();
}

class ClientHomeState extends State<ClientHome> {
  PageController controller = PageController();
  bool select = true;
  bool unselect = false;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: PreferredSize(child: AppBar(
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Center(
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 40,
                      )),
                  subtitle: TextField(
                    decoration: InputDecoration(
                        hintText: "Search by name"
                    ),
                  ),
                ),
              ),
            ) ,
            bottom: PreferredSize(
             preferredSize:Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Center(
                  child: Container(
                    height: 50,
                    child: Center(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ChoiceChip(
                              label: const Text("Near you",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              labelPadding: EdgeInsets.only(
                                  left: 20, right: 20, top: 8, bottom: 8),
                              selected: selected == 0 ? select : unselect,
                              selectedColor: Colors.lightGreen,
                              disabledColor: Colors.black,
                              onSelected: (val) {
                                setState(() {
                                  selected = 0;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ChoiceChip(
                              label: const Text("Best Reviews",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              selected: selected == 1 ? select : unselect,
                              labelPadding: EdgeInsets.only(
                                  left: 20, right: 20, top: 8, bottom: 8),
                              selectedColor: Colors.lightGreen,
                              disabledColor: Colors.black,
                              onSelected: (val) {
                                setState(() {
                                  selected = 1;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ChoiceChip(
                              label: const Text("Favorites",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              selected: selected == 2 ? select : unselect,
                              labelPadding: EdgeInsets.only(
                                  left: 20, right: 20, top: 8, bottom: 8),
                              selectedColor: Colors.lightGreen,
                              disabledColor: Colors.black,
                              onSelected: (val) {
                                setState(() {
                                  selected = 2;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ), preferredSize: Size.fromHeight(100)),
          body:  SingleChildScrollView(
                child: Column(
                  children: [
                   
                    
                    Column(
                      children:List.generate(6, (index) {
                        return GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return AptmntPage();
                                      }));
                            },
                            child: ShopCard());
                      }),
                    )

                  ],
                ),

              )
           
        ));
  }
}





class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  LocationState createState() => LocationState();
}

class LocationState extends State<Location> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
var stylehead=TextStyle(
    fontWeight: FontWeight.bold,fontSize: 15
);
var stylesub=TextStyle(
    fontWeight: FontWeight.normal,fontSize: 14
);


Widget ShopCard(){
  return Padding(
    padding: const EdgeInsets.all(13.0),
    child: Card(
      elevation: 4,
      color: Colors.blueGrey[200],
      child: Container(
        height: 90,
// decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(6)
// ),
child: Row(
      children: [
        Image.network("https://images.pexels.com/photos/2076930/pexels-photo-2076930.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text("Street Cutz Shop",style: stylehead,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("20m away",style: stylesub,),
              ),
            ],
          ),
        )
      ],
),
      ),
    ),
  );
}