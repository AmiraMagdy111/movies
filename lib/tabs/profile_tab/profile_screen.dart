import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/tabs/profile_tab/tab_bar/widget/custom_tab_bar_widget.dart';
import '../../clean_architecture/domain/repository/auth_repository.dart';
import '../../core/di/di.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/colors_manager.dart';
import '../../model/watchlist_movies_model/watchlist_movies_model.dart';
import 'update_profile_cubit.dart';
import 'update_profile_states.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final authRepository = getIt<AuthRepository>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UpdateProfileCubit>()..getUserData(),
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileStates>(
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
                              radius: 40.r, backgroundColor:ColorsManager.secondaryGrey,
                              backgroundImage:
                              (user?.profileImage != null &&
                                  user!.profileImage!.isNotEmpty)
                                  ? AssetImage(user.profileImage!) : const AssetImage(
                                  "assets/profileImages/image 1.png") as ImageProvider,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              user?.name ?? "User",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Spacer(),
                        StreamBuilder<List<WatchlistMoviesModel>>(
                          stream: authRepository.getMoviesFromFirestore(uid: uid),
                          builder: (context, snapshot) {
                            final count = snapshot.data?.length ?? 0;
                            return _buildStatColumn("$count", "Watch List");
                          },
                        ),
                        SizedBox(width: 25.w),
                        StreamBuilder(
                          stream: authRepository.getHistoryFromFirestore(uid: uid),
                          builder: (context, snapshot) {
                            final count = snapshot.data?.length ?? 0;
                            return _buildStatColumn("$count", "History");
                          },
                        ),
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
                              backgroundColor:
                              ColorsManager.secondaryOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10.r),
                              ),
                              padding:
                              REdgeInsets.symmetric(vertical: 12),
                            ),
                            onPressed: () async {
                              await Navigator.pushNamed(context, Routes.updateProfile);
                              if (!context.mounted) return;
                              context.read<UpdateProfileCubit>().getUserData();
                            },
                            child: const Text("Edit Profile", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.red,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            padding:
                            REdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: logOut,
                          child: const Icon(Icons.exit_to_app,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Divider(color: Colors.white24, thickness: 1),
                  CustomTabBarWidget()
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
        Text(count,style: GoogleFonts.roboto(
            color:ColorsManager.white,fontSize: 36.sp,fontWeight: FontWeight.bold)),
        Text(label,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,fontSize: 24.sp,color: ColorsManager.white )),
      ],
    );
  }
  void logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, Routes.loginScreen);
  }
}
