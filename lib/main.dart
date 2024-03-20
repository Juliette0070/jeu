import 'package:flutter/material.dart';

// changer l'index quand appui sur boutton.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu nombre mystère',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Jeu nombre mystère'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = [
    _EcranAccueilNombreMystere(),
    _PartieNombreMystere()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      ),
    );
  }
}

class _EcranAccueilNombreMystere extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/images.jpg'), // Image.network('https://drissas.com/wp-content/uploads/2021/08/bebe_yoda.gif'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){debugPrint('démarrer');},
                child: const Text("démarrer")
            ),
            ElevatedButton(
                onPressed: (){debugPrint('mes scores');},
                child: const Text("mes scores")
            ),
            ElevatedButton(
                onPressed: (){debugPrint('règles');},
                child: const Text("règles")
            )
          ],
        )
      ],
    );
  }
}

class _PartieNombreMystere extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Entrez un nombre: ")
      ],
    );
  }
}
