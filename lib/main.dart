import 'package:flutter/material.dart';
import 'package:project/filem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController title = new TextEditingController();
  final TextEditingController description = new TextEditingController();

  List<String> aut = [];
  List<String> autor = [];

  int _counter = 0;

  void _incrementCounter() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Form(
              //key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Update Todo"),
                  Text("Title"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: title,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text("Description"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: description,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      aut.add(title.text);
                      autor.add(description.text);
                      setState(() {});
                      Navigator.pop(
                        context, 
                          MaterialPageRoute(
                            builder: (context) =>
                              MyHomePage()
                        )
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
          child: new ListView.builder(
              itemCount: aut.length,
        itemBuilder: (BuildContext context, int index){
          return UserWidget(
            title: aut[index],
            desscription: autor[index],
          );
    },)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
