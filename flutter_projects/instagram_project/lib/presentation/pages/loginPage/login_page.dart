import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_project/domin/entities/user_entity.dart';
import 'package:instagram_project/domin/repositories/auth_repository.dart';
import 'package:instagram_project/presentation/logic/auth/auth_bloc.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';
import 'package:instagram_project/presentation/pages/homePage/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(RepositoryProvider.of<AuthRepository>(context)),
      child: Builder(builder: (ctx) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: SvgPicture.asset(
                'assets/pictures/Group.svg',
                height: 40,
                width: 80,
              ),
            ),
          ),
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    ctx.read<AuthBloc>().add(SignInWithGoogleEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 25),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Continue with Google',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, authstate) {
                    if (authstate is AuthStateFailed &&
                        authstate.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authstate.error ?? '')));
                    } else if (authstate is AuthUserLoaded &&
                        authstate.userId != null) {
                      context.read<UserBloc>().add(AddUserToDbEvent(
                          UserEntity(userId: authstate.userId)));
                    } else if (authstate is AuthUserLoaded &&
                        authstate.userId != null) {
                      BlocProvider.of<UserBloc>(context)
                          .add(ListenUserEvent(userId: authstate.userId!));
                    }
                  },
                  builder: (context, authstate) {
                    if (authstate is AuthUserLoading) {
                      return const CircularProgressIndicator();
                    } else if (authstate is AuthStateFailed) {
                      return Text('Error: ${authstate.error}');
                    }
                    return const SizedBox(height: 16);
                  },
                ),
                BlocListener<UserBloc, UserState>(
                  listener: (context, userstate) {
                    if (userstate is UserLoaded) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InstagramHome()),
                      );
                    }
                  },
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, userstate) {
                      if (userstate is UserLoading) {
                        return const Text("Loading");
                      } else if (userstate is UserFailed) {
                        return Text('Error: ${userstate.error}');
                      }
                      return const SizedBox(height: 32);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
