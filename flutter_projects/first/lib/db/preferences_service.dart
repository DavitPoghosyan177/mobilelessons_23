import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences preferences;
  const PreferenceService(this.preferences);

  Future<void> setUsername(String username) async {
    await preferences.setString('username', username);
  }

  String? getUsername() {
    return preferences.getString('username');
  }

  Future<void> setPassword(String password) async {
    await preferences.setString('password', password);
  }

  String? getPassword() {
    return preferences.getString('password');
  }

  Future<void> setPhone(String phoneNumber) async {
    await preferences.setString('phone_number', phoneNumber);
  }

  String? getPhone() {
    return preferences.getString('phone_number');
  }

  Future<void> setEmail(String email) async {
    await preferences.setString('email', email);
  }

  String? getEmail() {
    return preferences.getString('email');
  }

  void clearPreferences() {
    preferences.clear();
  }
}