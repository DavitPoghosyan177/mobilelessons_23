//import 'package:first/button_widget.dart';
//import 'package:first/pages/edit.dart';
import 'package:flutter/material.dart';
import 'package:first/button_logout.dart';
import 'package:first/button_aboutme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:first/db/preferences_service.dart';
import 'package:first/state/user_state.dart';


class Profile extends StatefulWidget {
  const Profile({super.key,this.preferenceService,});
  final PreferenceService? preferenceService;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? password;

  @override
  void initState() {
    super.initState();
    password = widget.preferenceService?.getPassword();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                //logic
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              ),

        ),
        body: Column( 
        children: [
          Expanded(
            flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('assets/pnges/pexels-photo-1516680.png'),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      UserState.of(context)?.username ?? '',            
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New York',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          '  ●  ',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          'ID: ABC123',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                        onTap: _editPage,
                        child: const Text('Edit',

                        style: TextStyle(
                            color: Color.fromRGBO(255, 177, 157, 1),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromRGBO(255, 177, 157, 1),
                            fontWeight: FontWeight.bold)),
                  ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidgetProfileAb(),
                        SizedBox(width: 20,),
                        ButtonWidgetProfile()
                      ],
                    ),
                      const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
  
          ),
            Expanded( 
            flex: 2, 
            child: Container(
              color: const Color(0xFF525464),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
              Container(
              color: const Color(0xFF525464),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 17.9,
                          child: SvgPicture.asset('assets/images/phone.svg'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 42,
                          width: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone number",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            Text(UserState.of(context)?.phone ?? '',
                                style:const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20),
                       SizedBox(
                         width: 17.9,
                         child: SvgPicture.asset('assets/images/email.svg'),
                       ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 42,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            Text(UserState.of(context)?.email ?? '',
                                style:const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 16),                   
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 17.9,
                          child: SvgPicture.asset('assets/images/oval.svg'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 42,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Completed projects",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            const Text("248",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  ),
                
                  
                ],
              ),
            ), 
            ]
                    ),
        ),
              ),
              ]
    )       
    );
               
    
    
                
  }
  void _editPage() {
    Navigator.of(context).pushNamed('/edit-page');
     //Navigator.of(context).pushReplacement(
     //  MaterialPageRoute(
     //    builder: (context) => Edit(
     //      username: widget.username,
     //      phoneNumber: widget.phoneNumber,
     //      email: widget.email,
     //      password: widget.password,
     //    ),
     //  ),
     //);
  }
}




