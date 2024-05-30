import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  //! criando a estrutura de loading da pagina
  void loaderListener(RxBool loaderRx) {
    ever<bool>(
      loaderRx,
      (loading) async {
        if (loading) {
          await Get.dialog(
            const Center(
              child:
                  CircularProgressIndicator(), //? apresenta a estrutura do loader na tela
            ),
            barrierDismissible:
                false, //? bloqueia para não fechar o modal caso o usuario clique na pagina durante o loading
          );
        } else {
          Get.back();
        }
      },
    );
  }
}

/**
 * Mixin:  é utilizado em heranças multiplas
 * ex:
 * class Chachorro()
 * class Animal ()
 * class Mamifero()
 * 
 * Cachorro() extends Animal()  ? Sim, cachorro é animal
 * 
 * Cachorro() extends Animal(), Mamifero() --> Dessa forma não é permitido extender a classe mesmo o cachorro tbm sendo mamifero
 * 
 * para isso o Dart criou uma forma para poder ser extendido uma herança multipla, que são os MIXIN
 * e a palavra reservada usada é WITH
 * ficando assim:
 * Cachorro() extends Animal() with Mamifero() --> dessa forma dizemos que o cachorro é um animal e é mamifero
 * 
 * a vantagem do mixin é q ele mos permite criar uma retriçao para ele dizendo 
 * que algo só poderá ser utilizado se for de tal classe
 * ex: 
 * mixin Late on Mamifero --> indica que o Late só podera ser usado se extender de um mamifero
 * se não for, não será permitido a utilizaçao
 * 
 *  Cachorro() extends Animal() with Mamifero(), Late()
 */
