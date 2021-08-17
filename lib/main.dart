import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/app_widget.dart';
import 'package:tic_tac_toe/app/shared/core/app_colors.dart';

void main() {
  /// Garente que o código nativo foi chamando
  /// antes de iniciar a aplicação
  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  /// Metodo de inicialização Firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        ///Verifica se há erros
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o Firebase",
                textDirection: TextDirection.ltr,
              ),
            ),
          );

          /// Ao concluir a inicialização a aplicação é inicializada
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();

          /// Caso contrário, o inicialização ainda está sendo carregada
        } else {
          return Material(
            color: AppColors.primary,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
