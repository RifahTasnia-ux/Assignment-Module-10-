//import 'dart:js';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {

  runApp(DevicePreview(
      builder: (context){
      return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map<String,dynamic>> myItems =
  [
    {
      'dressName': 'Pullover',
      'imageLink': "images/photo1.png",
      'color': 'Black',
      'size': 'L',
      'amount': 0,
      'unitPrice': 51,

    },
    {
      'dressName': 'T-Shirt',
      'imageLink': "images/photo2.png",
      'color': 'Gray',
      'size': 'L',
      'amount': 0,
      'unitPrice': 30,

    },
    {
      'dressName': 'Sport Dress',
      'imageLink': "images/photo3.png",
      'color': 'Black',
      'size': 'M',
      'amount': 0,
      'unitPrice': 43,

    },
  ];
   int amount1 = 0;
   int amount2 = 0;
   int amount3 = 0;
   int unitPrice1 = 0;
   int unitPrice2 = 0;
   int unitPrice3 = 0;
   int total = 0;

  void myAlterDialog(BuildContext context, String dress) {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => SimpleDialog(
        title: Center(child: Text('Congratulations',style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        children: [
          Container(
            child: Column(children: [Text(''),Text('You have added'),Text('5'),Text('$dress on your bag!'),Text('')],),
          ),
          SimpleDialogOption( // multiple possible
            onPressed: () {
              Navigator.pop(context, 'Option 2');
            },
            child: ElevatedButton(
              onPressed: (){Navigator.pop(context, 'OKAY');},
              child: Text('OKAY'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffEF0304),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ); //.then((value) => print('Selected option: $value'));
  }
  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0), // here the desired height
          child: AppBar(

          )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
                child: Column(
                  children: [
                   Expanded(
                     flex: 2,
                       child: Container(
                         alignment: Alignment.bottomRight,
                         padding: const EdgeInsets.all(8.0),
                         child:
                         const Icon(Icons.search, size: 30, color: Colors.black),
                         )
                       ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.bottomLeft,
                          child: Text("My Bag", style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          ),),
                        )),
                  ],
                )
            ),
            Expanded(
              flex: 6,

            child:ListView.builder(
              shrinkWrap: true,
                itemCount: myItems.length,
                itemBuilder: (context, index){
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         Image(
                           height: 122,
                           width: 100,
                           image: AssetImage(myItems[index]['imageLink'].toString()),
                           fit: BoxFit.fill,
                         ),
                        SizedBox(width: 10,),

                        Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(myItems[index]['dressName'].toString(),
                               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                             SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Color :",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
                                 Text(myItems[index]['color'].toString(),
                                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                 Text("  Size :",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
                                 Text(myItems[index]['size'].toString(),
                                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                               ],
                             ),
                             SizedBox(height: 5,),

                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CircleAvatar(
                                   radius: 20,
                                   backgroundColor: Colors.white,
                                   child: IconButton(
                                     icon: Icon(
                                       Icons.remove,
                                       color: Colors.black,
                                     ),
                                     onPressed: (){
                                       if(myItems[index]['amount']!= 0 && total>=51){
                                         myItems[index]['amount']--;
                                         if(myItems[index]['amount']==5){
                                           myAlterDialog(context, "${myItems[index]['dressName']}");}
                                         setState(() {});
                                         if(myItems[index]['unitPrice']==51){
                                           total = total - (amount1 * 51);
                                           print('$total');
                                         }
                                         else if(myItems[index]['unitPrice']==30){
                                           total = total - (amount1 * 30);
                                           print('$total');
                                         }
                                         else if(myItems[index]['unitPrice']==43){
                                           total = total - (amount1 * 43);
                                           print('$total');
                                         }
                                       }

                                       },

                                   ),
                                 ),
                                 Text("   "+'${myItems[index]['amount']}'+"   ",style: TextStyle(fontSize: 30),),
                                 CircleAvatar(
                                   radius: 20,
                                   backgroundColor: Colors.white,
                                   child: IconButton(
                                     icon: Icon(
                                       Icons.add,
                                       color: Colors.black,
                                     ),
                                     onPressed: (){
                                       myItems[index]['amount']++;
                                       amount1 = myItems[index]['amount'];
                                       setState(() {});
                                       if(myItems[index]['unitPrice']==51){
                                         total = total + (amount1*51);
                                         print('$total');
                                       }
                                       else if(myItems[index]['unitPrice']==30){
                                         total = total + (amount1*30);
                                         print('$total');
                                       }
                                       else if(myItems[index]['unitPrice']==43){
                                         total = total + (amount1*43);
                                         print('$total');
                                       }
                                       if(myItems[index]['amount']==5){
                                         myAlterDialog(context, "${myItems[index]['dressName']}");}

                                     },
                                   ),
                                 ),

                               ],

                             ),

                           ],
                         ),

                    const Spacer(flex: 3,),
                        SizedBox(width: 10,),
                        Column(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                padding: const EdgeInsets.all(3.0),
                                child:
                                const Icon(Icons.more_vert, size: 30, color: Colors.black),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.all(28.0),
                                child:
                                Text(myItems[index]['unitPrice'].toString() +""+r"$",
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                              )

                            ]

                        )
                      ],
                    )
                  ],
                ),
              );
            }),

            ),
            Expanded(
              flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Total amounts:                          "+"$total"+""+r"$", style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                          ),

                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: ElevatedButton(onPressed: (){MySnackBar("Congratulations! You've successfully checked out.",context);},
                            child: Text("Check Out"),
                            style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                                onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                            textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)
                            ),


                          ),
                        )
                    ),

                  ],
                )
            ),

          ],
        ),
    );
  }
}


