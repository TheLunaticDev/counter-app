import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget{
  const AppTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context){
    return Text(
      title,
      style: const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(98, 114, 164, 1.0),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget{
  const CounterDisplay({required this.count, super.key});

  final int count;

  Color _getColor() {
    if (count > 0) {
      return const Color.fromRGBO(80, 250, 123, 1.0);
    }
    else if (count < 0) {
      return const Color.fromRGBO(255, 85, 85, 1.0);
    }
    else {
      return const Color.fromRGBO(139, 233, 253, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      count.toString(),
      style: TextStyle(
        fontSize: 32,
        color: _getColor(),
      ),
    );
  }
}

class CounterIncrementor extends StatelessWidget{
  const CounterIncrementor({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.add),
      onPressed: onPressed,
      label: const Text('Add'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color.fromRGBO(80, 250, 123, 1.0),
        backgroundColor: const Color.fromRGBO(68, 71, 90, 1.0),
      ),
    );
  }
}

class CounterDecrementor extends StatelessWidget{
  const CounterDecrementor({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.remove),
      onPressed: onPressed,
      label: const Text ('Reduce'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color.fromRGBO(255, 85, 85, 1.0),
        backgroundColor: const Color.fromRGBO(68, 71, 90, 1.0),
      ),
    );
  }
}

class CounterResetter extends StatelessWidget{
  const CounterResetter({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.undo),
      onPressed: onPressed,
      label: const Text ('Zero'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color.fromRGBO(139, 233, 253, 1.0),
        backgroundColor: const Color.fromRGBO(68, 71, 90, 1.0),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  void _decrement() {
    setState(() {
      --_counter;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CounterDisplay(count: _counter,),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterDecrementor(onPressed: _decrement,),
            const SizedBox(width: 8,),
            CounterResetter(onPressed: _reset,),
            const SizedBox(width: 8,),
            CounterIncrementor(onPressed: _increment,),
          ]
        ),
      ],
    );
  }
}

class CounterAppDisplay extends StatelessWidget{
  const CounterAppDisplay({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppTitle(title: 'Your current count is...',),
          SizedBox(height: 30,),
          Counter(),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(40, 42, 54, 1.0),
        body: CounterAppDisplay(),
      ),
    ),
  );
}
