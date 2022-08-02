import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project001/controllers/login_controller.dart';

class LoginButtonComponent extends StatelessWidget {
  final LoginController loginController;

  const LoginButtonComponent({Key? key, required this.loginController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => ElevatedButton(
          onPressed: () {
            loginController.auth().then((result) {
              if (result) {
                Navigator.of(context).pushReplacementNamed('/home');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: const Text('Login failed'),
                  duration: const Duration(seconds: 1),
                ));
              }
            });
          },
          child: const Text('Login')),
    );
  }
}
