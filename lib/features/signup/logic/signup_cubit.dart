import 'package:appointment_app/core/networking/api_result.dart';
import 'package:appointment_app/features/signup/data/models/signup_request_body.dart';
import 'package:appointment_app/features/signup/logic/signup_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/signup_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignupStates(SignupRequestBody signupRequestBody) async {
    emit(const SignupState.loading());

    final response = await _signupRepo.signup(signupRequestBody);

    response.when(
      success: (signupResponse) => emit(SignupState.success(signupResponse)),
      failure: (error) => emit(SignupState.error(error.apiErrorModel.message)),
    );
  }
}
