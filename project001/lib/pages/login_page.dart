import 'package:flutter/material.dart';
import 'package:project001/components/login/login_button_component.dart';
import 'package:project001/controllers/login_controller.dart';
import 'package:project001/widgets/text_field_widget.dart';

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
            TextFieldWidget(onChanged: _controller.setLogin, label: 'Login'),
            TextFieldWidget(
              onChanged: _controller.setPassword,
              label: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 15),
            LoginButtonComponent(loginController: _controller)
          ],
        ),
      ),
    );
  }
}
