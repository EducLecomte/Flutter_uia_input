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
      home: const MyHomePage(title: 'Flutter UI avancée'),
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
  String _textChanged = "";
  String _textSubmitted = "";

/*
/**
 * controle de saisie avec l'attribut controller
 */
  final _contoller = TextEditingController();
  // cette méthode se déclanche une fois, au moment de l'initialisation de l'écran
  void initState() {
    super.initState();
    _contoller.addListener(_afficherLaValeurDuChamp);
    _contoller.value = TextEditingValue(text: "$_textChanged");
  }

  // cette méthode supprime le controleur
  void dispose() {
    _contoller.dispose();
    super.dispose();
  }

  void _afficherLaValeurDuChamp() {
    setState(() {
      _textChanged = _contoller.text;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Veuillez tester le textField :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: const InputDecoration(
                    hintText: "Zone de saisie", labelText: "Label"),
                onChanged: (value) {
                  setState(() {
                    //_textChanged = value;
                    if (!value.contains(RegExp(r'[0-9]'))) {
                      _textChanged = value;
                    }
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    _textSubmitted = value;
                  });
                },

                //controller: _contoller,
                //obscureText: true, // pour la saisie des mot de pase
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              const Text(
                "Texte en cours dans le textFiel :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("$_textChanged"),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text(
                "Texte soumis dans textField :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("$_textSubmitted"),
            ],
          ),
        ),
      ),
    );
  }
}
