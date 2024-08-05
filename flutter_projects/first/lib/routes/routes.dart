import 'package:first/db/preferences_service.dart';
import 'package:first/pages/signin.dart';
import 'package:first/pages/signup.dart';
import 'package:first/pages/edit.dart';
import 'package:flutter/material.dart';
import 'package:first/pages/profile.dart';
import 'package:get_it/get_it.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
     '/': (BuildContext context) => const Signin(),
    '/sign-up': (BuildContext context) =>
        SignUp(GetIt.instance.get<PreferenceService>()),
    '/profile': (BuildContext context) => Profile(
          preferenceService: GetIt.instance.get<PreferenceService>(),
        ),
    '/sign-in': (BuildContext context) => const  Signin(),
    '/edit-page': (BuildContext context) =>
        Edit(preferenceService: GetIt.instance.get<PreferenceService>()),
  };
}