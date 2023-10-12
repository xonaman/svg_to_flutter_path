import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_to_flutter_path/converter.dart';

void main() => runApp(const _App());

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'svg_to_flutter_path',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: false,
      ),
      home: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  final TextEditingController _svgPathTextController = TextEditingController();
  final TextEditingController _svgWidthTextController = TextEditingController();
  final TextEditingController _svgHeightTextController =
      TextEditingController();

  Future<void> _startConversion() async {
    final String flutterPath = await Converter.convert(
      svgPath: _svgPathTextController.text.replaceAll('\n', ''),
      svgWidth: double.parse(_svgWidthTextController.text),
      svgHeight: double.parse(_svgHeightTextController.text),
    );
    if (mounted) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => _ResultScreen(flutterPath: flutterPath),
        fullscreenDialog: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('svg_to_flutter_path'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _svgPathTextController,
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.top,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Enter your SVG path data (the string inside '
                        'the d attribute):'),
                  ),
                ),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _svgWidthTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Enter your SVG’s width:'),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]+(\.)?([0-9]+)?')),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _svgHeightTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Enter your SVG’s height:'),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]+(\.)?([0-9]+)?')),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _startConversion,
                        child: const SizedBox.expand(
                          child: Center(
                            child: Text(
                              'Convert to Flutter Path',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultScreen extends StatelessWidget {
  final String flutterPath;

  const _ResultScreen({required this.flutterPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () => Clipboard.setData(ClipboardData(
              text: flutterPath,
            )),
          ),
        ],
      ),
      body: TextFormField(
        readOnly: true,
        initialValue: flutterPath,
        expands: true,
        maxLines: null,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
