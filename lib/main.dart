import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calcolatrice'),
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

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    
    if (buttonText == "Cancella") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText =="-" || buttonText =="/" || buttonText =="X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == '.') {
      if(_output.contains('.')){
        print('Il numero contiene gia la virgola!');
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }

      if (operand == "-") {
        _output = (num1 - num2).toString();
      }

      if (operand == "X") {
        _output = (num1 * num2).toString();
      }

      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {

      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }


  Widget buildButton(String buttonText, bool isSymbol) {
    return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new RaisedButton(
                      color: Color(0xff0b161c),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(80.0)),
                      highlightColor: Color(0xff238788),
                      splashColor: Color(0xff238788),
                      textColor: isSymbol ? Color(0xff238788) : Colors.white,
                      padding: new EdgeInsets.all(30.0),
                      child: new Text(buttonText, 
                        style: TextStyle(
                          fontSize: 28,
                        ),),
                      onPressed: () => {
                        buttonPressed(buttonText) 
                      },
                    ),
                  ),
                );
  }





  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      
        body: new Container(
          decoration: new BoxDecoration(color: Color(0xff0b161c)),
          child: new Column(
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.only(top: 130, bottom: 140),
                child: new Container(
                  alignment: Alignment.topRight,
                  padding: new EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12
                    ),
                  child: new Text(output, style: TextStyle(
                    fontSize: 50,
                    color: Color(0xff238788)
                  ),)),
              ),


              Column(
                children: <Widget>[
                  Row(children: [
                    buildButton('7',false),
                    buildButton('8',false),
                    buildButton('9',false),
                    buildButton('/',true),
                  ]),

                  Row(children: [
                    buildButton('4',false),
                    buildButton('5',false),
                    buildButton('6',false),
                    buildButton('X',true),
                  ]),

                  Row(children: [
                    buildButton('1',false),
                    buildButton('2',false),
                    buildButton('3',false),
                    buildButton('-',true),
                  ]),

                  Row(children: [
                    buildButton('.',false),
                    buildButton('0',false),
                    buildButton('00',false),
                    buildButton('+',true),
                  ]),
                  Row(children: [
                    buildButton('Cancella',true),
                    buildButton('=',true),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
