import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  /*
    Classe para indicar quando estiver sendo realizado algum carregamento 
    assincrono na aplicação para indicar para o usuário está ação.
  */
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Existem ainda o LinearProgressIndicator e o RefreshProgressIndicator
            CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Carregando...',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
