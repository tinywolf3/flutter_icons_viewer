import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'IconsList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Icons'),
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

  IconData _selectedIcon = Icons.circle;
  String _selectedName = '';
  Color _colored = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.link),
            tooltip: 'Open flutter.dev/Icons-class',
            onPressed: () {
              launch('https://api.flutter.dev/flutter/material/Icons-class.html');
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            children: [
              const Spacer(),
              Icon(_selectedIcon, color: _colored, size: 64,),
              const SizedBox(width: 10,),
              Text(_selectedName, style: const TextStyle(fontFamily: '둥근모꼴', fontSize: 24,),),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Spacer(),
              TextButton(
                child: const Icon(Icons.square, color: Colors.black),
                onPressed: () => setState(() { _colored = Colors.black; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.grey),
                onPressed: () => setState(() { _colored = Colors.grey; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.red),
                onPressed: () => setState(() { _colored = Colors.red; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.green),
                onPressed: () => setState(() { _colored = Colors.green; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.blue),
                onPressed: () => setState(() { _colored = Colors.blue; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.yellow),
                onPressed: () => setState(() { _colored = Colors.yellow; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.orange),
                onPressed: () => setState(() { _colored = Colors.orange; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.pink),
                onPressed: () => setState(() { _colored = Colors.pink; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.purple),
                onPressed: () => setState(() { _colored = Colors.purple; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.cyan),
                onPressed: () => setState(() { _colored = Colors.cyan; }),
              ),
              TextButton(
                child: const Icon(Icons.square, color: Colors.indigo),
                onPressed: () => setState(() { _colored = Colors.indigo; }),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 48,
              children: List.generate(IconsList.icons.length, (index) {
                return Center(
                  child: TextButton(
                    child: Icon(IconsList.icons[index], color: _colored,),
                    onPressed: () {
                      setState(() {
                        _selectedIcon = IconsList.icons[index];
                        _selectedName = IconsList.names[index];
                      });
                    },
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
