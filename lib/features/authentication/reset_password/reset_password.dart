import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/image_icons_svgs_helper.dart';
import 'package:movies/core/helpers/text_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/utils/utile_validator.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/core/widget/custome_elevated_button.dart';

import '../../../clean_architecture/cubit/auth_cubit.dart';
import '../../../core/theming/colors_manager.dart';
import '../../../core/utils/ui_utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}
class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
      listener: (context,state){
        if(state is ResetPasswordLoading){
          UIUtils.showLoading(context);
        }else if (state is AuthError){
          UIUtils.hideDialog(context);
          UIUtils.showToastMessage(message: state.message,
              bgColor: Colors.red,
              fgColor: ColorsManager.white);
        }else if (state is ResetPasswordSuccess){
          UIUtils.hideDialog(context);
          UIUtils.showToastMessage(
              message: "Check your email to reset password",
              bgColor: Colors.green,
              fgColor: ColorsManager.white);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forget Password",style: StylesManager.sectionTitle16regular.copyWith(
            fontSize: 20.sp
          ),),
        ),
        body: Padding(
          padding: REdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageManager.resetPassImage),
                SizedBox(height: 24.h,),
                CustomTextFormField(
                    controller: emailController,
                    hintText: TextManager.email,
                    labelText: TextManager.enterYourEmail,
                  prefixIcon:  Icon(
                    Icons.email_outlined,
                    color: ColorsManager.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.validateEmail
                ),
                SizedBox(height: 24.h,),
              CustomElevatedButton(text: TextManager.verifyEmail, onPress:_verifyEmail,buttonText: "",),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verifyEmail() {
    if (!_formKey.currentState!.validate()) return;
    BlocProvider.of<AuthCubit>(context).resetPassword(email: emailController.text);
  }
}
