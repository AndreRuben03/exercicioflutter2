import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base app',
        theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descricaoUnidade = TextEditingController();
  final TextEditingController _CargaHorariaUnidade = TextEditingController();
  final TextEditingController _Ordem = TextEditingController();
  final TextEditingController _fkCurso = TextEditingController();
  final TextEditingController _descricaoRecesso = TextEditingController();
  final List<String> _availableCourses = ['Desenvolvedor WEB', 'Programador de Sistemas', 'Informática Fundamental', 'Fundamentos de Python I', 'Assistente Administrativo', 'Operador de Computador', 'Administrador de Banco de Dados', 'Instalador de Sistemas Eletroeletrônicos e CFTV', 'Técnico em Administração', 'Técnico em Informática'];
  final TextEditingController courseController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String selectedCourse = courseController.text;
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Curso"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(          
                    controller: _descricaoUnidade,         
                    decoration: const InputDecoration(
                      labelText: "Descrição unidade"
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                      return null;
                    },
                  ),
                    TextFormField(
                      controller: _CargaHorariaUnidade,
                    decoration: const InputDecoration(
                      labelText: "Carga Horária"
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Coloque uma carga horária menor que a do curso escolhido.";
                        }
                        return null;
                      },      
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                   ], // Only numbers can be entered
                  ),
                    TextFormField(
                      controller: _Ordem,
                      decoration: const InputDecoration(
                        labelText: "Ordem UC"
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Coloque um dígito maior que 0";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                    ], // Only
                  ),
                  TextFormField(
                    controller: _fkCurso,
                    decoration: const InputDecoration(
                      labelText: "Curso Matriculado"
                    ),
                    validator: (value) {
                      if (value!.isEmpty) { 
                        return "Por favor, insira nome do curso";
                      }
                      if (!_availableCourses.contains(value)) {
                        return "Curso inválido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descricaoRecesso,
                    decoration: const InputDecoration(
                      labelText: "Motivo"                     
                    ),
                     validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                       return null;
                    },
                  ),
                  BasicDateField(),
                   ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Enviar'),
                ),
                ],
               ),
             ),
           ),
         ),
       ),
     );
   }
 }
 class BasicDateField extends StatelessWidget {
  get format => DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today),
          labelText: "Coloque uma data"
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100),
          );
        },
      ),
    ]);
  }
}
 