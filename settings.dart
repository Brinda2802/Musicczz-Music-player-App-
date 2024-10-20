import 'package:bt_print_service/themes/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("S E T T I N G S"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),

        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode",style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,  // Listen to changes
              onChanged: (value) {
                // Don't listen here, just trigger the action
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            )

          ],
        ),
      ),
    );
  }
}
