import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //

        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Sample calculator'),
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


  Widget buildButton(String buttonText) {
    return Expanded(
                  child: new OutlineButton(
                    padding: new EdgeInsets.all(24.0),
                    child: new Text(buttonText, 
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    onPressed: () => {
                      buttonPressed(buttonText) 
                    },
                  ),
                );
  }





  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12
                  ),
                child: new Text(output, style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
                ),)),

              new Expanded(
                child: new Divider(),
              ),

              Column(
                children: <Widget>[
                  Row(children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ]),

                  Row(children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('X'),
                  ]),

                  Row(children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ]),

                  Row(children: [
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('00'),
                    buildButton('+'),
                  ]),
                  Row(children: [
                    buildButton('Cancella'),
                    buildButton('='),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
