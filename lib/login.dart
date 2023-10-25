import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'flut_tab.dart';
import 'provider/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'Usuario123' && password == '') {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.login(username, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FlutTab()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text('Datos de usuario introducidos invalidos.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
