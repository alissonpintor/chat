import 'package:chat/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        // O SingleChildScrollView serve para adicionar scroll na tela a
        // depender do tamanho da própria tela e dos componentes filho
        child: SingleChildScrollView(
          child: AuthForm(),
        ),
      ),
    );
  }
}
