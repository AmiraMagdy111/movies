import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/helpers/text_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/utils/ui_utils.dart';
import 'package:movies/core/widget/custome_elevated_button.dart';
import '../../../clean_architecture/domain/cubit/auth_cubit.dart';
import '../../../core/helpers/image_icons_svgs_helper.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/utils/utile_validator.dart';
import '../../../core/widget/custom_text_form_field.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
      listener: (context,state){
        if (state is AuthLoading ) {
          UIUtils.showLoading(context);
        }
        else if (state is AuthError) {
          UIUtils.hideDialog(context);
          UIUtils.showToastMessage(
            message: state.message,
            bgColor: ColorsManager.red,
            fgColor: ColorsManager.white,
          );
        }
        else if (state is AuthSuccess ) {
          UIUtils.hideDialog(context);
          UIUtils.showToastMessage(
            message: "User Logged Successfully",
            bgColor: ColorsManager.green,
            fgColor: ColorsManager.white,
          );
          Navigator.pushReplacementNamed(context,Routes.mainLayout);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 67.h),
                  Image.asset(
                    ImageManager.logo,
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 69.h),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: ColorsManager.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator.validateEmail
                      /// Amira implemented validator,i just split it in widget
                  ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: TextManager.enterYourPassword,
                    labelText: TextManager.password,
                    prefixIcon:  Icon(
                      Icons.lock_outline,
                      color: ColorsManager.white,
                    ),
                    obscureText: isObscure,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                    validator: Validator.validatePassword
                    /// Amira implemented validator,i just split it in widget
                  ),
                  SizedBox(height: 17.3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.resetPassword);
                        },
                        child: Text(
                          "forget password",
                          style: StylesManager.googleFont14OrangeRegular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 33.h),
                CustomElevatedButton(text: 'Login', onPress:_login,buttonText: "",),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: StylesManager.googleFont14WhiteRegular,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context ,Routes.registerScreen);
                        },
                        child: Text(
                         "Create one",
                          style: StylesManager.googleFont14OrangeBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                     CustomElevatedButton(
                       buttonText: "",
                      text: "Login With Google",
                      prefixIcon: Image.asset(IconsManager.googleIcon),
                      onPress: _signWithGoogle,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _login() {
    if (!_formKey.currentState!.validate()) return;
    BlocProvider.of<AuthCubit>(context).login(email: emailController.text, password: passwordController.text);
  }

  void _signWithGoogle() {
    BlocProvider.of<AuthCubit>(context).signInWithGoogle();
  }
}
