import 'package:currency_calc/views/calculator_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      body: const SafeArea(
        bottom: false,
        child: CalculatorView(),
      ),
    );
  }
}
