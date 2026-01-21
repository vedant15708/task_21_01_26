import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lifecycle Demo",
      home: LifeCycleDemo(),
    );
  }
}

class LifeCycleDemo extends StatefulWidget {
  const LifeCycleDemo({super.key});

  @override
  State<LifeCycleDemo> createState() => _LifeCycleDemoState();
}

class _LifeCycleDemoState extends State<LifeCycleDemo> {
  int counter = 0;

  void showSnackBar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("initstate() called");
    showSnackBar("initstate() called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies() called");
    showSnackBar("didChangeDependencies() called");
  }

  @override
  void didUpdateWidget(covariant LifeCycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget() called");
    showSnackBar("didUpdateWidget() called");
  }

  @override
  Widget build(BuildContext context) {
    print("build() called");
    showSnackBar("build() called");
    return Scaffold(
      appBar: AppBar(
        title: Text("LifeCycle Demo", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              "Counter: $counter",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  counter++;
                  print("setState() called  build() will run again");
                  showSnackBar("setState() called  build() will run again");
                });
              },
              label: const Text("Increment Counter"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose() called");
    showSnackBar("dispose() called");
  }
}
