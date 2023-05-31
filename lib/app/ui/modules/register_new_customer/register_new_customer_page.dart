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
    ValueNotifier<bool> isLoading = ValueNotifier(false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    padlockImg(),
                    const SizedBox(height: 24),
                    loginTitle(),
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
                    ValueListenableBuilder(
                      valueListenable: isLoading,
                      builder:
                          (BuildContext context, bool loading, Widget? child) {
                        return CustomInputButton(
                          onTap: () async {
                            if (controller.customInputController
                                .allRegisterCheck()) {
                              isLoading.value = true;
                              await controller.addNewCustomer(
                                  nameCustomer: controller.customInputController
                                      .nameTextController.text,
                                  loginCustomer: controller
                                      .customInputController
                                      .emailTextController
                                      .text,
                                  password: controller.customInputController
                                      .passTextController.text);
                              isLoading.value = false;
                            }
                          },
                          isLoading: loading,
                          labelButton: 'Cadastrar',
                        );
                      },
                    ),
                    // sign up button
                    // CustomInputButton(
                    //   onTap: () {
                    //     if (controller.customInputController
                    //         .allRegisterCheck()) {
                    //       controller.addNewCustomer(
                    //           nameCustomer: controller.customInputController
                    //               .nameTextController.text,
                    //           loginCustomer: controller.customInputController
                    //               .emailTextController.text,
                    //           password: controller.customInputController
                    //               .passTextController.text);
                    //     }
                    //   },
                    //   labelButton: "Cadastrar",
                    // ),
                    const SizedBox(height: 30),
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
    return const Text(
      "Cadastre-se agora!",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget padlockImg() {
    return Icon(
      Icons.person_add,
      size: 80,
      color: Colors.grey[600],
    );
  }

  Widget orContinueWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 22),
          child: Text(
            'Ou continue com',
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget googleSignInIcon() {
    return IconButton(
      iconSize: 50,
      icon: Image.asset('assets/png/google.png'),
      onPressed: () {
        // Handle Google login
      },
    );
  }

  Widget signInLink() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.LOGIN_PAGE);
      },
      child: RichText(
        text: TextSpan(
          text: 'Já é cadastrado? ',
          style: TextStyle(color: Colors.grey[700], fontSize: 16),
          children: const <TextSpan>[
            TextSpan(
              text: 'Faça o login agora',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
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
