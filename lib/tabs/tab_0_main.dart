import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../login.dart';
import '../provider/user_provider.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final username = userProvider.user?.username ?? '';
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (userProvider.user != null)
            Text('Bienvenido, $username'),
          ElevatedButton(
            onPressed: () {
              userProvider.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('Cerrar Sesión'),
          ),
        ],
      ),
    );
  }
}