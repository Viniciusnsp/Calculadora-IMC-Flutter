import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculadora de IMC'),
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
  double _imc = 0.0;
  double altura = 0.0;
  double peso = 0.0;
  double imcFormat = 0.0;

   _calculoIMC(double altura, double peso) {
    setState(() {
      _imc = peso / (altura * altura);
      imcFormat = double.parse(_imc.toStringAsPrecision(2));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text){
                altura = double.parse(text);
              },
                textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '0.0 metros',

              )
            ),
            TextField(
                onChanged: (text){
                  peso = double.parse(text);
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.0 kg',
                )
            ),

            Text(
              'Seu IMC é:',
            ),
            Text(
              '$imcFormat',
              style: Theme.of(context).textTheme.headline4,
            ),

          new RaisedButton(
            child: const Text('Calcular IMC'),
            color: Colors.white,
            elevation: 4.0,
            splashColor: Colors.white,
            onPressed: () {
                _calculoIMC(altura, peso);
              },
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
