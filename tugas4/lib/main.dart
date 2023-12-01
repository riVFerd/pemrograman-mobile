import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputController = TextEditingController();
  double _result = 0;

  final _listItem = ["Kelvin", "Reamur"];
  String _selectedItem = "Kelvin";

  final _historyItem = <String>[];

  void convert() {
    final celcius = double.tryParse(inputController.text) ?? 0;
    switch (_selectedItem) {
      case "Kelvin":
        _result = celcius + 273.15;
      case "Reamur":
        _result = (celcius * 4) / 5;
      default:
        _result = 0;
    }
    _historyItem.add("$_selectedItem : $_result");
  }

  void reset() {
    inputController.clear();
    _historyItem.clear();
    setState(() {
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: inputController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Masukkan Suhu Dalam Celcius",
                      ),
                      onFieldSubmitted: (_) {
                        setState(() {
                          convert();
                        });
                      },
                    ),
                    DropdownButton(
                      items: _listItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _selectedItem,
                      onChanged: (changeValue) {
                        setState(() {
                          _selectedItem = changeValue.toString();
                          convert();
                        });
                      },
                    ),
                    Result(result: _result),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _historyItem.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(_historyItem[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({key, required this.result}) : super(key: key);
  final double result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            result.toStringAsFixed(1),
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
