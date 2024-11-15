import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Icreativez Flutter Calculator",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                // Result Display on Top
                Text(
                  result,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Number 1 Text Field with Line Style
                Container(
                  width: 250,
                  child: TextField(
                    controller: _number1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter a number",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Number 2 Text Field with Line Style
                Container(
                  width: 250,
                  child: TextField(
                    controller: _number2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter a number",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton("+", Colors.blue, () => _calculate('+')),
                    SizedBox(width: 20),
                    _buildButton("-", Colors.blue, () => _calculate('-')),
                    SizedBox(width: 20),
                    _buildButton("*", Colors.blue, () => _calculate('*')),
                    SizedBox(width: 20),
                    _buildButton("/", Colors.blue, () => _calculate('/')),
                  ],
                ),

                SizedBox(height: 20),

                // Clear Button
                ElevatedButton(
                  onPressed: _clearFields,
                  child: Text("Clear", style: TextStyle(fontSize: 20, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    minimumSize: Size(150, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Button Widget with Rectangular Style
  Widget _buildButton(String symbol, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(symbol, style: TextStyle(fontSize: 30, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: Size(60, 60),
      ),
    );
  }

  // Calculation Logic
  void _calculate(String operation) {
    String num1Text = _number1Controller.text;
    String num2Text = _number2Controller.text;

    if (num1Text.isNotEmpty && num2Text.isNotEmpty) {
      int number1 = int.parse(num1Text);
      int number2 = int.parse(num2Text);
      setState(() {
        switch (operation) {
          case '+':
            result = "${number1 + number2}";
            break;
          case '-':
            result = "${number1 - number2}";
            break;
          case '*':
            result = "${number1 * number2}";
            break;
          case '/':
            result = number2 != 0 ? "${number1 / number2}" : "Cannot divide by zero";
            break;
        }
      });
    } else {
      Fluttertoast.showToast(
        msg: num1Text.isEmpty && num2Text.isEmpty ? 'Both fields are empty!' : 'One field is empty!',
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.deepOrangeAccent,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
        timeInSecForIosWeb: 1,
      );
    }
  }

  // Clear Fields Function
  void _clearFields() {
    setState(() {
      _number1Controller.clear();
      _number2Controller.clear();
      result = "";
    });
  }
}





/**import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Entry point of the App
void main(){
  runApp(CalculatorApp());
  return;
}

//Statefull widget for changing state at runtime
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // Two Input fields
  TextEditingController _number1Controller=TextEditingController();
  TextEditingController _number2Controller=TextEditingController();

  //A variable to store result
  String result="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar for title
        appBar: AppBar(
          title: Text("Icreativez Calculator App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,//set the title in center
          backgroundColor: Colors.amber,
        ),

        //Background color for the app
        backgroundColor:Colors.blueGrey[200],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                width: 250,
                //Text Field for taking Number 1 as a input
                child: TextField(
                  controller: _number1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "  Number 01",
                      filled: true,
                      fillColor: Colors.white,   //Give white colour inside the textfield for good looking
                      hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.vertical( bottom: Radius.circular(15)),
                        borderSide: BorderSide(
                        color: Colors.green,
                        width: 3
                      )
                    )
                  ),
                ),
              ),

              //give size above the second text field
              SizedBox(height: 30),

              //Text Field for taking Number 1 as a input
              Container(
                width: 250,
                child: TextField(
                  controller: _number2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "  Number 02",
                      filled: true,
                      fillColor: Colors.white,  //Give white colour inside the textfield for good looking
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical( bottom : Radius.circular(15)),
                          borderSide: BorderSide(
                              color: Colors.deepOrange,
                              width: 3
                          )
                      )
                  ),
                ),
              ),

              //give size above the second text field
              SizedBox(height: 40),

             //Text widget for showing Calculation result
             Padding(
               padding: const EdgeInsets.all(20),
               child: Container(
                 height: 50,
                 width: double.infinity,
                 child: Text("              "
                     "$result", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                 ),
               ),
             ),

              //give size above the second text field
              SizedBox(height: 10),

              //Give pedding to four buttons
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Elevated button for performing addition operation
                    ElevatedButton(onPressed: (){
                      String? num1Text=_number1Controller.text;
                      String? num2Text=_number2Controller.text;

                      // Check for non-empty input fields
                      if(num1Text.isNotEmpty && num2Text.isNotEmpty){
                        int number1 = int.parse(num1Text);
                        int number2 = int.parse(num2Text);

                        setState(() {
                          result = ("Sum is: ${number1+number2}"); //Storing calculation in result variable
                        });

                      }else if(num1Text.isEmpty && num2Text.isEmpty){  // Check for empty non-input fields, and show toast if both fields are empty
                        Fluttertoast.showToast(
                            msg: 'Both Fields is Empty!',
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.deepOrangeAccent,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0,
                          timeInSecForIosWeb: 1,
                        );
                      }else if(num1Text.isEmpty || num2Text.isEmpty) { // Check for empty input fields, and show toast if there is any field is empty
                        Fluttertoast.showToast(
                          msg: 'One Field is Empty!',
                          textColor: Colors.black,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.deepOrangeAccent,
                          gravity: ToastGravity.BOTTOM,
                          fontSize: 16.0,
                          timeInSecForIosWeb: 1,
                        );
                      }

                    }, child: Text("+", style: TextStyle(fontSize: 40, color: Colors.black )), // Displays the addition symbol ("+") with fond size 40 and colour is black.
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.green,
                        minimumSize: Size(150, 80)),
                    ),

                    ElevatedButton(onPressed: (){
                      String? num1Text = _number1Controller.text;
                      String? num2Text = _number2Controller.text;

                      if(num1Text.isNotEmpty && num2Text.isNotEmpty){
                        int number1 = int.parse(num1Text);
                        int number2 = int.parse(num2Text);
                        setState(() {
                          result = ("Substraction is: ${number1-number2}"); //Storing calculation in result variable
                        });
                      }else if(num1Text.isEmpty && num2Text.isEmpty){ // Check for empty non-input fields, and show toast if both fields are empty
                        Fluttertoast.showToast(
                          msg: 'Both Fields is Empty!',
                          textColor: Colors.black,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.deepOrangeAccent,
                          gravity: ToastGravity.BOTTOM,
                          fontSize: 16.0,
                          timeInSecForIosWeb: 1,
                        );
                      }else if(num1Text.isEmpty || num2Text.isEmpty) { // Check for empty input fields, and show toast if there is any field is empty
                        Fluttertoast.showToast(
                          msg: 'One Field is Empty!',
                          textColor: Colors.black,
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.deepOrangeAccent,
                          gravity: ToastGravity.BOTTOM,
                          fontSize: 16.0,
                          timeInSecForIosWeb: 1,
                        );
                      }
                    }, child: Text("-", style: TextStyle( fontSize: 50, color: Colors.black )), // Displays the substraction symbol ("-") with fond size 50 and colour is black.
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.red,
                        minimumSize: Size(150, 80),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){
                        String? num1Text = _number1Controller.text;
                        String? num2Text = _number2Controller.text;

                        if(num1Text.isNotEmpty && num2Text.isNotEmpty){
                          int number1 = int.parse(num1Text);
                          int number2 = int.parse(num2Text);

                          setState(() {
                            result = ("Multiplication is: ${number1*number2}"); //Storing calculation in result variable
                          });
                        }else if(num1Text.isEmpty && num2Text.isEmpty){ // Check for empty non-input fields, and show toast if both fields are empty
                          Fluttertoast.showToast(
                            msg: 'Both Fields is Empty!',
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.deepOrangeAccent,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0,
                            timeInSecForIosWeb: 1,
                          );
                        }else if(num1Text.isEmpty || num2Text.isEmpty) { // Check for empty input fields, and show toast if there is any field is empty
                          Fluttertoast.showToast(
                            msg: 'One Field is Empty!',
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.deepOrangeAccent,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0,
                            timeInSecForIosWeb: 1,
                          );
                        }
                      }, child: Text("*", style: TextStyle( fontSize: 40, color: Colors.black )), // Displays the multiplication symbol ("*") with fond size 40 and colour is black.
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.blue,
                          minimumSize: Size(150, 80),
                        ),
                      ),

                      ElevatedButton(onPressed: (){
                        String? num1Text = _number1Controller.text;
                        String? num2Text = _number2Controller.text;

                        if(num1Text.isNotEmpty && num2Text.isNotEmpty){
                          int number1 = int.parse(num1Text);
                          int number2 = int.parse(num2Text);

                          if(number2!=0) {
                            setState(() {
                              result =
                              ("Division is: ${number1 / number2}"); //Storing calculation in result variable
                            });
                          }else {
                            Fluttertoast.showToast(
                              msg: '0 is not divisible', //Check condition if 0 is in denominator then show toast that ZERO is not divisible.
                              textColor: Colors.black,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.deepOrangeAccent,
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16.0,
                              timeInSecForIosWeb: 1,
                            );
                          }
                        }else if(num1Text.isEmpty && num2Text.isEmpty){ // Check for empty non-input fields, and show toast if both fields are empty
                          Fluttertoast.showToast(
                            msg: 'Both Fields is Empty!',
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.deepOrangeAccent,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0,
                            timeInSecForIosWeb: 1,
                          );
                        }else if(num1Text.isEmpty || num2Text.isEmpty) { // Check for empty input fields, and show toast if there is any field is empty
                          Fluttertoast.showToast(
                            msg: 'One Field is Empty!',
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.deepOrangeAccent,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0,
                            timeInSecForIosWeb: 1,
                          );
                        }
                        }, child: Text("/", style: TextStyle( fontSize: 40, color: Colors.black )), // Displays the division symbol ("/") as the button label with a font size of 40 and black color.
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.orange,
                          minimumSize: Size(150, 80),
                        ),
                      ),
                    ],
                  )),

            ],
          ),
        )
      )
    );
  }
}
**/