import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/presentation/logic/media/media_bloc.dart';
import 'package:instagram_project/presentation/logic/posts/post_bloc.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';

mixin _HomePageMixin {
  void _mediaBlocListener(BuildContext context, MediaState state) {
    if (state is MediaFailed) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.error)));
    }
  }

  void _userBlocListener(BuildContext context, state) {
    if (state is UserFailed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error ?? ''),
        ),
      );
    }
  }
   void _postBlocListener(BuildContext context, state) {
    if (state is PostLoadFaild) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
        ),
      );
    }
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, this.userEntity});
  final UserEntity? userEntity;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> with _HomePageMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: _postBlocListener,
      builder: (context, poststate) {
        return BlocConsumer<MediaBloc, MediaState>(
          listener: _mediaBlocListener,
          builder: (context, state) {
            return BlocConsumer<UserBloc, UserState>(
              listener: _userBlocListener,
              builder: (context, userState) {
                return Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: const Text('Edit Profile',
                        style: TextStyle(color: Colors.white)),
                    actions: [
                      if (state is MediaLoaded && state.fileImage != null)
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.white),
                          onPressed: () {
                            context.read<UserBloc>().add(
                                  UpdateUserDataEvent(UserEntity(
                                    userId: userState.userEntity?.userId ?? "",
                                    displayName: _usernameController.text,
                                    email: _emailController.text,
                                  )),
                                );
                            context.read<PostBloc>().add(
                                  UploadProfilePhotoEvent(
                                    userState.userEntity?.userId ?? '',
                                    state.fileImage!.file,
                                  ),
                                );
                          },
                        ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Choose an option'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          context
                                              .read<MediaBloc>()
                                              .add(UploadPictureFromGalleryEvent());
                                        },
                                        child: const Text('Choose from Gallery'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          context
                                              .read<MediaBloc>()
                                              .add(UploadPictureFromCameraEvent());
                                        },
                                        child: const Text('Take a Picture'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: 50,
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center, 
                                decoration: BoxDecoration(
                                  image: state is MediaLoaded &&
                                          state.fileImage != null
                                      ? DecorationImage(
                                          image: state.fileImage!,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : null,
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(54),
                                ),
                                child: const Icon(Icons.photo),
                              ),
                            )),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Add link',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Switch to professional account',
                              style: TextStyle(color: Colors.blue)),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Personal information settings',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
