import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ViewApntmnts.dart';

void main() {
  runApp(Shop());
}
var urls=[
  "https://i.pinimg.com/originals/c0/42/05/c04205e9ceea185248a2fea57a097013.jpg",
  "https://lh4.googleusercontent.com/cagmRTOuku0HdjeIddWnn08Hbux8JMT2tbp22XM7f5qU6xw5Ak3T0zqbWoUixfw7B4IcdDZ0HMx7f_BIE8NJPhMbwO9FgfY4lqciL5xmMP8EFY4osPcvh8BqZj1YFTDkTvg2ZH8W",
  "https://i.pinimg.com/originals/40/12/e0/4012e065e6d4fd525ac9c43e15731ab1.jpg",
  "https://content.latest-hairstyles.com/wp-content/uploads/temp-fade-haircuts-1000x690.jpg",
  "https://media.gq.com/photos/575841b355243a9335f33944/master/w_2000,h_2666,c_limit/the-barbershop-fade-gq-style-0616-04.jpg",
  "https://i.pinimg.com/736x/ab/bb/78/abbb78a5f1e835497fef8ea6254041cb.jpg"

];
class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => ShopState();
}

class ShopState extends State<Shop> {
  static List<Widget> pages = [
   ShopHome(),
   TopBox()
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
        floatingActionButton: Stack(
          children: [
            FloatingActionButton(onPressed: (){},
            child:Icon(Icons.menu),
            )
          ],
          
        ),
        body: CustomScrollView(
          slivers:  [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(5)
              ),
              elevation: 6,
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                background: pages.elementAt(1) ,
              ),
            )
            ,
            SliverFillRemaining(
              child: pages.elementAt(0),
            )


          ],

        ),
      ),
    );
  }
}

Widget TopBox(){
  return Container(
    color: Colors.black,
    height: 230,
    child: Padding(
      padding: EdgeInsets.only(top: 60),
      child: Center(
        child: Column(
          children: [
            ClipRRect(
                borderRadius:BorderRadius.circular(10),
                child: Image.network("https://images.pexels.com/photos/2076930/pexels-photo-2076930.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                 fit: BoxFit.cover,height: 165,width: 350,)),
            Padding(padding: EdgeInsets.all(10),
              child: Text("Street Cutz",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
          ],
        ),
      ),
    ),
  );
}


class ShopHome extends StatefulWidget {
  const ShopHome({ Key? key }) : super(key: key);

  @override
  _ShopHomeState createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {

  Widget Appointments(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(

        elevation: 3,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListTile(title: Text("Appointments 4",style: stylehead,),
                trailing: IconButton(onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) {
                            return MyApps();
                          }));
                }, icon: Icon(Icons.arrow_forward_ios)),
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

  Widget build(BuildContext context) {
    return Container(
        height:500,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: AppBar(
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
              ),
              body:  TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              ListTile(
                              
                                title: Text("Working Hours ",style: stylehead,),
                                subtitle: Text("08:00 am - 05:30 pm",style: stylesub,),
                              ),
                              ExpansionTile(title: Text("Working days",style: stylehead),
                              children: [
                                Text("Monday - Friday",style: stylehead,),

                              ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Details(),

                        ),
                        Services(),
                        Barbers(),
                        Appointments()
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
var stylehead=TextStyle(
    fontWeight: FontWeight.bold,fontSize: 13
);
var stylesub=TextStyle(
    fontWeight: FontWeight.normal,fontSize: 18
);


Widget Details(){
  return ExpansionTile(
    title: Text("Shop info",style: stylehead,),
    children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text("Name",style: stylehead,),
          subtitle: Text("Street Cutz",style: stylesub,),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.phone),
          title: Text("Phone",style: stylehead,),
          subtitle: Text("0271302702",style: stylesub,),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          leading: Icon(Icons.cut),
          title: Text("Location",style: stylehead,),
          subtitle: Text("Obiri Yeboah Street,Kumasi",style: stylesub,),
        ),
      ),


    ],
  );
}

Widget Ratings(){
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: ListView(
            shrinkWrap: true,
            children: [
              Stars(4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cut was pretty great",style:stylesub ,),
              )

            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          child: ListView(
            shrinkWrap: true,
            children: [
              Stars(5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("This cut was excellent!",style:stylesub ,),
              )

            ],
          ),
        ),
      ),

    ],
  );
}

Widget Stars(int stars){
  return Container(
    height: 15,
    child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(stars, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5,right: 5),
            child: Icon(Icons.star,color: Colors.black,),
          );
        })
    ),
  );
}

Widget Works(){
  return CustomScrollView(
    primary: false,
    slivers: <Widget>[
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverGrid.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children:List.generate(urls.length, (index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [

                  Card(
                      elevation:3,
                      child: Image.network(urls[index],height: 130,width: 210,)),
                  Text("Style "+index.toString())
                ],
              ),
            );
          })
        ),
      ),
    ],
  );
}


 Widget Services(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListView(
        shrinkWrap: true,
        children: [
         Text("Services",style: stylehead,),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("Hair Cut",style:stylesub ,),
            subtitle: ElevatedButton(onPressed: (){}, child: Text("GALLERY",style: stylehead,),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    shadowColor: Colors.pink[100],
                    primary: Colors.pink,
                 fixedSize: Size.fromHeight(10)
                )
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("Beard Trimming",style:stylesub ,),
              subtitle: ElevatedButton(onPressed: (){}, child: Text("GALLERY",style: stylehead,),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      shadowColor: Colors.pink[100],
                      primary: Colors.pink
                  )
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:ListTile(title: Text("Hair Coloring",style:stylesub ,),

              subtitle: ElevatedButton(onPressed: (){}, child:
              Text("GALLERY",style: stylehead,),style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                shadowColor: Colors.pink[100],
                primary: Colors.pink
              )),),
          )

        ],
      ),
    ),
  );
}
Widget Barbers(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Barbers",style: stylehead,),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("Joe Boy",style:stylesub ,),

              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("Yaw",style:stylesub ,),

              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
            ),
          ),

        ],
      ),
    ),
  );
}
