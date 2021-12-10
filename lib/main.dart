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
  int number = 0;
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
            // INPUT NUMBER
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                decoration: const InputDecoration(label: Text("Huge number")),
                onChanged: (val) {
                  number = int.parse(val);
                },
              ),
            ),
            // STATE VARIABLE
            result,

            // BUTTON
            TextButton(
              child: const Text("Compute"),
              onPressed: () async {
                int before = DateTime.now().microsecondsSinceEpoch;
                // SET LOADER
                setState(() {
                  result = const CircularProgressIndicator();
                });

                // CALL HEAVY COMPUTATION FUNCTION
                final sum = await compute(computationallyExpensiveTask, number);

                // UPDATE UI WITH NEW RESULT
                setState(() {
                  int after = DateTime.now().microsecondsSinceEpoch;
                  result = Column(
                    children: [
                      Text(sum.toString()),
                      Text("elapsed: " +
                          ((after - before) / 1000000).toString()),
                    ],
                  );
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
