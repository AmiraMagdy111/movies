import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/widget/custome_elevated_button.dart';
import '../../../core/helpers/image_icons_svgs_helper.dart';
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
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlack,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 67),
                Image.asset(
                  ImageManager.logo,
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 69),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 22),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline,
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
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 17.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password ?',
                        style: StylesManager.googleFont14OrangeRegular,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33),
                CustomElevatedButton(text: 'Login', onPress: () {}),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: StylesManager.googleFont14WhiteRegular,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Create One',
                        style: StylesManager.googleFont14OrangeBold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                CustomElevatedButton(
                  text: 'Login With Google',
                  prefixIcon: Image.asset(IconsManager.googleIcon),
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
