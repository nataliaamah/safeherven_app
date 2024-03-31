import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:safeherven_app/screens/chat.dart';
import 'package:safeherven_app/screens/help.dart';
import 'package:safeherven_app/screens/places.dart';
import 'package:safeherven_app/screens/home.dart';


class MenuBottom extends StatefulWidget {
  const MenuBottom({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        switch (index) {
          case 0:
            _onItemTapped(0);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SignInScreen(providerConfigs: [
                        EmailProviderConfiguration(),
                      ],);
                    }
                    return HomeScreen(user: snapshot.data!);
                  }
                ),
              ),
            );
            break;
          case 1:
            _onItemTapped(1);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlacesScreen()),
            );
            break;
          case 2:
            _onItemTapped(2);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpScreen()),
            );
            break;
          case 3:
            _onItemTapped(3);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatScreen()),
            );
            break;
        }
      },
      items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.purple : Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: _selectedIndex == 1 ? Colors.purple : Colors.grey,),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety, color: _selectedIndex == 2 ? Colors.purple : Colors.grey,),
            label: 'Get Help',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: _selectedIndex == 3 ? Colors.purple : Colors.grey,),
          label: 'Chat',
        ),
        ],
      // currentIndex: _selectedIndex,
      // selectedItemColor: Colors.purple[500],
    );
  }
}