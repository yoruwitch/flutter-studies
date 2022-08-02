import 'package:flutter/material.dart';
import 'package:project001/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(28),
        color: const Color.fromARGB(255, 159, 86, 243),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 78,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Login'),
              ),
              onChanged: _controller.setLogin,
            ),
            TextField(
                decoration: InputDecoration(
                  label: Text('Password'),
                ),
                obscureText: true,
                onChanged: _controller.setPassword),
            const SizedBox(height: 15),
            ValueListenableBuilder(
              valueListenable: _controller.inLoader,
              builder: (_, inLoader, __) => ElevatedButton(
                  onPressed: () {
                    _controller.auth().then((result) {
                      if (result) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        print('failed');
                      }
                    });
                  },
                  child: const Text('Login')),
            )
          ],
        ),
      ),
    );
  }
}
