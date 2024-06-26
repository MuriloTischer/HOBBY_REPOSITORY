import 'package:lab_clinicas_painel/src/pages/panel/panel_controller.dart';
import 'package:lab_clinicas_painel/src/pages/panel/panel_page.dart';
import 'package:lab_clinicas_painel/src/repositories/panel_checkin/panel_checkin_repository.dart';
import 'package:lab_clinicas_painel/src/repositories/panel_checkin/panel_checkin_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class PanelRouter extends FlutterGetItPageRouter {
  const PanelRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PanelCheckinRepository>(
            (i) => PanelCheckinRepositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => PanelController(panelCheckinRepository: i()))
      ];

  @override
  String get routeName => '/panel';

  @override
  WidgetBuilder get view => (_) => const PanelPage();
}
