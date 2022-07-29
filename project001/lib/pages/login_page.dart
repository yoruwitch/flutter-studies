import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            const TextField(
              decoration: InputDecoration(
                label: Text('Login'),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text('Password'),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 15),
            ElevatedButton(onPressed: () {}, child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
