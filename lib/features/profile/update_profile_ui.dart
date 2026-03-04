import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/widget/custome_elevated_button.dart';
import 'update_profile_cubit.dart';
import 'update_profile_states.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  static const String routName = '/updateProfile';

  @override
  State<UpdateProfile> createState() => UpdateProfileState();
}

class UpdateProfileState extends State<UpdateProfile> {
  final List<String> avatarImages = List.generate(
    9, (index) => 'assets/profileImages/image ${index + 1}.png',
  );

  @override
  void initState() {
    super.initState();
    context.read<UpdateProfileCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileStates>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile Updated Successfully!')),
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<UpdateProfileCubit>();

        return Scaffold(
          backgroundColor: ColorsManager.primaryBlack,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: ColorsManager.primaryOrange),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Update Profile',
              style: StylesManager.googleFont20BlackRegular.copyWith(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: state is GetUserLoading
              ? Center(child: CircularProgressIndicator(color: ColorsManager.primaryOrange))
              : SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: CircleAvatar(
                    radius: 60.r,
                    backgroundImage: AssetImage(cubit.selectedAvatar),
                  ),
                ),
                SizedBox(height: 30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      TextField(
                        controller: cubit.nameController,
                        style: StylesManager.googleFont14WhiteRegular,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(color: ColorsManager.primaryOrange),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsManager.primaryOrange)),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      TextField(
                        controller: cubit.phoneController,
                        style: StylesManager.googleFont14WhiteRegular,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(color: ColorsManager.primaryOrange),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorsManager.primaryOrange)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: avatarImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 15.w,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            cubit.selectedAvatar = avatarImages[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: cubit.selectedAvatar == avatarImages[index]
                                  ? ColorsManager.primaryOrange
                                  : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Image.asset(avatarImages[index]),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    children: [
                      CustomElevatedButton(
                        onPress: () => cubit.updateProfile(),
                        buttonText: 'Save Changes',
                        text: 'Save Changes',
                      ),
                      SizedBox(height: 15.h),
                      TextButton(
                        onPressed: () => cubit.deleteAccount(),
                        child: Text(
                          'Delete Account',
                          style: StylesManager.googleFont14WhiteRegular.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}