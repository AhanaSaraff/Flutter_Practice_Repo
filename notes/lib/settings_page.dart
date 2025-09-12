import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget{

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),

      ),
      body: Consumer<ThemeProvider>(
          builder: (ctx, provider, __){
            return SwitchListTile.adaptive(
                title: Text("Dark Mode"),
                subtitle: Text("Change theme mode here"),
                value: provider.getThemeValue(),
                onChanged: (value){
                  provider.updateTheme(value: value);
                }
            );

      },
      )

    );
  }
}