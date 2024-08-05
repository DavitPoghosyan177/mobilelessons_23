import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/presentation/logic/posts/post_bloc.dart';
import 'package:instagram_project/presentation/logic/otherUserBloc/other_user_bloc.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';
import 'package:instagram_project/presentation/pages/CreateMenu/create_menu.dart';
import 'package:instagram_project/presentation/pages/homePage/story_card.dart';
import 'package:instagram_project/presentation/pages/homePage/suggested_account_card.dart';
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

class InstagramHome extends StatefulWidget {
  const InstagramHome({super.key, this.userEntity});
  final UserEntity? userEntity;

  @override
  State<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> with _HomePageMixin {
  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    context.read<OtherUserBloc>().add(const GetUsersCollectionEvent());
    context.read<PostBloc>().add(GetAllPostsByUserIdEvent(
        userId: context.read<UserBloc>().state.userEntity?.userId ?? ""));
    currentUser = widget.userEntity;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: _userBlocListener,
      builder: (context, state) {
        if (state is UserLoaded) {
          currentUser = state.userEntity;
        }
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/pictures/Group.svg',
                height: 30,
                width: 70,
              ),
            ),
            actions: [
              const CreateMenu(),
              const SizedBox(width: 8),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/pictures/Direct Messaging.svg',
                  height: 30,
                  width: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 100,
                  child: BlocBuilder<OtherUserBloc, OtherUserState>(
                    builder: (context, state) {
                      if (state is UserProgress) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is UsersLoaded) {
                        final users = state.users?.reversed;
                        final seenUserIds = <String>{};

                        final uniqueUsers = [
                          if (currentUser != null) currentUser!,
                          ...users!.where((user) {
                            final isNewUser =
                                !seenUserIds.contains(user.userId);
                            if (isNewUser) {
                              seenUserIds.add(user.userId ?? "");
                            }
                            return isNewUser && user != currentUser;
                          })
                        ].toList();

                        if (uniqueUsers.isNotEmpty) {
                          uniqueUsers.removeAt(0);
                        }

                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: uniqueUsers.length,
                          itemBuilder: (context, index) {
                            final user = uniqueUsers[index];
                            return StoryCard(
                              imageUrl: user.photoUrl,
                              userName: user.displayName?.split(' ')[0] ?? "",
                            );
                          },
                        );
                      } else {
                        return const Center(
                            child: Text('Failed to load users'));
                      }
                    },
                  ),
                ),
              ),
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PostLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.posts?.length,
                      itemBuilder: (context, index) {
                        final post = state.posts?[index];
                        String formattedDate = "";
                        if (post?.timestamp != null) {
                          DateTime dateTime =
                              DateTime.fromMillisecondsSinceEpoch(
                                  post?.timestamp!.toInt() ?? 0);
                          formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(dateTime);
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        currentUser?.photoUrl ?? '',
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      currentUser?.displayName ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                widthFactor: 12,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(248, 187, 208, 1),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  height: 300,
                                  child: Image.network(
                                    post?.postUrl ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/pictures/like.svg',
                                      height: 25,
                                      width: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/pictures/Comment.svg',
                                      height: 25,
                                      width: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/pictures/massage sent.svg',
                                      height: 25,
                                      width: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/pictures/save icon.svg',
                                      height: 25,
                                      width: 25,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: Text(
                                  "1 like",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: formattedDate,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Failed to load posts'));
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  'Suggested for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<OtherUserBloc, OtherUserState>(
                builder: (context, state) {
                  if (state is UserProgress) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UsersLoaded) {
                    final users = state.users!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: users.map((user) {
                          return SuggestedAccountCard(
                            userName: user.displayName ?? "",
                            photoUrl: user.photoUrl ?? "",
                          );
                        }).toList(),
                      ),
                    );
                  } else {
                    return const Center(child: Text('Failed to load users'));
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                  ),
                ),
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
