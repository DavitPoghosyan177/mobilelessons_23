import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';
import 'package:instagram_project/presentation/pages/MenuDropDown/menu_bar.dart';
import 'package:instagram_project/presentation/pages/profilePage/tags_view.dart';
import 'package:instagram_project/presentation/widgets/buttom_nav_bar.dart';

mixin _HomePageMixin {
  void _userBlocListener(BuildContext context, state) {
    if (state is UserFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error ?? ''),
        ),
      );
    }
  }
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key, this.userEntity});
  final UserEntity? userEntity;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> with _HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        listener: _userBlocListener,
        builder: (context, state) {
          final userEntity = state.userEntity;
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "..",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
              actions: const [
                MenuDropDown(),
              ],
            ),
            body: Column(
              children: [
                const SizedBox(height: 20),
                const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "...",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text('Bio',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text('6',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text('Posts',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text('421',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text('Followers',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text('444',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text('Following',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ],
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
                        'assets/pictures/Following.svg',
                        height: 33,
                        width: 70,
                      ),
                      onPressed: () {
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/pictures/massage.svg',
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
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final halfScreenHeight = constraints.maxHeight;
                      return Column(
                        children: [
                          SizedBox(
                            height: halfScreenHeight,
                            child: PageView(
                              children: const [
                                // PostsView(
                                //   itemCount: 6,
                                //   color: Colors.pink,
                                // ),
                                TagsView(
                                  itemCount: 6,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavBar(
              imageUrl: userEntity?.photoUrl ?? "",
            ),
          );
        });
  }
}
