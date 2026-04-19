
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../clean_architecture/domain/repository/auth_repository.dart';
import '../../core/di/di.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors_manager.dart';
import 'update_profile_cubit.dart';
import 'update_profile_states.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
         create: (_) => getIt<UpdateProfileCubit>()..getUserData(),

    // BlocProvider(
    //   create: (context) =>
    //       UpdateProfileCubit(
    //           getIt<AuthRepository>()
    //       ),
    //   context.read<AuthRepository>(),
    //   ..getUserData()

       child:  BlocBuilder<UpdateProfileCubit, UpdateProfileStates>(
          builder: (context, state) {
            var user = context.watch<UpdateProfileCubit>().userModel;
        return Scaffold(
          backgroundColor: ColorsManager.primaryBlack,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: ColorsManager.secondaryGrey,
                              backgroundImage: (user?.profileImage != null && user!.profileImage!.isNotEmpty)
                               ? AssetImage(user.profileImage!)
                              : const AssetImage("assets/profileImages/image 1.png") as ImageProvider,
                          ),
                           SizedBox(height: 8.h),
                          Text(
                            user?.name ?? "User",
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                       Spacer(),
                      _buildStatColumn("12", "Watch List"),
                       SizedBox(width: 25.w),
                      _buildStatColumn("10", "History"),
                    ],
                  ),
                ),
                 SizedBox(height: 25.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.secondaryOrange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                            padding: REdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () async {
                            await Navigator.pushNamed(context, Routes.updateProfile);

                            if (!context.mounted) return;
                            context.read<UpdateProfileCubit>().getUserData();
                          },
                          //onPressed: () => Navigator.pushNamed(context, Routes.updateProfile),
                          child: const Text("Edit Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: REdgeInsets.symmetric(vertical: 12),
                        ),
                       onPressed: logOut,
                        child: const Icon(Icons.exit_to_app, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: 30.w),
                const Divider(color: Colors.white24, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabItem(Icons.list, "Watch List", true),
                    _buildTabItem(Icons.history, "History", false),
                  ],
                ),
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.movie_filter_outlined, size: 80, color: Colors.white10),
                        SizedBox(height: 10),
                        Text("No content yet", style: TextStyle(color: Colors.white24)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
         ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _buildTabItem(IconData icon, String label, bool isActive) {
    return Column(
      children: [
        Icon(icon, color: isActive ? ColorsManager.secondaryOrange : Colors.white38),
        Text(label, style: TextStyle(color: isActive ? ColorsManager.secondaryOrange : Colors.white38)),
        if (isActive) Container(margin: const EdgeInsets.only(top: 5), height: 2, width: 60, color: ColorsManager.secondaryOrange),
      ],
    );
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context,Routes.loginScreen);
   }
}