import 'package:flutter/material.dart';
import 'package:xml_json_web/parser.dart';
import 'package:xml_json_web/xml_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Android strings xml  >>>  Flutter json converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

makeGetRequest() async {
  // NOT  PRIVATE(NO _)
  parseXML(xmlDoc);
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();

  TextEditingController outController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    makeGetRequest();

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
            Expanded(
            // wrap your Column in Expanded
            flex: 12,
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    // wrap your Column in Expanded
                    flex: 1,
                    child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: inputController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Android String resource xml file',
                          ),
                        ),
                      ),
                  SizedBox(height: double.infinity, width: 2,
                  child: Container(color: Colors.grey,),
                  ),
                  const SizedBox( width: 20,),
                  Expanded(
                    // wrap your Column in Expanded
                    flex: 1,
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: outController,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Here will be result',
                      ),
                    ),
                  ),
                    ],
              )),

          SizedBox(height: 20,),
          Expanded(
            // wrap your Column in Expanded
            flex: 1,
            child:
              ElevatedButton(
                onPressed: () {
                 var result =  parseXML(inputController.text);
                 setState(() {
                   outController.text = result;
                 });
                },
                child: Text("CONVERT >>"),
              )),
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

