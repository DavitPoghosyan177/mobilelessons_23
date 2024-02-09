import 'dart:convert';
import 'dart:io';

abstract class Auth {
  void login(String username, String password);
  void register(String username, String password);
}

class AuthImp implements Auth {
  String username;
  String password;
  Map<String, dynamic> users;

  AuthImp() {
    var file = File('users.json');
    if (file.existsSync()) {
      var jsonString = file.readAsStringSync();
      users = jsonDecode(jsonString);
    } else {
      users = {};
    }
  }

  @override
  void login(String username, String password) {
    if (users.containsKey(username) && users[username] == password) {
      print('Login successful');
    } else {
      print('Login failed. Invalid username or password.');
    }
  }

  @override
  void register(String username, String password) {
    if (users.containsKey(username)) {
      print('Username already exists.');
    } else {
      users[username] = password;
      saveToFile();
      print('Registration successful');
    }
  }

  void saveToFile() {
    var file = File('users.json');
    file.writeAsStringSync(jsonEncode(users));
  }
}

void main() {
  var user = AuthImp();
  user.register('use', 'pass');
  user.login('userr', 'pass');
}
