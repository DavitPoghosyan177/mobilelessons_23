import 'package:flutter/material.dart';
import 'package:first/db/preferences_service.dart';

class UserStateWidget extends StatefulWidget {
  const UserStateWidget({
    required this.child,
    required this.preferenceService,
    super.key,
  });

  final Widget child;
  final PreferenceService preferenceService;

  @override
  State<UserStateWidget> createState() => _UserStateWidgetState();
}

class _UserStateWidgetState extends State<UserStateWidget> {
  String username = '';
  String email = '';
  String phone = '';


  void getPhone() => setState(() {
        phone = widget.preferenceService.getPhone() ?? '';
      });

  Future<void> setPhone(String phone) async {
    await widget.preferenceService.setPhone(phone);
    setState(() {
      this.phone = phone;
    });
  }


  void getEmail() => setState(() {
        email = widget.preferenceService.getEmail() ?? '';
      });

  Future<void> setEmail(String email) async {
    await widget.preferenceService.setEmail(email);
    setState(() {
      this.email = email;
    });
  }

  void getUsername() => setState(() {
        username = widget.preferenceService.getUsername() ?? '';
      });

  Future<void> setUsername(String username) async {
    await widget.preferenceService.setUsername(username);
    setState(() {
      this.username = username;
    });
  }

  String getPassword() => widget.preferenceService.getPassword() ?? '';

  @override
  Widget build(BuildContext context) {
    return UserState(
      getEmail: getEmail,
      getPassword: getPassword,
      getUsername: getUsername,
      username: username,
      setUsername: setUsername,
      setEmail: setEmail,
      email: email,
      getPhone: getPhone,
      setPhone: setPhone,
      phone: phone,
      child: widget.child,
    );
  }
}

class UserState extends InheritedWidget {
  const UserState(
      {required super.child,
      required this.getEmail,
      required this.setEmail,
      required this.email,
      required this.getUsername,
      required this.getPassword,
      required this.username,
      required this.setUsername,
      required this.getPhone,
      required this.setPhone,
      required this.phone,
      super.key});

  final void Function() getUsername;
  final void Function() getPhone;
  final Future<void> Function(String) setUsername;
  final Future<void> Function(String) setPhone;
  final String Function() getPassword;
  final Future<void> Function(String) setEmail;
  final void Function() getEmail;
  final String username;
  final String email;
  final String phone;
  

  static UserState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserState>();

  @override
  bool updateShouldNotify(covariant UserState oldWidget) {
    return username != oldWidget.username || 
    email != oldWidget.email || phone != oldWidget.phone;
  }
}