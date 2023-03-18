import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_project/CounterProvider.dart';

class Deval extends StatefulWidget {
  const Deval({Key? key}) : super(key: key);

  @override
  State<Deval> createState() => _DevalState();
}

class _DevalState extends State<Deval> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.watch<CounterProvider>().counter.toString(),
          style: TextStyle(
            fontSize: 50
          ),
        ),
      ),
    );
  }
}
