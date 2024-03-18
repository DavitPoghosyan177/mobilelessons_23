import 'package:flutter/material.dart';
import 'package:first/button_widget.dart';
import 'package:first/text_field_widget.dart';
import 'package:first/db/preferences_service.dart';

class Signin extends StatefulWidget {
  const Signin(this.preferencesService, {super.key});
  final PreferenceService preferencesService;
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
 final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title:const Text('Sign In'),
          centerTitle: true,

        ),
      
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/pnges/Illustration.png', width: 100.0, height: 145.0),
                        ],
                    ),
                  ),
                  TextFieldWidget(
                    controller: _usernameController,
                    hintText: 'Username',
                    obscureText: false,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Invalid password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  GestureDetector(
                    onTap: () {
                     Navigator.of(context).pushNamed('/forgot-password');
                    },
                    child:const Text(
                      'Forgot your password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  ButtonWidget( 
                   _globalKey,
                    'Login',
                    onTap: _signIn,
                    315,
                    60,
                    const Color.fromRGBO(32, 195, 175, 1),
                    const Color.fromRGBO(255, 255, 255, 1),),
                  const SizedBox(height: 25),
                  const Text(
                    'or',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const social(),
                   const SizedBox(
                    height: 20,
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Dont have an accaunt? '),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/sign-up');
                          },
                          child: const Text('Sign up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 211, 111, 144),
                                  decoration: TextDecoration.underline,)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 void _signIn() {
    final String? username = widget.preferencesService.getUsername();
    final String? password = widget.preferencesService.getPassword();
     if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Username or password cannot be empty')));
      return;
    }

    if (username == _usernameController.text &&
        password == _passwordController.text) {
      Navigator.of(context).pushNamed('/profile');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
 }

}
// ignore: camel_case_types
class social extends StatefulWidget {
  const social({super.key});

  @override
  State<social> createState() => _SocialState();
}

//ignore: camel_case_types;
class _SocialState extends State<social> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              child:Image.asset('assets/images/fb.svg', width: 40.0, height: 40.0),),
          const SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child:Image.asset('assets/images/twt.svg', width: 40.0, height: 40.0),
),
          const SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Image.asset('assets/images/ln.svg', width: 40.0, height: 40.0),
),
        ],
      ),
    );
  }
}

