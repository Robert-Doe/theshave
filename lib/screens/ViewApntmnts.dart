import 'package:flutter/material.dart';

void main(){
  runApp(const MyApps());
}

class MyApps extends StatefulWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
          centerTitle: true,
          backgroundColor: Colors.white,
          title:Text("Appointments",style: styletitle, ) ,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
  Queued(),
              Pending()

            ],
          ),
        ),
      )
    );
  }
}
var stylehead=TextStyle(
    fontWeight: FontWeight.bold,fontSize: 16
);
var stylesub=TextStyle(
    fontWeight: FontWeight.w300,fontSize: 18
);
var styletitle=TextStyle(
    fontWeight: FontWeight.bold,fontSize: 23,color: Colors.black
);
Widget Queued(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Queued Appointments",style: stylehead,),
          SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("By . Andy | Today . 12:00 pm",style:stylehead ,

            ),
subtitle:Text("Service . Haircut | Type . Three steps",style:stylesub ,

),

            ),
          ),
          Divider(),
  Padding(
  padding: const EdgeInsets.all(10.0),
  child: ListTile(title: Text("By . Ludjo | Today . 12:30 pm",style:stylehead ,

  ),
  subtitle:Text("Service . Haircut | Type . Deep fading",style:stylesub ,

  ),

  ),
  ),

        ],
      ),
    ),
  );
}
Widget Pending(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Pending Approval",style: stylehead,),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("By . Henry | Today . 03:00 pm",style:stylehead ,

            ),
              subtitle:Text("Service . Haircut | Type . Three steps",style:stylesub ,

              ),
              trailing: ElevatedButton(onPressed: (){}, child: Text("Approve",style: stylehead,),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      shadowColor: Colors.pink[100],
                      primary: Colors.pink
                  )
              ),

            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(title: Text("By . lUCIO | Today . 02:30 pm",style:stylehead ,

            ),
              subtitle:Text("Service . Haircut | Type . Deep fading",style:stylesub ,

              ),
              trailing: ElevatedButton(onPressed: (){}, child: Text("Approve",style: stylehead,),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      shadowColor: Colors.pink[100],
                      primary: Colors.pink
                  )
              ),

            ),
          ),

        ],
      ),
    ),
  );
}