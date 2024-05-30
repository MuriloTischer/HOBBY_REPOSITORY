import 'package:delivery_app/app/core/config/env/env.dart';
import 'package:delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            //! IMAGEM LANCHE
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //! IMAGEM DO LOGO
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeigth(.20),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                  ),

                  //! BOTTÃO DE ACESSO
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                    width: context.percentWidth(0.6),
                    height: 35,
                    label: 'ACESSAR',
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/home');
                    },
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
