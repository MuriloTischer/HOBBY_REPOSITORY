import 'package:asyncstate/asyncstate.dart';
import 'package:lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:lab_clinicas_core/src/theme/lab_clinicas_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  final ApplicationBindings? bindings; // add the ApplicationBindings property
  final List<FlutterGetItPageRouter>?
      pages; // add the FlutterGetItPageRouter property
  final List<FlutterGetItPageBuilder>?
      pagesBuilders; // add the FlutterGetItPageBuilder property
  final List<FlutterGetItModule>?
      modules; // add the FlutterGetItModule property
  final String title; // add the title property
  final VoidCallback? didStart; // add the didStart property

  const LabClinicasCoreConfig({
    super.key, // add the key parameter
    this.bindings, // add the bindings parameter
    this.pages, // add the pages parameter
    this.pagesBuilders, // add the pagesBuilders parameter
    this.modules, // add the modules parameter
    required this.title, // add the title parameter
    this.didStart, // add the didStart parameter
  }); // add the modules parameter

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      // return the FlutterGetIt widget
      debugMode: kDebugMode, // set the debugMode to kDebugMode
      bindings: bindings, // set the bindings to the bindings property
      pages: [
        ...pages ?? [],
        ...pagesBuilders ?? []
      ], // set the pages to the pages and pagesBuilders properties
      modules: modules, // set the modules to the modules property
      builder: (context, routes, flutterGetItNavObserver) {
        // add the builder parameter
        return AsyncStateBuilder(
          // return the AsyncStateBuilder widget
          loader:
              LabClinicasLoader(), // set the loader to the LabClinicasLoader
          builder: (navigatorObserver) {
            // add the navigatorObserver parameter
            if (didStart != null) {
              // check if didStart is not null
              didStart!(); // call the didStart function
            }
            return MaterialApp(
              // return the MaterialApp widget
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.darkTheme,
              navigatorObservers: [
                // add the navigatorObservers
                navigatorObserver, // add the navigatorObserver
                flutterGetItNavObserver, // add the flutterGetItNavObserver
              ],
              debugShowCheckedModeBanner:
                  false, // set the debugShowCheckedModeBanner to false
              routes: routes, // set the routes to the routes parameter
              title: title, // set the title to the title property
            );
          },
        );
      },
    );
  }
}
