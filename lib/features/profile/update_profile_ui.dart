import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theming/colors_manager.dart';
import 'package:movies/core/theming/styles_manager.dart';
import 'package:movies/core/widget/custome_elevated_button.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  static const String routName = '/updateProfile';

  @override
  State<UpdateProfile> createState() => UpdateProfileState();
}
class UpdateProfileState extends State<UpdateProfile> {
  final List<String> avatarImages = List.generate(
    9,
        (index) => 'assets/profileImages/image ${index + 1}.png',
  );

  String selectedAvatar = 'assets/profileImages/image 1.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.yellow),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Update Profile',
          style: StylesManager.googleFont20BlackRegular.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Center(
              child: CircleAvatar(
                radius: 60.r,
                backgroundImage: AssetImage(selectedAvatar),
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
                        selectedAvatar = avatarImages[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedAvatar == avatarImages[index]
                              ? Colors.yellow
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
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
              child: CustomElevatedButton(onPress: (){
                Navigator.pop(context);
              },
                buttonText: 'Save Changes',text: 'Save Changes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}