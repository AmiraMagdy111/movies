
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/utils/ui_utils.dart';
import 'package:movies/core/utils/utile_validator.dart';
import 'package:movies/features/authentication/register_screen/widget/avatar_selector.dart';
import '../../../clean_architecture/domain/cubit/auth_cubit.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../../core/widget/custome_elevated_button.dart';
class RegisterScreen extends StatefulWidget {
 const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final phoneController = TextEditingController();
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  String selectedAvatar = "";
  //bool isSubmitting = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocListener<AuthCubit,AuthState>(
        listener: (context,state) {
          if (state is AuthLoading) {
            UIUtils.showLoading(context,dismissible: true);
          } else if (state is AuthError) {
            UIUtils.hideDialog(context);
            UIUtils.showToastMessage(message: state.message,
                bgColor: ColorsManager.red,
                fgColor: ColorsManager.white);
          }else if (state is AuthSuccess) {
            UIUtils.hideDialog(context);
            UIUtils.showToastMessage(
                message: "User Registered Successfully",
                bgColor: ColorsManager.green,
                fgColor: ColorsManager.white);
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          }
        },
      child: Scaffold(
        backgroundColor: ColorsManager.primaryBlack,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Register"),),
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AvatarSelector(
                        onAvatarSelected: (avatar) {
                          selectedAvatar = avatar;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 67.h),
                  CustomTextFormField(
                    controller: nameController,
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person,
                      color: ColorsManager.white,
                    ),
                    validator: Validator.validateName
                    ///  taha implemented validator,i just split it in widget
                  ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: ColorsManager.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator.validateEmail
                     /// taha implemented validator,i just split it in widget
                  ),
                  SizedBox(height: 22.h),
                      CustomTextFormField(
                      controller: passController,
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: ColorsManager.white,
                      ),
                      obscureText: isPasswordObscure,
                      suffixIcon:
                      IconButton(
                        icon: Icon(
                          isPasswordObscure ? Icons.visibility_off : Icons
                              .visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      ),
                      validator: Validator.validatePassword
                         /// taha implemented validator,i just split it in widget
                      //obscureText: true,
                    ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    controller: confirmPassController,
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: ColorsManager.white,
                    ),
                    obscureText: isConfirmPasswordObscure,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordObscure ? Icons.visibility_off : Icons
                            .visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordObscure = !isConfirmPasswordObscure;
                        });
                      },
                    ),
                    validator: (password){
                      return Validator.validateConfrimPassword(password,passController.text);
                    }
                    /// taha implemented validator,i just split it in widget
                  ),
                  SizedBox(height: 22.h),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: "Phone Number",
                    labelText: 'Phone',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: ColorsManager.white,
                    ),
                    keyboardType: TextInputType.phone,
                    validator: Validator.validatePhone
                  ),
                  SizedBox(height: 22.h),
                   CustomElevatedButton(text: 'Create Account',buttonText: "",
                        onPress: _createAccount
                      // if(_formKey.currentState!.validate()){
                      //   print('Form is Valid');
                      // }
                      //   }),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account?",
                        style: StylesManager.googleFont14WhiteRegular,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.loginScreen);
                        },
                        child: Text(
                          'Login',
                          style: StylesManager.googleFont14OrangeBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() async {
      if (!_formKey.currentState!.validate()) return;
      if (selectedAvatar.isEmpty) {
        UIUtils.showToastMessage(
          message: "Please select an avatar",
          bgColor: Colors.red,
          fgColor: Colors.white,
        );
        return;
      }
      context.read<AuthCubit>().register(
       name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passController.text.trim(),
        phone: phoneController.text.trim(),
        avatar: selectedAvatar,
      );
    }
  }

