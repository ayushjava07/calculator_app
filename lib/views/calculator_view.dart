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
  late final AppLifecycleListener _listener;
 @override
 void initState(){
  super.initState();
  displayOneController.text=x.toString();
  displayTwoController.text=y.toString();
  _listener=AppLifecycleListener(
    onShow: _onShow,
    onHide: _onHide,
    onResume: _onResume,
    onDetach: _onDetach,
    onInactive: _onInactive,
    onPause: _onPause,
    onStateChange:_onStateChange,
    onRestart: _onRestart,
  );
 }
 void _onShow()=>print("onshow called");
 void _onHide()=>print("onhide called");
 void _onResume()=> print("on resume called");
 void _onDetach()=> print("on detach called");
 void _onInactive()=> print("on inactive called");
 void _onPause()=> print("on onpause called");
 void _onStateChange(AppLifecycleState state)=> print("on state change called");
 void _onRestart()=> print("on restart called");
  @override void dispose() {
    // TODO: implement dispose
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
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
                 key:Key("result"),
              z.toString(),
              style: TextStyle(
                fontSize:60,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 40,),
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
