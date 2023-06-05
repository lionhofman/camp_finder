import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_button.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_text.dart';
import 'package:camp_finder/app/ui/modules/login/contoller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoading = ValueNotifier(false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  padlockImg(),
                  loginTitle(),
                  const SizedBox(height: 16),
                  CustomInputText(
                    controller:
                        controller.customInputController.emailTextController,
                    hintText: 'Login',
                    isObscure: false,
                    isValid: controller.customInputController.emailIsValid,
                    errorText: controller.customInputController.emailErrorText,
                    onChange: controller.customInputController.setEmail,
                    clearField: controller.customInputController.clearEmail,
                    fieldText: controller.customInputController.email,
                  ),
                  const SizedBox(height: 16),
                  CustomInputText(
                    controller:
                        controller.customInputController.passTextController,
                    hintText: 'Senha',
                    isObscure: true,
                    isValid: controller.customInputController.passIsValid,
                    errorText: controller.customInputController.passErrorText,
                    onChange: controller.customInputController.setPassword,
                    clearField: controller.customInputController.clearPass,
                    fieldText: controller.customInputController.pass,
                    setShowPass: controller.customInputController.setShowPass,
                    showPass: controller.customInputController.showPass,
                  ),
                  const SizedBox(height: 16),
                  forgotPass(),
                  ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder:
                        (BuildContext context, bool loading, Widget? child) {
                      return CustomInputButton(
                        onTap: () async {
                          if (controller.customInputController
                              .allLoginCheck()) {
                            isLoading.value = true;

                            await controller.loginEmail(
                                loginCustomer: controller.customInputController
                                    .emailTextController.text,
                                password: controller.customInputController
                                    .passTextController.text);

                            isLoading.value = false;
                          }
                        },
                        isLoading: loading,
                        labelButton: 'Entrar',
                      );
                    },
                  ),
                  orContinueWith(),
                  const SizedBox(height: 30),
                  googleSignInIcon(),
                  const SizedBox(height: 50),
                  signInLink(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginTitle() {
    return const Text(
      "Faça seu login!",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget padlockImg() {
    return Icon(
      Icons.lock,
      size: 80,
      color: Colors.grey[600],
    );
  }

  Widget forgotPass() {
    return TextButton(
      child: const Text(
        'Esqueceu a Senha?',
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.toNamed(AppRoutes.FORGOT_PASSWORD_PAGE);
        });
      },
    );
  }

  Widget orContinueWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey[600],
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
              thickness: 1,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget googleSignInIcon() {
    return ValueListenableBuilder(
      valueListenable: controller.isLoadingGoogleSignIn,
      builder: (BuildContext context, bool isLoading, _) {
        return isLoading
            ? const CircularProgressIndicator() // Mostra um spinner de carregamento se o login estiver em andamento.
            : IconButton(
                iconSize: 50,
                icon: Image.asset('assets/png/google.png'),
                onPressed: controller.loginSocialGoogle,
              );
      },
    );
  }

  Widget signInLink() {
    return TextButton(
      child: const Text(
        'Não é cadastrado ainda? Se cadastre agora',
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Get.toNamed(AppRoutes.REGISTER_PAGE);
      },
    );
  }

  void showErrorMessage({
    required String errorMessage,
  }) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
