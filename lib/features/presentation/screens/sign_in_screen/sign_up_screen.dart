import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_wheelz_user/features/core/colors.dart';
import 'package:mini_wheelz_user/features/presentation/bloc/cubit/register_screeen_cubit.dart';
import 'package:mini_wheelz_user/features/presentation/screens/sign_in_screen/widgets/register_form_widget/register_form.dart';
 

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterFormCubit(),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: brownColr,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: RegisterForm(),
      ),
    );
  }
}
