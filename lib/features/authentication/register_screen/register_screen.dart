
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/utils/ui_utils.dart';
import 'package:movies/core/utils/utile_validator.dart';
import 'package:movies/features/authentication/cubit/auth_cubit.dart';
import 'package:movies/features/authentication/register_screen/widget/avatar_selector.dart';


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
    return Scaffold(
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
                    AvatarSelector(),
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
                  /// taha impelement validator i just sperate it in widget
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
                    /// taha impelement validator i just sperate it in widget
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
                      /// taha impelement validator i just sperate it in widget
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
                  /// taha impelement validator i just sperate it in widget
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is required";
                    }
                    final phone = value.trim();
                    if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
                      return "Phone must contain numbers only";
                    }
                    if (!RegExp(r'^01[0-2,5][0-9]{8}$').hasMatch(value)) {
                      return "Enter a valid Egyptian phone number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 22.h),
                BlocListener<AuthCubit,AuthState>(
                    listener: (context,state) {
                      if (state is RegisterLoading) {
                        UIUtils.showLoading(context);
                      }
                      if (state is RegisterError) {
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(message: state.message,
                            bgColor: Colors.red,
                            fgColor: ColorsManager.white);
                      }
                      if (state is RegisterSuccess) {
                        UIUtils.hideDialog(context);
                        UIUtils.showToastMessage(
                            message: "User Registered Successfully",
                            bgColor: Colors.green,
                            fgColor: ColorsManager.white);
                      }
                    },
                  child: CustomElevatedButton(text: 'Create Account',
                      onPress: _createAccount
                    // if(_formKey.currentState!.validate()){
                    //   print('Form is Valid');
                    // }
                    //   }),
                  ),
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
    );
  }

  void _createAccount() async {
      if (_formKey.currentState!.validate() == false) return;
      BlocProvider.of<AuthCubit>(context).register(email: emailController.text, password: passController.text);
    //   try {
    //     UIUtils.showLoading(context, dismissible: false);
    //     UserCredential userCredential = await FirebaseAuth.instance
    //         .createUserWithEmailAndPassword(
    //         email: emailController.text, password: passController.text
    //     );
    //     UIUtils.hideDialog(context);
    //     UIUtils.showToastMessage(
    //         message: "User Created Successfully", bgColor: Colors.green,
    //         fgColor: ColorsManager.white);
    //   } on FirebaseAuthException catch (exception) {
    //     UIUtils.hideDialog(context);
    //     if (exception.code == 'weak-password') {
    //       UIUtils.showToastMessage(message: 'The password provided is too weak.',
    //           bgColor: Colors.red,
    //           fgColor: Colors.white);
    //     } else if (exception.code == 'email-already-in-use') {
    //       UIUtils.showToastMessage(
    //           message: 'The account already exists for that email.',
    //           bgColor: Colors.red,
    //           fgColor: Colors.white);
    //     }
    //   } catch (exception) {
    //     throw(exception.toString());
    //   }
    // }
    // }
  }
}
