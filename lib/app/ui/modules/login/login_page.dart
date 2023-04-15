import 'package:camp_finder/app/ui/modules/login/widgets/login_input_text.dart';
import 'package:flutter/material.dart';

import 'widgets/login_button.dart';
import 'widgets/login_square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                padlockImg(),
                // welcome back, you've been missed!
                loginTitle(),
                // username textfield
                inputTextWidget(
                  controller: usernameController,
                  hint: 'Login',
                  isObscure: false,
                ),
                // password textfield
                inputTextWidget(
                  controller: usernameController,
                  hint: 'Senha',
                  isObscure: true,
                ),

                // forgot password?
                forgotPass(),
                // sign in button
                LoginButton(
                  onTap: signUserIn,
                ),
                // or continue with
                orContinueWith(),
                const SizedBox(height: 30),
                // google sign in button
                googleSignInIcon(),
                const SizedBox(height: 50),
                // not a member? register now
                signInLink(),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginTitle() {
    return const Padding(
        padding: EdgeInsets.only(
          top: 18,
          bottom: 20,
        ),
        child: Text(
          "Faça seu login!",
          style: TextStyle(fontSize: 16),
        ));
  }

  Widget padlockImg() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 16, top: 50),
      child: Icon(
        Icons.lock,
        size: 100,
      ),
    );
  }

  Widget inputTextWidget(
      {required TextEditingController controller,
      required String hint,
      required bool isObscure}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: LoginInputText(
          controller: controller, hintText: hint, obscureText: isObscure),
    );
  }

  Widget forgotPass() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Esqueceu a Senha?',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget orContinueWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 22),
            child: Text(
              'Ou continue com',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget googleSignInIcon() {
    return const LoginSquareTile(imagePath: 'assets/png/google.png');
  }

  Widget signInLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Não é cadastrado ainda?',
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 4),
        const Text(
          'Se cadastre agora',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
