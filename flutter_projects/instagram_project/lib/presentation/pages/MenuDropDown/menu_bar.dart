import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDropDown extends StatefulWidget {
  const MenuDropDown({super.key});

  @override
  State<MenuDropDown> createState() => _MenuDropDownState();
}

class _MenuDropDownState extends State<MenuDropDown> {
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMenuItem(
              context,
              'Dark Mode',
              SvgPicture.asset(
                'assets/pictures/dark-theme-svgrepo-com(1).svg',
                height: 25,
                width: 25,
              ),
            ),
            _buildMenuItem(
              context,
              'Your activity',
              SvgPicture.asset(
                'assets/pictures/Activity.svg',
                height: 25,
                width: 25,
              ),
            ),
            _buildMenuItem(
              context,
              'Archive',
              SvgPicture.asset(
                'assets/pictures/Archive.svg',
                height: 25,
                width: 25,
              ),
            ),
            _buildMenuItem(
              context,
              'QR code',
              SvgPicture.asset(
                'assets/pictures/QR code.svg',
                height: 25,
                width: 25,
              ),
            ),
            _buildMenuItem(
              context,
              'Saved',
              SvgPicture.asset(
                'assets/pictures/save icon.svg',
                height: 25,
                width: 25,
              ),
            ),
            _buildMenuItem(
              context,
              'Close Friends',
              SvgPicture.asset(
                'assets/pictures/Close friends.svg',
                height: 25,
                width: 25,
              ),
            ),
            _buildMenuItem(
              context,
              'Favorites',
              SvgPicture.asset(
                'assets/pictures/Health.svg',
                height: 25,
                width: 25,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget icon) {
    return ListTile(
      leading: icon,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/pictures/More.svg',
              height: 20,
              width: 20,
            ),
            onPressed: () => _showMenu(context),
          ),
        ),
      ),
    );
  }
}
