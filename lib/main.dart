import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_final/adding.dart';
import 'package:test_final/list_and_grid.dart';
import 'package:test_final/models/entries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> names=[
    'Nike',
    'Adidas',
    'Puma',
    'Balenociag',
    'Roadstar'
  ];
  List<String> doller=[
    '\$200',
    '\$800',
    '\$400',
    '\$900',
    '\$700',
    '\$200',
  ];
  List<String> images=[
    'images/img1.jpg',
    'images/img2.png',
    'images/img3.jpg',
    'images/img4.jpg',
  ];
  Category? list;
 bool _loading= false;
  void data() async{
  try{
    Response response= await Dio().get("http://jayanthi10.pythonanywhere.com/api/v1/categories/");
    setState(() {
     
      list=categoryFromJson(jsonEncode(response.data));

       print(".................${response.data}");
      _loading=true;
    });
  }
  catch(e){
    setState(() {
    _loading=true;
      
    });
    print(e);
  }
}
 

  @override
  void initState() {
    // TODO: implement initState
    data();
  }
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Color(0xffdcf0f9),
      //appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Container(
                          height: 40,
                          width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black),],
                              border: Border.all(width: 2,
                              color: Color.fromARGB(255, 9, 9, 9))),
                              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child:
                    Image.asset('images/man.jpg')
              ),
            ),
                        
              ],
            ),
            SizedBox(height: 15,),
              Container(
                              height: 50,
                              width: 300,
                              child: TextField(
                                        //obscureText: true,
                                        decoration: InputDecoration(
                                         prefixIcon: Icon(Icons.search,color: Color(0xffffffff  ),),
                                          border: OutlineInputBorder( 
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          hintText: 'Find shoes',
                                        ),
                                      ),
                            ),
                            SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Categories',style: TextStyle(color: Color(0xff2c3651),fontSize: 36,fontWeight: FontWeight.bold),),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {  
                                      return Add_page();
                                    }));
                                  },
                                  child: Icon(Icons.add)),
                              ],
                            ),list==null? CircularProgressIndicator():
                             Container(
                           height: 70,
                child: ListView.builder(
                    itemCount:list!.data!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      //return List_and_grid(
                   // names: '${list!.data![index].categoryName}', 
                    //  );
                      return Text("${list!.data![index].categoryName}");
                       
                    })
                ), list==null? CircularProgressIndicator():      
                             Container(
                      height: 540,
                      child: GridView.builder(
                itemCount: list!.categoryProducts!.length,
                shrinkWrap: true,           
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
                          childAspectRatio: 5/ 7,
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 14.0,
                          
                        ),
                        
                        physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                 return Grid_view(
                   images: 'http://jayanthi10.pythonanywhere.com/${list!.categoryProducts![index].categoryImage}',
                       names: '${list!.categoryProducts![index].categoryName}', 
                       doller: '${list!.categoryProducts![index].categoryId}');

                }
            ),)]),
      ),
        
      
    );
  }
}
