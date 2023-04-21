import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_button.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_text.dart';
import 'package:camp_finder/app/ui/modules/login/widgets/login_square_tile.dart';
import 'package:camp_finder/app/ui/modules/register_new_customer/controller/register_new_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterNewCustomerPage extends GetView<RegisterNewCustomerController> {
  const RegisterNewCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    padlockImg(),
                    // welcome back, you've been missed!
                    loginTitle(),
                    CustomInputText(
                      controller:
                          controller.customInputController.nameTextController,
                      hintText: 'Nome',
                      isObscure: false,
                      isValid: controller.customInputController.nameIsValid,
                      errorText: controller.customInputController.nameErrorText,
                      onChange: controller.customInputController.setFullName,
                      clearField:
                          controller.customInputController.clearFullName,
                      fieldText: controller.customInputController.fullName,
                    ),
                    // username textfield
                    CustomInputText(
                      controller:
                          controller.customInputController.emailTextController,
                      hintText: 'E-mail',
                      isObscure: false,
                      isValid: controller.customInputController.emailIsValid,
                      errorText:
                          controller.customInputController.emailErrorText,
                      onChange: controller.customInputController.setEmail,
                      clearField: controller.customInputController.clearEmail,
                      fieldText: controller.customInputController.email,
                    ),
                    // password textfield
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

                    // Confirm password textfield
                    CustomInputText(
                      controller: controller
                          .customInputController.confirmPassTextController,
                      hintText: 'Confirmar Senha',
                      isObscure: true,
                      isValid:
                          controller.customInputController.confirmPassIsValid,
                      errorText: controller.customInputController.passErrorText,
                      onChange:
                          controller.customInputController.setConfirmPassword,
                      clearField:
                          controller.customInputController.clearConfirmPass,
                      fieldText: controller.customInputController.confirmPass,
                      setShowPass:
                          controller.customInputController.setConfirmShowPass,
                      showPass:
                          controller.customInputController.showConfirmPass,
                    ),

                    // sign up button
                    CustomInputButton(
                      onTap: () {
                        if (controller.customInputController
                            .allRegisterCheck()) {
                          controller.addNewCustomer(
                              nameCustomer: controller.customInputController
                                  .nameTextController.text,
                              loginCustomer: controller.customInputController
                                  .emailTextController.text,
                              password: controller.customInputController
                                  .passTextController.text);
                        }
                      },
                      labelButton: "Cadastrar",
                    ),
                    // or continue with
                    orContinueWith(),
                    const SizedBox(height: 30),
                    // google sign in button
                    googleSignInIcon(),
                    const SizedBox(height: 50),
                    // login link
                    signInLink(),
                    const SizedBox(height: 60),
                  ],
                )),
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
          "Cadastre-se agora!",
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
          'Já é cadastrado?',
          style: TextStyle(color: Colors.grey[700]),
        ),
        const SizedBox(width: 4),
        InkWell(
          child: const Text(
            'Faça o login agora',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Get.toNamed(AppRoutes.LOGIN_PAGE);
          },
        ),
      ],
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