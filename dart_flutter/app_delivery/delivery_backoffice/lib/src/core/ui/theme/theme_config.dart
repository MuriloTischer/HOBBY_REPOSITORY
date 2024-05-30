import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

//! essa classe nao pode ser instanciada e para isso eh criado um construtor do tipo privado
//! apenas o underline ja eh suficiente (nao precisa ter _internal)
class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white, //define a cor de fundo da pagina
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black, //define cor da barra menu
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ), //gambiarra para previnir que nao apareça o icone na barra
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secundary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instance.textRegular.copyWith(color: Colors.black),
      errorStyle:
          TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
