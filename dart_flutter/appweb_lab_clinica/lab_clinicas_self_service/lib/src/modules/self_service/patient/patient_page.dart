import 'package:brasil_fields/brasil_fields.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service/src/models/self_service_model.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_self_service/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

//!FORMULARIO DE CADASTRO DE PACIENTE

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage>
    with PatientFormController, MessageViewMixin {
  final _formKey = GlobalKey<FormState>(); //chave do formulario
  final selfServiceController = Injector.get<SelfServiceController>(); //controller do self service
  final PatientController controller = Injector.get<PatientController>(); //controller do paciente
  late final EffectCleanup effectCleanup; //efeito de limpeza

  late bool patientFound; //paciente encontrado
  late bool enableForm; //habilitar formulario

  @override
  void initState() {
    messageListener(controller); //escutar mensagens

    final SelfServiceModel(:patient) = selfServiceController.model; //modelo do self service
 
    patientFound = patient != null; //paciente encontrado
    enableForm = !patientFound; //habilitar formulario
    initializeForm(patient); //inicializar formulario
    effectCleanup = effect(() { //efeito de limpeza
      if (controller.nextStep) { //se o proximo passo
        selfServiceController.updatePatientAndDocument(controller.patient); //atualizar paciente e documento
      }
    });

    super.initState(); //iniciar estado
  }

  @override
  void dispose() { //dispose
    disposeForm(); //dispose do formulario
    effectCleanup(); //efeito de limpeza
    super.dispose(); //dispose
  }

  @override
  Widget build(BuildContext context) {  //construir widget
    final sizeOf = MediaQuery.sizeOf(context); //tamanho da tela

    return Scaffold( //scaffold
      appBar: LabClinicasSelfServiceAppBar(), //appbar
      body: Align( //alinhamento
        alignment: Alignment.topCenter, //alinhamento no topo
        child: SingleChildScrollView( //rolagem
          child: Container( //container
            padding: const EdgeInsets.all(32), //padding
            margin: const EdgeInsets.only(top: 18), //margem
            constraints: BoxConstraints(maxWidth: sizeOf.width * .85), //contraints
            decoration: BoxDecoration( //decoração
                color: Colors.white, //cor branca
                borderRadius: BorderRadius.circular(16), //borda circular
                border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Form( //formulario
              key: _formKey, //chave do formulario
              child: Column( //coluna
                children: [ //filhos
                  Visibility( //visibilidade
                    visible: patientFound, //visivel se paciente encontrado
                    replacement: Image.asset('assets/images/lupa_icon.png'), //substituição
                    child: Image.asset('assets/images/check_icon.png'), //imagem
                  ),
                  const SizedBox( //espaçamento
                    height: 24, //altura
                  ),
                  Visibility( 
                    visible: patientFound, //visivel se paciente encontrado
                    replacement: const Text( //substituição
                      'Cadastro não encontrado', //texto
                      style: LabClinicasTheme.titleSmallStyle, //estilo
                    ),
                    child: const Text(
                      'Cadastro encontrado',
                      style: LabClinicasTheme.titleSmallStyle, //estilo
                    ),
                  ),
                  const SizedBox(
                    height: 32, //altura
                  ),
                  Visibility(
                    visible: patientFound,  //visivel se paciente encontrado
                    replacement: Text( //substituição
                      'Preencha o formulario abaixo para fazer o seu cadastro',
                      style: LabClinicasTheme.subTitleSmallStyle.copyWith( //estilo
                        fontSize: 16, //tamanho da fonte
                      ),
                    ),
                    child: Text(
                      'Confirma os dados do seu cadastro',
                      style: LabClinicasTheme.subTitleSmallStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: nameEC,
                    title: 'Nome paciente',
                    validator: Validatorless.required('Nome Obrigatorio'),
                    hintText: 'Digite seu nome para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: emailEC,
                    title: 'E-Mail',
                    validator: Validatorless.multiple([
                      Validatorless.required('E-Mail Obrigatorio'),
                      Validatorless.email('Email inválido'),
                    ]),
                    hintText: 'Digite seu email para continuar',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: phoneEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    title: 'Telefone de Contato',
                    validator: Validatorless.required(
                        'Telefone de Contato Obrigatorio'),
                    hintText: 'Digite seu telefone de contato para continuar',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: documentEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    title: 'Digite seu CPF',
                    validator: Validatorless.required('CPF Obrigatorio'),
                    hintText: 'Digite seu cpf para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: cepEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    title: 'CEP',
                    validator: Validatorless.required('CEP Obrigatorio'),
                    hintText: 'Digite seu cep para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: streetEC,
                          title: 'Endereço',
                          validator:
                              Validatorless.required('Endereço Obrigatorio'),
                          hintText: 'Digite seu endereço para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: numberEC,
                          title: 'Numero',
                          validator:
                              Validatorless.required('Numero Obrigatorio'),
                          hintText: 'Digite seu numero para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: complementEC,
                          title: 'Complemento',
                          hintText:
                              'Digite seu complemento caso o tenhha  para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: streetEC,
                          title: 'Estado',
                          validator:
                              Validatorless.required('Estado Obrigatorio'),
                          hintText:
                              'Digite a sigla do seu estado para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: cityEC,
                          title: 'Cidade',
                          validator:
                              Validatorless.required('Cidade Obrigatoria'),
                          hintText: 'Digite sua cidade para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: AppDefaultTextformfield(
                          readOnly: !enableForm,
                          controller: districtEC,
                          title: 'Bairro',
                          validator:
                              Validatorless.required('Bairro Obrigatorio'),
                          hintText: 'Digite o bairro para continuar',
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: guardianEC,
                    title: 'Responsável',
                    hintText: 'Digite o responsaval caso tenha para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppDefaultTextformfield(
                    readOnly: !enableForm,
                    controller: guardianIdentificationNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    title: 'Documento de identidade',
                    hintText:
                        'Digite o documento de identidade do responsavel caso tenha para continuar',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 32.5,
                  ),
                  Visibility(
                    visible: !enableForm,
                    replacement: AppDefaultEspecialButton(
                      tipoBotao: true,
                      onPressed: _salvarecontinuar,
                      label: !patientFound ? 'CONTINUAR' : 'SALVAR E CONTINUAR',
                      height: 48,
                      width: double.infinity,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppDefaultEspecialButton(
                            tipoBotao: false,
                            onPressed: () {
                              setState(() {
                                enableForm = true;
                              });
                            },
                            label: 'EDITAR',
                            height: 48,
                            width: sizeOf.width * .2,
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Expanded(
                          child: AppDefaultEspecialButton(
                            onPressed: _continuar,
                            label: 'CONTINUAR',
                            height: 48,
                            width: sizeOf.width * .2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _salvarecontinuar() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();

      if (patientFound) {
        controller
            .updateAndNext(updatePatient(selfServiceController.model.patient!));
      } else {
        controller.savaAndNext(createPatientRegister());
      }
    }
  }

  void _continuar() {
    controller.patient = selfServiceController.model.patient;
    controller.goNextStep();
  }
}
