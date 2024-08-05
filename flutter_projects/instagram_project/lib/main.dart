import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_project/data/repositories/auth_repository_imp.dart';
import 'package:instagram_project/data/repositories/media_repository_imp.dart';
import 'package:instagram_project/data/repositories/other_user_repository_imp.dart';
import 'package:instagram_project/data/repositories/post_repository_imp.dart';
import 'package:instagram_project/data/services/auth_service/auth_service.dart';
import 'package:instagram_project/data/services/auth_service/auth_service_imp.dart';
import 'package:instagram_project/data/services/media_service/media_serivce.dart';
import 'package:instagram_project/data/services/media_service/media_service_imp.dart';
import 'package:instagram_project/data/services/other_user_service/other_user_service.dart';
import 'package:instagram_project/data/services/other_user_service/other_user_service_imp.dart';
import 'package:instagram_project/data/services/post_service/post_service.dart';
import 'package:instagram_project/data/services/post_service/post_service_imp.dart';
import 'package:instagram_project/data/services/user_service/user_service.dart';
import 'package:instagram_project/data/services/user_service/user_service_imp.dart';
import 'package:instagram_project/domin/repositories/auth_repository.dart';
import 'package:instagram_project/domin/repositories/media_repository.dart';
import 'package:instagram_project/domin/repositories/other_user_repository.dart';
import 'package:instagram_project/domin/repositories/post_repository.dart';
import 'package:instagram_project/presentation/logic/auth/auth_bloc.dart';
import 'package:instagram_project/presentation/logic/media/media_bloc.dart';
import 'package:instagram_project/presentation/logic/posts/post_bloc.dart';
import 'package:instagram_project/presentation/logic/otherUserBloc/other_user_bloc.dart';
import 'package:instagram_project/presentation/logic/user/user_bloc.dart';
import 'package:instagram_project/presentation/pages/loginPage/login_page.dart';
import 'data/repositories/user_repository_imp.dart';
import 'domin/repositories/user_repository.dart';

void _initCrashlytics() {
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError =
      (Object exception, StackTrace stackTrace) {
    FirebaseCrashlytics.instance
        .recordError(exception, stackTrace, fatal: true);
    return true;
  };
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDxS0rrF3eBn-9ZN61woFvC95I4pFF9nGU",
      appId: '1:122772938031:android:2615fad406a1effd6cd5da',
      messagingSenderId: '',
      projectId: 'instagram-project-e4a55',
      storageBucket: 'gs://instagram-project-e4a55.appspot.com',
    ),
  );
  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  _initCrashlytics();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) => AuthServiceImp(),
        ),
        RepositoryProvider<PostService>(
          create: (context) => PostServiceImp(
              FirebaseFirestore.instance, FirebaseStorage.instance),
        ),
        RepositoryProvider<OtherUserService>(
          create: (context) => OtherUserServiceImp(),
        ),
        RepositoryProvider<MediaService>(
            create: (context) => MediaServiceImp()),
        RepositoryProvider<MediaRepository>(
          create: (context) => MediaRepostoryImp(
              mediaService: RepositoryProvider.of<MediaService>(context)),
        ),
        RepositoryProvider<PostRepository>(
          create: (context) => PostRepositoryImp(
              postService: RepositoryProvider.of<PostService>(context)),
        ),
        RepositoryProvider<OtherUserRepository>(
          create: (context) => OtherUserRepositoryImp(
              otherUserService:
                  RepositoryProvider.of<OtherUserService>(context)),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImp(
              authService: RepositoryProvider.of<AuthService>(context)),
        ),
        RepositoryProvider<UserService>(
          create: (context) => UserServiceImp(
              firebaseFirestore:
                  FirebaseFirestore.instanceFor(app: firebaseApp),
              firebaseStorage: FirebaseStorage.instance),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepositoryImp(
            userService: RepositoryProvider.of<UserService>(context),
            authService: RepositoryProvider.of<AuthService>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                AuthBloc(RepositoryProvider.of<AuthRepository>(context))),
        BlocProvider(
            create: (context) => UserBloc(
                  RepositoryProvider.of<UserRepository>(context),
                )),
        BlocProvider(
            create: (context) =>
                MediaBloc(RepositoryProvider.of<MediaRepository>(context))),
        BlocProvider(
            create: (context) =>
                PostBloc(RepositoryProvider.of<PostRepository>(context))),
        BlocProvider(
            create: (context) => OtherUserBloc(
                RepositoryProvider.of<OtherUserRepository>(context))),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
