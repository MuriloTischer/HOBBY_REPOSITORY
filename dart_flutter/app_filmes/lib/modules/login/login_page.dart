import 'package:app_filmes/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //! tela de fundo da tela inicial background
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),

          //! Inserindo logo do app
          Container(
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                ),
                const SizedBox(
                  height: 50,
                ),
                //! inserindo o botão de acesso (via google) (package usado:  flutter_signin_button )
                SizedBox(
                  width: Get.width * .9,
                  height: 42,
                  child: SignInButton(
                    Buttons.Google,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    text: 'Entrar com o Google',
                    onPressed: () => controller.login(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
