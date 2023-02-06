import 'package:flutter/material.dart';
import 'package:urna/controller/login_controller.dart';

class LoginInterface extends StatefulWidget {
  const LoginInterface({super.key});

  @override
  State<LoginInterface> createState() => _LoginInterfaceState();
}

class _LoginInterfaceState extends State<LoginInterface> {
  final _formKey = GlobalKey<FormState>();
  final _codigoControleller = TextEditingController();
  final _senhaController = TextEditingController();
  final _loginController = LoginController();
  bool _mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                    controller: _codigoControleller,
                    decoration: const InputDecoration(
                        label: Text('codigo eleitor'),
                        hintText: 'Exemplo:12345'),
                    validator: (codigo) {
                      _loginController.validatorCodigo(codigo);
                    }),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    label: Text('senha'),
                    hintText: 'Digite sua senha',
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _mostrarSenha == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        });
                      },
                    ),
                  ),
                  validator: (senha) {
                    _loginController.validatorSenha(senha);
                  },
                  obscureText: _mostrarSenha == false ? true : false,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Entrar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
