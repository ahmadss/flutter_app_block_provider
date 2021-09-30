import 'package:flutter/material.dart';
import 'package:flutter_app_block_provider/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
          BlocProvider(create: (context) => CounterBlock(), child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build");
    // var bloc = BlocProvider.of<CounterBlock>(context);
    var bloc = context.read<CounterBlock>();
    return Scaffold(
      appBar: AppBar(title: Text("Counter Bloc")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBlock, int>(builder: (context, state) {
              print("state :: $state counter:: ${bloc.counter}");
              return Text(
                (state == bloc.counter)
                    ? "Angka saat ini :$state"
                    : "Angka saat ini :${bloc.counter}",
                style: TextStyle(fontSize: 25),
              );
            }),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      bloc.add("Add");
                    }),
                IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      bloc.add("Minus");
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
