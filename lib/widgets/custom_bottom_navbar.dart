import 'package:flutter/material.dart';
import 'package:test_dataon/view/home_screen.dart';
import 'package:test_dataon/view/profile_screen.dart';
import 'package:test_dataon/view/university_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 36),
            child: IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: ((context, animation, scdAnimation) =>
                            const HomeScreen()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 36),
            child: IconButton(
              icon: const Icon(
                Icons.school,
                color: Colors.white,
              ),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: ((context, animation, scdAnimation) =>
                            const UniversityScreen()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 36),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: ((context, animation, scdAnimation) =>
                            const ProfileScreen()),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero));
              },
            ),
          ),
        ],
      ),
    );
  }
}
