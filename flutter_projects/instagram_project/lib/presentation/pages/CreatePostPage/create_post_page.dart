import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/presentation/logic/media/media_bloc.dart';
import 'package:instagram_project/presentation/logic/posts/post_bloc.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';
import 'package:instagram_project/presentation/pages/profilePage/profile_page.dart';

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

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, this.userEntity});
  final UserEntity? userEntity;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen>
    with _HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: _userBlocListener,
      builder: (context, userstate) {
        return BlocConsumer<MediaBloc, MediaState>(
          listener: _mediaBlocListener,
          builder: (context, mediaState) {
            return BlocConsumer<PostBloc, PostState>(
              listener: _postBlocListener,
              builder: (context, postState) {
                return Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                      leading: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()),
                          );
                        },
                      ),
                      title: const Text('Create Post',
                          style: TextStyle(color: Colors.white)),
                      actions: [
                        if (mediaState is MediaLoaded &&
                            mediaState.fileImage != null)
                          IconButton(
                            icon: const Icon(Icons.check, color: Colors.blue),
                            onPressed: () {
                              context.read<PostBloc>().add(
                                    UploadProfilePostEvent(
                                      userstate.userEntity?.userId ?? '',
                                      mediaState.fileImage!.file,
                                    ),
                                  );
                            },
                          ),
                      ],
                    ),
                    body: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Choose an option'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            context.read<MediaBloc>().add(
                                                UploadPictureFromGalleryEvent());
                                          },
                                          child:
                                              const Text('Choose from Gallery'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            context.read<MediaBloc>().add(
                                                UploadPictureFromCameraEvent());
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
                              child: Container(
                                height: double.infinity,
                                alignment: Alignment.center, 
                                decoration: BoxDecoration(
                                  image: mediaState is MediaLoaded &&
                                          mediaState.fileImage != null
                                      ? DecorationImage(
                                          image: mediaState.fileImage!,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : null,
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.photo),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Description',
                              labelStyle: TextStyle(color: Colors.grey),
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            );
          },
        );
      },
    );
  }
}
