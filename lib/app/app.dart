import 'package:currency_calc/views/home_view.dart';
import 'package:flutter/material.dart';
//stateless widget is widget that doen not require mutable state
// stateful widget is a wighet that require ,mutable state
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      title:"flutter learn",
      home:HomeView(),
    );
  }
}