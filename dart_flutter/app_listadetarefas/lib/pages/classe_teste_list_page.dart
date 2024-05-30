import 'package:flutter/material.dart';

class ClasseTesteListPage extends StatelessWidget {
  const ClasseTesteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintText:
                  'exemplo@email.com', //!deixa uma marção como exemplo no campo de texto
              border:
                  OutlineInputBorder(), //! faz com que o campo do texto fique com uma borda em sua volta
              //? border: InputBorder.none, // faz com que o campo do texto não tenha bordas
              errorText: null, // mensagem de erro
            ),
            //? obscureText: true, //usado para campos de senha
            //? keyboardType: TextInputType.tipoDesejado, //da a opçao de manipular o que deve ser exibido no teclado ao clicar no campo de texto
          ),
        ),
      ),
    );
  }
}

//  child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'E-mail',
//                 ),
//                 onChanged: onChanged,
//                 // onSubmitted: ,
//               ),
//               ElevatedButton(
//                 onPressed: login,
//                 child: const Text('Entrar'),
//               ),
//             ],
//           ),
//         ),

  // void login() {
  //   String text = emailController.text;
  //   print(text);
  // }

  // void onChanged(String text) {
  //   //print(text);
  // }

  // void onSubmitted(String text) {
  //   //! menos utilizado em app, mais utilizado no flutter web
  //   print(text);
  // }
