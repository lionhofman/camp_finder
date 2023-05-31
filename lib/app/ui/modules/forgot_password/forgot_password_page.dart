import 'package:camp_finder/app/ui/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_button.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
                  const SizedBox(height: 24),
                  padlockImg(),
                  const SizedBox(height: 24),
                  forgotPassTitle(),
                  const SizedBox(height: 24),
                  CustomInputText(
                    controller:
                        controller.customInputController.emailTextController,
                    hintText: 'E-mail',
                    isObscure: false,
                    isValid: controller.customInputController.emailIsValid,
                    errorText: controller.customInputController.emailErrorText,
                    onChange: controller.customInputController.setEmail,
                    clearField: controller.customInputController.clearEmail,
                    fieldText: controller.customInputController.email,
                  ),
                  const SizedBox(height: 24),
                  ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder:
                        (BuildContext context, bool loading, Widget? child) {
                      return CustomInputButton(
                        onTap: () async {
                          if (controller.customInputController
                              .allForgotPassCheck()) {
                            isLoading.value = true;

                            await controller.resetPassword(
                              email: controller.customInputController
                                  .emailTextController.text,
                            );

                            isLoading.value = false;
                          }
                        },
                        isLoading: loading,
                        labelButton: 'Redefinir a senha',
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padlockImg() {
    return Icon(
      Icons.lock_open,
      size: 80,
      color: Colors.grey[600],
    );
  }

  Widget forgotPassTitle() {
    return const Text(
      "Enviaremos um e-mail para redefinir sua senha!",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
