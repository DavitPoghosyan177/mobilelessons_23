import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_project/presentation/pages/CreatePostPage/create_post_page.dart';

class CreateMenu extends StatefulWidget {
  const CreateMenu({super.key});

  @override
  State<CreateMenu> createState() => _CreateMenuState();
}

class _CreateMenuState extends State<CreateMenu> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.grey[900],
      focusColor: Colors.black,
      iconEnabledColor: Colors.black,
      iconDisabledColor: Colors.black,
      icon: SvgPicture.asset(
        'assets/pictures/Story.svg',
        height: 20,
        width: 20,
      ),
      iconSize: 1.0,
      underline: const SizedBox(),
      onChanged: (String? newValue) {
        if (newValue == 'Post') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CreatePostScreen()),
          );
        }
      },
      items: <String>[
        'Reel',
        'Post',
        'Story',
        'Story Highlight',
        'Live',
        'Guide'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              _buildIcon(value),
              const SizedBox(width: 15),
              Text(value, style: const TextStyle(color: Colors.white)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildIcon(String value) {
    switch (value) {
      case 'Reel':
        return SvgPicture.asset(
          'assets/pictures/reel.svg',
          height: 20,
          width: 20,
        );
      case 'Post':
        return SvgPicture.asset(
          'assets/pictures/Post alt.svg',
          height: 20,
          width: 20,
        );
      case 'Story':
        return SvgPicture.asset(
          'assets/pictures/story.svg',
          height: 20,
          width: 20,
        );
      case 'Story Highlight':
        return SvgPicture.asset(
          'assets/pictures/Story Highlight.svg',
          height: 20,
          width: 20,
        );
      case 'Live':
        return SvgPicture.asset(
          'assets/pictures/live.svg',
          height: 20,
          width: 20,
        );
      case 'Guide':
        return SvgPicture.asset(
          'assets/pictures/Guide.svg',
          height: 20,
          width: 20,
        );
      default:
        return SvgPicture.asset(
          'assets/pictures/reel.svg',
          height: 20,
          width: 20,
        );
    }
  }
}
