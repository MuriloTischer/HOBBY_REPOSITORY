import 'package:lab_clinicas_adm/src/pages/home/home_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  final _formKey = GlobalKey<FormState>();
  final _deskNumberEC = TextEditingController();
  final controller = Injector.get<HomeController>();
  late final EffectCleanup effectCleanup;

  @override
  void initState() {
    messageListener(controller);
    effectCleanup = effect(() {
      if (controller.informationForm != null) {
        Navigator.of(context).pushReplacementNamed('/pre-checkin',
            arguments: controller.informationForm);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _deskNumberEC.dispose();
    effectCleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bem-Vindo!',
                  style: LabClinicasTheme.titleStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Preencha o número do guichê que você está atendendo',
                  style: LabClinicasTheme.subTitleSmallStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppDefaultTextformfield(
                  title: "Numero do guiche",
                  hintText: 'Numero do guiche',
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _deskNumberEC,
                  onFieldSubmitted: (_) => _enterButton(),
                  validator: Validatorless.multiple([
                    Validatorless.required('Guichê obrigatório'),
                    Validatorless.number('Guichê deve ser um número')
                  ]),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 32,
                ),
                AppDefaultEspecialButton(
                  tipoBotao: true,
                  onPressed: _enterButton,
                  label: 'CHAMAR PRÓXIMO PACIENTE',
                  width: sizeOf.width * .8,
                  height: 48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _enterButton() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      controller.startService(int.parse(_deskNumberEC.text));
    }
  }
}
