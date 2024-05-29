import 'package:flutter/material.dart';

// import '../views/register.dart';
import '../views/login.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            child: Drawer(
                child: Container(
      color: const Color.fromARGB(255, 146, 166, 183),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                "AIRWAY ACADEMIA",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
          //Les meves dades
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text(
              'Ranking',
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Login()));
            },
          )
        ],
      ),
    ))));
  }
}
