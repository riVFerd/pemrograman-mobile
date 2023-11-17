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
  double _valueInKelvin = 0;
  double _valueInReamur = 0;

  void convert() {
    final celcius = double.tryParse(inputController.text) ?? 0;
    setState(() {
      _valueInKelvin = celcius + 273.15;
      _valueInReamur = (celcius * 4) / 5;
    });
  }

  void reset() {
    inputController.clear();
    setState(() {
      _valueInKelvin = 0;
      _valueInReamur = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Suhu Dalam Celcius",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DegreeBox(
                    height: 150,
                    unit: "Kelvin",
                    value: _valueInKelvin,
                  ),
                ),
                Expanded(
                  child: DegreeBox(
                    height: 150,
                    unit: "Reamur",
                    value: _valueInReamur,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: convert,
                child: const Text(
                  'Konversi Suhu',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class DegreeBox extends StatelessWidget {
  final double width;
  final double height;
  final String unit;
  final double value;

  const DegreeBox(
      {super.key, this.width = 0, this.height = 0, required this.unit, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Suhu dalam $unit",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
