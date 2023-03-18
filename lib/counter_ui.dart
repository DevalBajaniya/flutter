import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_project/CounterProvider.dart';
import 'package:shared_project/deval.dart';

class CounterUI extends StatelessWidget {
  const CounterUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example ${context.watch<CounterProvider>().counter}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('You have pushed the button this many times:'),

            /// Extracted as a separate widget for performance optimization.
            /// As a separate widget, it will rebuild independently from [MyHomePage].
            ///
            /// This is totally optional (and rarely needed).
            /// Similarly, we could also use [Consumer] or [Selector].
            Count(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('njnujnu'),

            /// Calls `context.read` instead of `context.watch` so that it does not rebuild
            /// when [Counter] changes.
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Deval();
              }));
            },
            tooltip: 'GO',
            child: const Icon(Icons.arrow_forward_sharp),
          ),SizedBox(width: 10),
          FloatingActionButton(
            key: const Key('increment_floatingActionButton'),

            /// Calls `context.read` instead of `context.watch` so that it does not rebuild
            /// when [Counter] changes.
            onPressed: () => context.read<CounterProvider>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
      '${context.watch<CounterProvider>().counter}',
      key: const Key('counterState'),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}