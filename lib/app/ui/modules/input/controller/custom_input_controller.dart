import 'package:camp_finder/app/core/constants/errors_messages.dart';
import 'package:camp_finder/app/core/custom/snackbar_custom.dart';
import 'package:camp_finder/app/core/validation/custom_validation.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomInputController extends GetxController {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  TextEditingController confirmPassTextController = TextEditingController();
  RxString _fullName = ''.obs;
  RxString _email = ''.obs;
  RxString _pass = ''.obs;
  RxString _confirmPass = ''.obs;
  RxBool _nameIsValid = true.obs;
  RxBool _emailIsValid = true.obs;
  RxBool _passIsValid = true.obs;
  RxBool _confirmPassIsValid = true.obs;
  RxBool _showPass = true.obs;
  RxBool _showConfirmPass = true.obs;

  String get fullName => _fullName.value;
  String get email => _email.value;
  String get pass => _pass.value;
  String get confirmPass => _confirmPass.value;

  String get nameErrorText => ErrorMessages.FULL_NAME_TWO_WORDS_ERROR;
  String get emailErrorText => ErrorMessages.EMAIL_ERROR;
  String get passErrorText => ErrorMessages.PASSWORD_ERROR;

  bool get nameIsValid => _nameIsValid.value;
  bool get emailIsValid => _emailIsValid.value;
  bool get passIsValid => _passIsValid.value;
  bool get confirmPassIsValid => _confirmPassIsValid.value;
  bool get showPass => _showPass.value;
  bool get showConfirmPass => _showConfirmPass.value;

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passTextController.dispose();
    confirmPassTextController.dispose();
    super.dispose();
  }

  // name
  setFullName(String value) {
    _fullName.value = value.trim();
    EasyDebounce.debounce('check-full-name-debouncer',
        const Duration(milliseconds: 500), () => _checkFullNameIsValid());
  }

  clearFullName() {
    _fullName.value = '';
    _nameIsValid = false.obs;
    nameTextController.clear();
  }

  void _checkFullNameIsValid() {
    bool _hasTwoWords = CustomValidation.validateTwoWords(fullName);
    bool _hasSpecialCharacters =
        CustomValidation.hasSpecialCharacters(fullName);
    bool _hasNumbers = CustomValidation.hasNumbers(fullName);
    _nameIsValid.value = _hasTwoWords && !_hasSpecialCharacters && !_hasNumbers;
  }

  //Email
  setEmail(String value) {
    _email.value = value;
    if (value.isNotEmpty) {
      EasyDebounce.debounce(
        'check-valid-email',
        const Duration(milliseconds: 500),
        () {
          validateEmailText();
        },
      );
    }
  }

  clearEmail() {
    _email.value = '';
    emailTextController.clear();
  }

  validateEmailText() {
    if (email.isEmpty) {
      _emailIsValid.value = false;
    } else {
      _emailIsValid.value = CustomValidation.validateEmail(email.trim());
    }
  }

  //Password
  setPassword(String value) {
    _pass.value = value.trim();
    EasyDebounce.debounce('check-password-debouncer',
        const Duration(milliseconds: 500), () => _checkPasswordIsValid());
  }

  void _checkPasswordIsValid() {
    _passIsValid.value = validPass(pass: passTextController.text);
  }

  bool validPass({required String pass}) {
    RegExp regExp = RegExp('(.{6,})');
    //>= 6 caracters
    if (regExp.hasMatch(pass)) {
      return true;
    }
    return false;
  }

  setShowPass(bool isShow) {
    _showPass.value = isShow;
  }

  clearPass() {
    _pass.value = '';
    passTextController.clear();
  }

// ConfirmPassword
  setConfirmPassword(String value) {
    _confirmPass.value = value.trim();
    EasyDebounce.debounce(
        'check-confim-password-debouncer',
        const Duration(milliseconds: 500),
        () => _checkConfirmPasswordIsValid());
  }

  void _checkConfirmPasswordIsValid() {
    _confirmPassIsValid.value = validPass(pass: confirmPassTextController.text);
  }

  clearConfirmPass() {
    _confirmPass.value = '';
    confirmPassTextController.clear();
  }

  setConfirmShowPass(bool isShow) {
    _showConfirmPass.value = isShow;
  }

//validation to RegisterPage
//validate confirmPass and pass equals
  bool checkConfirmPassMatch() {
    if (_confirmPass.value != _pass.value) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.PASSWORD_CONFIRMATION_ERROR, isError: true);
      return false;
    }
    return true;
  }

  bool checkValidInputs() {
    if (!(_nameIsValid.value &&
        _emailIsValid.value &&
        _passIsValid.value &&
        _confirmPassIsValid.value)) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.INCORRECT_INPUTS, isError: true);
      return false;
    }
    return true;
  }

  bool checkAllInputs() {
    if (_chkInput(input: _fullName.value) ||
        _chkInput(input: _email.value) ||
        _chkInput(input: _pass.value) ||
        _chkInput(input: _confirmPass.value)) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.ALL_INPUTS_ERROR, isError: true);
      return false;
    }
    return true;
  }

  bool _chkInput({required String? input}) {
    return CustomValidation.isNullOrWhiteSpace(input);
  }

  bool allRegisterCheck() {
    return checkAllInputs() && checkValidInputs() && checkConfirmPassMatch();
  }

  //Validation to LoginPage
  bool checkValidLoginInputs() {
    if (!(_emailIsValid.value && _passIsValid.value)) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.INCORRECT_INPUTS, isError: true);
      return false;
    }
    return true;
  }

  bool checkLoginInputs() {
    if (_chkInput(input: _email.value) || _chkInput(input: _pass.value)) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.ALL_INPUTS_ERROR, isError: true);
      return false;
    }
    return true;
  }

  bool allLoginCheck() {
    return checkLoginInputs() && checkValidLoginInputs();
  }

//forgot password
  bool checkForgotPasswordInput() {
    if (_chkInput(input: _email.value)) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.EMAIL_ERROR, isError: true);
      return false;
    }
    return true;
  }

  bool checkValidEmailInput() {
    if (!(_emailIsValid.value)) {
      SnackbarCustom.showSnackbar(
          message: ErrorMessages.EMAIL_ERROR, isError: true);
      return false;
    }
    return true;
  }

  bool allForgotPassCheck() {
    return checkForgotPasswordInput() && checkValidEmailInput();
  }
}
