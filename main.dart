/*
import 'package:flutter/material.dart';

void main()
{
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin
{
   late AnimationController _iconAnimationController;
    late Animation<double> _iconAnimation;

    @override

    void initState()
    {
      super.initState();
      _iconAnimationController=new AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 500)
      );
      _iconAnimation=new CurvedAnimation(
          parent: _iconAnimationController,
          curve: Curves.bounceOut
      );
      _iconAnimation.addListener(() {this.setState(() {

      });});

      _iconAnimationController.forward();
    }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: new Stack(
        fit: StackFit.expand,

        children: [
          new Image(
              image: new AssetImage("assets/medhaj.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new FlutterLogo(
                size: 100


              ),
              new Form(
                  child: Theme(
                    data: new ThemeData(
                brightness: Brightness.dark,
                      primarySwatch: Colors.blueGrey
    ),
                    child: new Column(
                      children: [
                        new TextFormField(
                          decoration: new InputDecoration(
                              hintText: "Enter Email Id",
                              hintStyle: TextStyle(color: Colors.white)

                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                              hintText: "Enter Password ",
                              hintStyle: TextStyle(color: Colors.white)

                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                            padding: EdgeInsets.only(top: 30.0)
                        ),
                        new MaterialButton(
                          onPressed: (){},
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: new Text("Log in"),
                        )
                      ],
                    ),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  double _result = 0.0;

  void _addToInput(String value) {
    setState(() {
      _input += value;
    });
  }





  void _calculateResult() {
    try {
      final expression = Parser().parse(_input);
      final contextModel = ContextModel();

      setState(() {
        _result = expression.evaluate(EvaluationType.REAL, contextModel);
      });
    } catch (e) {
      setState(() {
        _result = 0.0;
        _input = '';
      });
    }
  }


// ... Remaining code ...


  void _clearInput() {
    setState(() {
      _input = '';
      _result = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _input,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _result.toString(),
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: [
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (buttonText == '=') {
            _calculateResult();
          } else if (buttonText == 'C') {
            _clearInput();
          } else {
            _addToInput(buttonText);
          }
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
