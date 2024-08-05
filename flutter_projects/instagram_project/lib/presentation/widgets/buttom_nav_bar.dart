import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_project/presentation/pages/homePage/home_page.dart';
import 'package:instagram_project/presentation/pages/profilePage/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const InstagramHome(),
              ),
            );
          },
          icon: SvgPicture.asset(
            'assets/pictures/Vector(1).svg',
            height: 20,
            width: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/pictures/Group 9.svg',
            height: 20,
            width: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/pictures/Group 15.svg',
            height: 20,
            width: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/pictures/like.svg',
            height: 20,
            width: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          icon: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(imageUrl ?? ""),
          ),
        ),
      ],
    );
  }
}
