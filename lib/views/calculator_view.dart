// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x=0;
  int y=0;
  num z=0;
  final displayOneController=TextEditingController();
  final displayTwoController=TextEditingController();
 @override
 void initState(){
  super.initState();
  displayOneController.text=x.toString();
  displayTwoController.text=y.toString();
 }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children:  [
            Center(
              child: Text(
                "Calculator",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            DisplayOne(hint:"Enter First Number",controller: displayOneController,),
            SizedBox(height: 20),
            DisplayOne(hint:"Enter Second Number",controller: displayTwoController,),
            SizedBox(height: 40),
              Text(
              z.toString(),
              style: TextStyle(
                fontSize:60,
                fontWeight: FontWeight.bold
              ),
            ),
            Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        z=num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                      });
                    },
                    backgroundColor: Colors.brown,
                    child: const Icon(Icons.add),
                    ),
                    SizedBox(width: 40,),
                    FloatingActionButton(
                    onPressed: (){
                     setState(() {
                        z=num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                      });
                    },
                    backgroundColor: Colors.brown,

                    child: const Icon(CupertinoIcons.minus),
                    ),
                    SizedBox(width: 40,),
                    FloatingActionButton(
                    onPressed: (){
                     setState(() {
                        z=num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;
                      });
                    },
                    backgroundColor: Colors.brown,
                    child: const Icon(CupertinoIcons.multiply),
                    ),
                    SizedBox(width: 40,),
                    FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        z=num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                      }); 
                    },
                    backgroundColor: Colors.brown,

                    child: const Icon(CupertinoIcons.divide),
                    ),
                ],
              ),
            ), 
                SizedBox(height: 20,),
                  FloatingActionButton.extended(
                  onPressed: (){
                    setState(() {
                      z=0;
                      x=0;
                      y=0;
                      displayOneController.clear();
                      displayTwoController.clear();
                    });
                  },
                    backgroundColor: Colors.brown,
                  label: const Text("Clear"),
                  ),
          ],
        ));
  }
}
class DisplayOne extends StatelessWidget{
  const DisplayOne({
    super.key,
    this.hint="enter a number",
    required this.controller
  });
final String hint;  
final TextEditingController controller;
  @override 
  Widget build (BuildContext context){
    return  TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
