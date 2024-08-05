import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/presentation/logic/posts/post_bloc.dart';
import 'package:instagram_project/presentation/logic/otherUserBloc/other_user_bloc.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';
import 'package:instagram_project/presentation/pages/CreateMenu/create_menu.dart';
import 'package:instagram_project/presentation/pages/MenuDropDown/menu_bar.dart';
import 'package:instagram_project/presentation/pages/editProfilePage/edit_profile_page.dart';
import 'package:instagram_project/presentation/pages/profilePage/posts_view.dart';
import 'package:instagram_project/presentation/pages/profilePage/tags_view.dart';
import 'package:instagram_project/presentation/widgets/buttom_nav_bar.dart';

mixin _HomePageMixin {
  void _userBlocListener(BuildContext context, UserState state) {
    if (state is UserFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error ?? ''),
        ),
      );
    }
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with _HomePageMixin {
  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    final userId = context.read<UserBloc>().state.userEntity?.userId ?? "";
    context.read<PostBloc>().add(GetAllPostsByUserIdEvent(userId: userId));
    context.read<OtherUserBloc>().add(const GetUsersCollectionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: _userBlocListener,
      builder: (context, userState) {
        if (userState is UserLoaded) {
          currentUser = userState.userEntity;
        }

        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                currentUser?.displayName?.split(' ')[0] ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: const [
              CreateMenu(),
              SizedBox(width: 10),
              MenuDropDown(),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 48,
                              backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.black,
                                backgroundImage: NetworkImage(
                                  currentUser?.photoUrl ?? "",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              currentUser?.displayName ?? "",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Bio',
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 32,
                    child: BlocBuilder<OtherUserBloc, OtherUserState>(
                      builder: (context, otherUserState) {
                        int followersCount = 0;
                        int followingCount = 0;

                        if (otherUserState is UsersLoaded) {
                          followersCount = otherUserState.users!.length;
                          followingCount = otherUserState.users!.length;
                        }

                        return BlocBuilder<PostBloc, PostState>(
                          builder: (context, postState) {
                            String postCount = '0';
                            if (postState is PostLoaded) {
                              postCount = postState.posts!.length.toString();
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          postCount,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'Posts',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Text(
                                          followersCount.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'Followers',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      children: [
                                        Text(
                                          followingCount.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'Following',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/pictures/Edit profile.svg',
                      height: 33,
                      width: 70,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/pictures/Group 13.svg',
                      height: 33,
                      width: 70,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/pictures/Group 14.svg',
                      height: 33,
                      width: 70,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  return Expanded(
                    child: LayoutBuilder(
                      builder: (ctx, constraints) {
                        if (state is PostLoaded) {
                          final halfScreenHeight = constraints.maxHeight;
                          return Column(
                            children: [
                              SizedBox(
                                height: halfScreenHeight,
                                child: PageView(
                                  children: [
                                    PostsView(
                                      posts: state.posts,
                                    ),
                                    const TagsView(
                                      itemCount: 6,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (state is PostLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is PostLoadFaild) {
                          return Center(
                            child: Text(state.message),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            imageUrl: currentUser?.photoUrl ?? "",
          ),
        );
      },
    );
  }
}
