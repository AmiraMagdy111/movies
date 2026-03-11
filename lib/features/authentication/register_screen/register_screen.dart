import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routing/routes.dart';
import 'package:movies/core/theming/styles_manager.dart';
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
  final _formKey =GlobalKey<FormState>();
  final nameController= TextEditingController();
  final emailController= TextEditingController();
  final passController= TextEditingController();
  final confirmPassController= TextEditingController();

  final phoneController= TextEditingController();
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

      appBar:AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Register"),) ,
      body:SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    AvatarSelector(),
                  ],
                ),
                SizedBox(height: 67.h),
        
                CustomTextFormField(
                  controller: nameController,
                  hintText: "Name",
                  prefixIcon:  Icon(
                    Icons.person,
                    color: ColorsManager.white,
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
        
                    if (value.length < 3) {
                      return "Name must be at least 3 characters";
                    }
        
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return "Name must contain letters only";
                    }
        
                    return null;
                  },
                ),
        
                SizedBox(height: 22.h),
        
        
                CustomTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon:  Icon(
                    Icons.email,
                    color: ColorsManager.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
        
        
                    if (value.contains(' ')) {
                      return "Email must not contain spaces";
                    }
        
        
                    final emailRegex =
                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        
                    if (!emailRegex.hasMatch(value)) {
                      return "Enter a valid email address";
                    }
        
                    return null;
                  },
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
                      isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordObscure = !isPasswordObscure;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
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
        
                  suffixIcon:IconButton(
                    icon: Icon(
                      isConfirmPasswordObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordObscure = !isConfirmPasswordObscure;
                      });
                    },
                  ),
        
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
        
                    if (value != passController.text) {
                      return "Passwords do not match";
                    }
        
                    return null;
                  },
        
                ),
        
                SizedBox(height: 22.h),
        
        
                CustomTextFormField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  labelText: 'Phone',
                  prefixIcon:  Icon(
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
                CustomElevatedButton(text: 'Create Account',
                    onPress: () {
                  if(_formKey.currentState!.validate()){
                    print('Form is Valid');
                  }
                    }),
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
}
