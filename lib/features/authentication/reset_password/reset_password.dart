import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/helpers/image_icons_svgs_helper.dart';
import 'package:movies/core/helpers/text_manager.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/core/widget/custome_elevated_button.dart';

import '../../../core/theming/colors_manager.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: REdgeInsets.all(16),
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
            SizedBox(height: 24.h,),
            CustomElevatedButton(text: TextManager.verifyEmail, onPress: (){})
          ],
        ),
      ),
    );
  }
}
