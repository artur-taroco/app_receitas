import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 80,
            ),

            SizedBox(height: 20),

            Text(
              "App de Receitas",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Aplicativo desenvolvido em Flutter para a disciplina de Sistemas Móveis.",
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            Text(
              "Integrantes:\nArtur Taroco\n Marcelo Nascimento\n Leonardo Munhoz\n Gabriel Lima",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}