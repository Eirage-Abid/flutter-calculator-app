import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

//Entry point of the App
void main(){
  runApp(myCalculatorApp());
  return;
}

//Statefull widget for Calculator Application
class myCalculatorApp extends StatefulWidget {
  const myCalculatorApp({super.key});

  @override
  State<myCalculatorApp> createState() => _myCalculatorAppState();
}

class _myCalculatorAppState extends State<myCalculatorApp> {
  // Two Input field controller
  TextEditingController _number1Controller=TextEditingController();
  TextEditingController _number2Controller=TextEditingController();

  //variable for store the final result and show in text widget
  String result="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar with Title and custom background colour
        appBar: AppBar(
          title: Text("My Calculator App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,//set the title in center
          backgroundColor: Colors.teal[700],
        ),

        //Background color for the app body
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
              Center(
                child: Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: (){
                        _number1Controller.clear();
                        _number2Controller.clear();
                        setState(() {
                         result=""; //result will also be clear
                        });
                      },
                      child: Text("Clear", style: TextStyle(fontSize: 20, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.grey,
                        minimumSize: Size(150, 50),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
