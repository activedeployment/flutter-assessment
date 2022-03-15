import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterassessment/api/product_response.dart';
import 'package:flutterassessment/model/Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Product App',
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
      home: const ProductPage(title: 'Flutter Product App'),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  List<Product> products = [];

  @override
  void initState(){
    super.initState();
    
    var jsonData = jsonDecode(product_data);

    // print(jsonData[0].id);
    for(var i = 0; i < 20; i++){
      Product p1 = Product(id: i, name: jsonData[i]['name'], description: jsonData[i]['description'], color: jsonData[i]['color']);
      products.add(p1);
    }

    // Product p2 = Product(id: jsonData[1]['id'], name: jsonData[1]['name'], description: jsonData[1]['description'], color: jsonData[1]['color']);
    // Product p3 = Product(id: jsonData[2]['id'], name: jsonData[2]['name'], description: jsonData[2]['description'], color: jsonData[2]['color']);
    // Product p4 = Product(id: jsonData[3]['id'], name: jsonData[3]['name'], description: jsonData[3]['description'], color: jsonData[3]['color']);
    //
    // products.add(p2);
    // products.add(p3);
    // products.add(p4);
  }


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(var i = 0; i < products.length; i++)
              Container(
                color: (products[i].color == 'green')? Colors.green
                  : (products[i].color == 'red')? Colors.red
                  : (products[i].color == 'blue')? Colors.blue
                  : (products[i].color == 'yellow')? Colors.yellow
                  : Colors.transparent,
                child: Row(
                    children: [
                      Column(
                          children: [
                            Container(
                                height: 50,
                                child: Text(products[i].name)
                            )
                          ]
                      ),
                      SizedBox(width: 100),
                      Column(
                          children: [
                            Row(
                                children: [
                                  Container(
                                      height: 25,
                                      child: Text(products[i].id.toString())
                                  )
                                ]
                            ),
                            Row(
                                children: [
                                  Container(
                                      height: 25,
                                      child: Text(products[i].description)
                                  )
                                ]
                            )
                          ]
                      )
                    ]
                )
              )
          ]
        )
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
