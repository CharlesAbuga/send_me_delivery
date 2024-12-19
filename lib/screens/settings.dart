import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:send_me_deliveries/bloc/sign_in/sign_in_bloc.dart';
import 'package:send_me_deliveries/provider/theme_provider.dart';
import 'package:send_me_deliveries/themes.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late bool light0;

  @override
  void initState() {
    super.initState();
    // Initialize light0 based on the current theme

    final theme = Provider.of<ThemeChange>(context, listen: false);
    setState(() {
      light0 = theme.getTheme() == lightTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          const Center(
            child: const Text('Welcome to the Settings Screen'),
          ),
          Consumer<ThemeChange>(builder: (context, theme, child) {
            return ListTile(
              title: Text(light0 ? 'Light Mode' : 'Dark Mode'),
              trailing: Switch(
                  thumbColor: WidgetStatePropertyAll(
                      light0 ? Colors.white : Colors.black),
                  activeColor: Colors.black,
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.white,
                  value: light0,
                  onChanged: (value) {
                    setState(() {
                      light0 = value;
                      theme.setTheme(light0 ? lightTheme : darkTheme);
                    });
                  }),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () {
                        context.read<SignInBloc>().add(SignOutRequired());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout,
                              color: Theme.of(context).colorScheme.surface),
                          Text('Sign Out',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.surface)),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
