import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'ViewApntmnts.dart';

void main() {
  runApp(Barber(name: "",phone: "",));
}

var urls = [
  "https://i.pinimg.com/originals/c0/42/05/c04205e9ceea185248a2fea57a097013.jpg",
  "https://lh4.googleusercontent.com/cagmRTOuku0HdjeIddWnn08Hbux8JMT2tbp22XM7f5qU6xw5Ak3T0zqbWoUixfw7B4IcdDZ0HMx7f_BIE8NJPhMbwO9FgfY4lqciL5xmMP8EFY4osPcvh8BqZj1YFTDkTvg2ZH8W",
  "https://i.pinimg.com/originals/40/12/e0/4012e065e6d4fd525ac9c43e15731ab1.jpg",
];

class Barber extends StatefulWidget {
   Barber({Key? key,required this.name,required this.phone}) : super(key: key);
  String name;
  String phone;
  @override
  State<Barber> createState() => BarberState();
}

class BarberState extends State<Barber> {
  static List<Widget> pages = [BarberHome(), TopBox()];
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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 6,
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                background: pages.elementAt(1),
              ),
            ),
            SliverFillRemaining(
              child: pages.elementAt(0),
            )
          ],
        ),
      ),
    );
  }
}

Widget TopBox() {
  return Container(
    color: Colors.black,
    height: 230,
    child: Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(
                  "https://images.pexels.com/photos/2076930/pexels-photo-2076930.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  height: 130,
                  width: 130,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Kwaku Barber",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class BarberHome extends StatefulWidget {
  const BarberHome({Key? key}) : super(key: key);

  @override
  _BarberHomeState createState() => _BarberHomeState();
}

class _BarberHomeState extends State<BarberHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                titleSpacing: 0,
                 elevation: 6,
                bottom: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.info)),
                    Tab(icon: Icon(Icons.rate_review)),
                    Tab(icon: Icon(Icons.work)),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Details(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyApps();
                                }));
                              },
                              child: Appointments()),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: SingleChildScrollView(child: Ratings()),
                  ),
                  Works(),
                ],
              ),
            ),
          ),
        ));
  }
}

var stylehead = TextStyle(fontWeight: FontWeight.bold, fontSize: 13);
var stylesub = TextStyle(fontWeight: FontWeight.normal, fontSize: 21);

Widget Details() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Full Name",
            style: stylehead,
          ),
          subtitle: Text(
            "Kwaku Nkrumah",
            style: stylesub,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.phone),
          title: Text(
            "Phone",
            style: stylehead,
          ),
          subtitle: Text(
            "0271302702",
            style: stylesub,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.cut),
          title: Text(
            "Shop",
            style: stylehead,
          ),
          subtitle: Text(
            "Obiri Yeboah",
            style: stylesub,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.transgender),
          title: Text(
            "Sex",
            style: stylehead,
          ),
          subtitle: Text(
            "Male",
            style: stylesub,
          ),
        ),
      )
    ],
  );
}

Widget Ratings() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: ListView(
            shrinkWrap: true,
            children: [
              Stars(4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cut was pretty great",
                  style: stylesub,
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: ListView(
            shrinkWrap: true,
            children: [
              Stars(5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "This cut was excellent!",
                  style: stylesub,
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Widget Stars(int stars) {
  return Container(
    height: 15,
    child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(stars, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5, right: 5),
            child: Icon(
              Icons.star,
              color: Colors.black,
            ),
          );
        })),
  );
}

Widget Works() {
  return CustomScrollView(
    primary: false,
    slivers: <Widget>[
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: List.generate(urls.length, (index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Card(
                        elevation: 3,
                        child: Image.network(
                          urls[index],
                          height: 130,
                          width: 210,
                        )),
                    Text("Style " + index.toString())
                  ],
                ),
              );
            })),
      ),
    ],
  );
}

Widget Appointments() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              title: Text(
                "Appointments 2",
                style: stylehead,
              ),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}
