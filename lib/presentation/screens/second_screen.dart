import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/counter_cubit.dart';
import '../../cubit/counter_state.dart';

class MyHomePageSecondScreen extends StatefulWidget {
  final Color color;
  const MyHomePageSecondScreen({super.key, required this.title, required this.color});

  final String title;

  @override
  State<MyHomePageSecondScreen> createState() => _MyHomePageSecondScreenState();
}

class _MyHomePageSecondScreenState extends State<MyHomePageSecondScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if(state.isIncremented == false){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Decremented!'), duration: Duration(milliseconds: 100)),
                  );

                }
                if(state.isIncremented == true){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incremented!')),
                  );

                }
              },
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                );
              },
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: widget.color,
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}