import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/profile/wathchlist_cubit.dart';
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
  void initState() {
    super.initState();
    context.read<WatchlistCubit>().getWatchList("YOUR_TOKEN");
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileStates>(
      builder: (context, state) {
        var user = context.read<UpdateProfileCubit>().userModel;

        return Scaffold(
          backgroundColor: ColorsManager.primaryBlack,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: ColorsManager.secondaryGrey,
                            backgroundImage: (user?.profileImage != null && user!.profileImage!.isNotEmpty)
                                ? NetworkImage(user.profileImage!)
                                : const AssetImage('assets/images/user.png') as ImageProvider,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user?.name ?? "User",
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      _buildStatColumn("12", "Watch List"),
                      const SizedBox(width: 25),
                      _buildStatColumn("10", "History"),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.secondaryOrange,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () => Navigator.pushNamed(context, Routes.updateprofile),
                          child: const Text("Edit Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.red,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                        },
                        child: const Icon(Icons.exit_to_app, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(color: Colors.white24, thickness: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabItem(Icons.list, "Watch List", true),
                    _buildTabItem(Icons.history, "History", false),
                  ],
                ),
                 Expanded(
                  child: BlocBuilder<WatchlistCubit, WatchlistState>(
                      builder: (context, state) {
                        if (state is WatchlistLoading) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        else if (state is WatchlistLoaded) {
                          return ListView.builder(
                            itemCount: state.movies.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(state.movies[index].name, style: const TextStyle(color: Colors.white)),
                              );
                            },
                          );
                        }
                        else if (state is WatchlistError) {
                          return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                        }

                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.movie_filter_outlined, size: 80, color: Colors.white10),
                            SizedBox(height: 10),
                            Text("No content yet", style: TextStyle(color: Colors.white24)),
                          ],
                        );
                      },
                    ),

                ),
              ],
            ),
          ),
        );
      },
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
}