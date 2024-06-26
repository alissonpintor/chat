import 'dart:io';

import 'package:chat/components/user_image_picker.dart';
import 'package:chat/core/models/auth_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({
    Key? key,
    required this.onSubmit,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    if (_formData.image == null && _formData.isSignup) {
      return _showError('Imagem não selecionada!');
    }

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup)
                UserImagePicker(
                  onImagePick: _handleImagePick,
                ),
              if (_formData.isSignup)
                TextFormField(
                  key: ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    // Retorna uma String vazia se value for nulo.
                    final name = value ?? '';

                    if (name.trim().length < 5) {
                      return 'Nome deve ter no mínimo 5 caracteres';
                    }

                    return null;
                  },
                ),
              TextFormField(
                key: ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                validator: (value) {
                  final email = value ?? '';

                  if (!email.contains('@')) {
                    return 'Não é um e-mail válido.';
                  }

                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                validator: (value) {
                  // Retorna uma String vazia se value for nulo.
                  final password = value ?? '';

                  if (password.length < 6) {
                    return 'Senha deve ter no mínimo 6 caracteres.';
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
              ),
              TextButton(
                child: Text(_formData.isLogin
                    ? 'Criar uma nova conta?'
                    : 'Já possui conta?'),
                onPressed: () {
                  setState(
                    () {
                      _formData.toggleAuthMode();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
