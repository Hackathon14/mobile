import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_eco_mobile/auth/application/register_usecase.dart';
import 'package:smart_eco_mobile/auth/presentation/components/auth_bottom_action.dart';
import 'package:smart_eco_mobile/auth/presentation/components/custom_snack_bar.dart';
import 'package:smart_eco_mobile/auth/presentation/components/form_field_with_label.dart';
import 'package:smart_eco_mobile/auth/presentation/components/main_btn.dart';
import 'package:smart_eco_mobile/auth/presentation/register/register_controller.dart';
import 'package:smart_eco_mobile/di/container.dart';
import 'package:smart_eco_mobile/utils/app_text.dart';
import 'package:smart_eco_mobile/utils/constant.dart';
import 'package:smart_eco_mobile/utils/functions.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;

  void _handleRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Register user
      context.read<RegisterController>().register(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterController(
        di<RegisterUsecase>(),
      ),
      child: BlocListener<RegisterController, RegisterControllerState?>(
        listener: (context, state) {
          if (state is RegisterControllerSuccess) {
            context.go('/user-preferences');
            showSnackBar(
              context,
              AppText.registerSuccess,
            );
          } else if (state is RegisterControllerFailed) {
            showSnackBar(
              context,
              state.message!,
              isError: true,
            );
          }
        },
        child: Scaffold(
          body: Builder(builder: (context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalScreenPadding,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      const HeadTitle(
                        title: AppText.createAnAccount,
                        subTitle: AppText.registerDetails,
                      ),
                      const Gap(20),
                      FormFieldWithLabel(
                        label: AppText.name,
                        hintText: AppText.enterName,
                        controller: _nameController,
                        validator: nonEmptyStringValidator,
                        keyboardType: TextInputType.name,
                      ),
                      const Gap(10),
                      FormFieldWithLabel(
                        label: AppText.email,
                        hintText: AppText.enterEmail,
                        controller: _emailController,
                        validator: emailValidator,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const Gap(10),
                      FormFieldWithLabel(
                        label: AppText.password,
                        hintText: AppText.enterPassword,
                        controller: _passwordController,
                        validator: passwordValidator,
                        inputType: InputType.password,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const Gap(10),
                      FormFieldWithLabel(
                        label: AppText.confirmPassword,
                        hintText: AppText.enterConfirmPassword,
                        controller: _passwordConfirmController,
                        validator: (value) => confirmPasswordValidator(
                          value,
                          _passwordController.text,
                        ),
                        inputType: InputType.password,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const Gap(20),
                      MainBtn(
                        text: AppText.signUp,
                        showRightIcon: true,
                        onPressed: () => _handleRegister(context),
                      ),
                      const Spacer(),
                      Center(
                        child: AuthBottomAction(
                          firstText: '${AppText.alreadyAMember} ',
                          secondText: AppText.signIn,
                          onPressed: () {
                            context.go('/login');
                          },
                        ),
                      ),
                      const Gap(21),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 30 / 20,
            color: Colors.black,
          ),
        ),
        const Gap(5),
        Text(
          subTitle,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 11,
            height: 16.5 / 11,
            color: const Color(0xff121212),
          ),
        ),
      ],
    );
  }
}
