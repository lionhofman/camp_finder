import 'package:camp_finder/app/ui/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_button.dart';
import 'package:camp_finder/app/ui/modules/input/widgets/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  padlockImg(),
                  // welcome back, you've been missed!
                  forgotPassTitle(),
                  // username textfield

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

                  // sign in button
                  CustomInputButton(
                    onTap: () {
                      if (controller.customInputController
                          .allForgotPassCheck()) {
                        controller.resetPassword(
                          email: controller
                              .customInputController.emailTextController.text,
                        );
                      }
                    },
                    labelButton: "Redefinir a senha",
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
    return const Padding(
      padding: EdgeInsets.only(bottom: 16, top: 50),
      child: Icon(
        Icons.password,
        size: 100,
      ),
    );
  }

  Widget forgotPassTitle() {
    return const Padding(
        padding: EdgeInsets.only(
          top: 18,
          bottom: 20,
        ),
        child: Text(
          "Enviaremos um e-mail para redefinir sua senha!",
          style: TextStyle(fontSize: 16),
        ));
  }
}
