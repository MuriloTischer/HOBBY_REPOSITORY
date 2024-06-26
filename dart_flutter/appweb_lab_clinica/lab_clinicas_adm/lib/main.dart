import 'dart:async';
import 'dart:developer';

import 'package:lab_clinicas_adm/src/bindindgs/lab_clinicas_application_binding_adm.dart';
import 'package:lab_clinicas_adm/src/pages/checkin/checkin_router.dart';
import 'package:lab_clinicas_adm/src/pages/end_checkin/end_checkin_router.dart';
import 'package:lab_clinicas_adm/src/pages/home/home_router.dart';
import 'package:lab_clinicas_adm/src/pages/pre_checkin/pre_checkin_router.dart';
import 'package:lab_clinicas_adm/src/pages/splashs/splash_page.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'src/pages/login/login_router.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicasAdm());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasAdm extends StatelessWidget {
  const LabClinicasAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clínicas ADM',
      bindings: LabClinicasApplicationBindingAdm(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      pages: const [
        LoginRouter(),
        HomeRouter(),
        PreCheckinRouter(),
        CheckinRouter(),
        EndCheckinRouter()
      ],
    );
  }
}
