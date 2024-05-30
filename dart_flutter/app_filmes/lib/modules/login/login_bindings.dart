import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBindings implements Bindings {
  //! instanciando o controller para lincar a pagina e realizar acesso
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        loginService: Get.find(),
      ),
    );
  }
}

/**
 * Diferença entre PUT e LAZYPUT
 * PUT: Instancia a solicitaçao instantaneamente
 * LAZYPUT: aguarda ser solicitado, ou pedir solicitaçao antes de intanciar
 */
