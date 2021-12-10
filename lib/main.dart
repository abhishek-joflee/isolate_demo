import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // STATE VARIABLE FOR UPDATING UI
  Widget result = const Text("Result will be here");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // STATE VARIABLE
            result,

            // BUTTON
            TextButton(
              child: const Text("Compute"),
              onPressed: () async {
                // SET LOADER
                setState(() {
                  result = const CircularProgressIndicator();
                });

                // CALL HEAVY COMPUTATION FUNCTION
                final sum =
                    await compute(computationallyExpensiveTask, 60000000);

                // UPDATE UI WITH NEW RESULT
                setState(() {
                  result = Text(sum.toString());
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// HEAVY COMPUTATION FUNCTION
int computationallyExpensiveTask(int value) {
  var sum = 0;
  for (var i = 0; i <= value; i++) {
    sum += i;
  }
  return sum;
}
