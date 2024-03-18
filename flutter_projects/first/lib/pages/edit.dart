import 'package:first/db/preferences_service.dart';
import 'package:first/edit_page_button.dart';
import 'package:first/text_field_by_edit.dart';
import 'package:flutter/material.dart';


class Edit extends StatefulWidget {
  const Edit({this.preferenceService, super.key});
  final PreferenceService? preferenceService;
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

@override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:const Text("edit profile",),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                //logic
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              ),
          actions: <Widget> [IconButton(
              onPressed: () {
                //logic
              },
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              ),
              ),
          ]
            
    ),
    body: SingleChildScrollView(
                                key:_globalKey,
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8.0),
                  const CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('assets/pnges/unsplash_jmURdhtm7Ng.png'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {},
                          child:const Text(
                            'Change Picture',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )
                          )
                    ],
                  ),
                  const Row( 
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [Text("Username",
                     style: TextStyle(
                     color: Colors.black,
                     fontSize: 19,
                     fontWeight: FontWeight.w500)),
                   ]
                 ),
                TextFieldWidgetByEdit(
                  controller: _usernameController,
                  initialValue: widget.preferenceService?.getUsername(),
                ),
                const SizedBox(height: 8),
                const Row( 
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [Text("Email I'd",
                     style: TextStyle(
                     color: Colors.black,
                     fontSize: 19,
                     fontWeight: FontWeight.w500)),
                   ]
                 ),
                TextFieldWidgetByEdit(
                  controller: _emailController,
                  initialValue: widget.preferenceService?.getEmail(),
                ),
                const SizedBox(height: 8),
                const Row( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Phone Number",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500)),
                    ]
                  ),
                TextFieldWidgetByEdit(
                  controller: _phoneNumberController,
                    initialValue: widget.preferenceService?.getPhoneNumber(),
                ),
                const Row( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text("Password",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500)),
                    ]
                  ),
                  TextFieldWidgetByEdit(
                  controller: _passwordController,
                  initialValue: widget.preferenceService?.getPassword(),
                ),
                const SizedBox(height: 8),
                ButtonWidgetEdit( 
                 text: "Update",
                 onTap: _updatePage,
                ),
                ], 
                                )
                    ),
    );
    
  }
   void _updatePage() {
    final String? username = widget.preferenceService?.getUsername();
    final String? email = widget.preferenceService?.getEmail();
    final String? phoneNumber = widget.preferenceService?.getPhoneNumber();
    final String? password = widget.preferenceService?.getPassword();

    if (username != _usernameController.text ||
        email != _emailController.text ||
        phoneNumber != _phoneNumberController.text ||
        password != _passwordController.text) {
      widget.preferenceService?.setUsername(_usernameController.text);
      widget.preferenceService?.setEmail(_emailController.text);
      widget.preferenceService?.setPhoneNumber(_phoneNumberController.text);
      widget.preferenceService?.setPassword(_passwordController.text);
    }
    Navigator.pop(context, '/profile');
  }
}