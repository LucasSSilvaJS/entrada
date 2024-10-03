import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'olá mundo',
      theme: ThemeData.dark(),
      home: Scaffold(body: Conteudo()),
    );
  }
}

class Conteudo extends StatefulWidget {
  const Conteudo({Key? key}) : super(key: key);

  @override
  State<Conteudo> createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
  int count = 0;
  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  Color? verificarOcupacao() {
    if (count == 20) {
      return Colors.red;
    } else if (count > 15) {
      return Colors.yellow;
    } else if (count >= 0 && count <= 15) {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/waperwave.jpg'),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            isFull ? 'Lotado!' : 'Pode entrar!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              count.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
                color: verificarOcupacao(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: isEmpty ? null : decrement,
                child: Text(
                  'Saiu',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  fixedSize: Size(100, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: isEmpty
                      ? Colors.pinkAccent.shade400.withOpacity(0.2)
                      : Colors.pinkAccent.shade400,
                ),
              ),
              SizedBox(
                width: 64,
              ),
              TextButton(
                onPressed: isFull ? null : increment,
                child: Text(
                  'Entrou',
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(
                  fixedSize: Size(100, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: isFull
                      ? Colors.pinkAccent.shade400.withOpacity(0.2)
                      : Colors.pinkAccent.shade400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
