import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Média',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de Média'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 2, 62, 138),
        ),
        body: CalculatorForm(),
      ),
    );
  }
}

class CalculatorForm extends StatefulWidget {
  @override
  _CalculatorFormState createState() => _CalculatorFormState();
}
// Annotation on instance members which override an interface member
class _CalculatorFormState extends State<CalculatorForm> {
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController note1Controller = TextEditingController();
  final TextEditingController note2Controller = TextEditingController();
  final TextEditingController note3Controller = TextEditingController();

  
  String resultName = '';
  String resultEmail = '';
  String resultNotes = '';
  String resultAverage = '';

 
  void calculateAverage() {
    String name = nameController.text;
    String email = emailController.text;
    double note1 = double.tryParse(note1Controller.text) ?? 0;
    double note2 = double.tryParse(note2Controller.text) ?? 0;
    double note3 = double.tryParse(note3Controller.text) ?? 0;

    double average = (note1 + note2 + note3) / 3;

    setState(() {
      resultName = name;
      resultEmail = email;
      
      resultNotes = '$note1, $note2, $note3';
      resultAverage = average.toStringAsFixed(1);
    });
  }

  
  void clearFields() {
    nameController.clear();
    emailController.clear();
    note1Controller.clear();
    note2Controller.clear();
    note3Controller.clear();

    setState(() {
      resultName = '';
      resultEmail = '';
      resultNotes = '';
      resultAverage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Garante acessibilidade em telas menores
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo Nome
            Text('Nome:', style: TextStyle(color: Colors.blueGrey.shade600)),
            TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Campo Email
            Text('Email:', style: TextStyle(color: Colors.blueGrey.shade600)),
            TextField(
              controller: emailController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),

            // Linha com os três campos de Notas
            Row(
              children: [
                // Campo Nota 1
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nota 1:', style: TextStyle(color: Colors.blueGrey.shade600)),
                      SizedBox(height: 4),
                      TextField(
                        controller: note1Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                // Campo Nota 2
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nota 2:', style: TextStyle(color: Colors.blueGrey.shade600)),
                      SizedBox(height: 4),
                      TextField(
                        controller: note2Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                // Campo Nota 3
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nota 3:', style: TextStyle(color: Colors.blueGrey.shade600)),
                      SizedBox(height: 4),
                      TextField(
                        controller: note3Controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Botão Calcular Média
            Center(
              child: ElevatedButton(
                onPressed: calculateAverage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 1, 110, 192),
                ),
                child: Text('Calcular Média', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 24),

            // Exibição dos Resultados
            if (resultName.isNotEmpty ||
                resultEmail.isNotEmpty ||
                resultNotes.isNotEmpty ||
                resultAverage.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Resultados:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Nome: '),
                        TextSpan(
                          text: resultName,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Email: '),
                        TextSpan(
                          text: resultEmail,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Notas: '),
                        TextSpan(
                          text: resultNotes,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'Média: '),
                        TextSpan(
                          text: resultAverage,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 32),

            
            Center(
              child: ElevatedButton(
                onPressed: clearFields,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 2, 62, 138),
                ),
                child: Text('Apagar Campos', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
