import 'dart:io';

import 'package:delivery_repository/delivery_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:send_me_deliveries/auth_state.dart';
import 'package:send_me_deliveries/bloc/add_delivery/add_delivery_bloc.dart';
import 'package:send_me_deliveries/bloc/authentication/authentication_bloc.dart';
import 'package:send_me_deliveries/bloc/sign_in/sign_in_bloc.dart';
import 'package:send_me_deliveries/bloc/update_user/update_user_bloc.dart';
import 'package:send_me_deliveries/provider/theme_provider.dart';
import 'package:send_me_deliveries/screens/registration.dart';
import 'package:send_me_deliveries/simple_bloc_observer.dart';
import 'package:send_me_deliveries/themes.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  ThemeChange themeChange = ThemeChange(lightTheme);
  await themeChange.loadTheme();
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "${dotenv.env['APIKEY']}",
      appId: "${dotenv.env['APPID']}",
      messagingSenderId: "${dotenv.env['MESSAGINGSENDERID']}",
      projectId: "sendmedelivery-90a5b",
    ));
  }
  Bloc.observer = SimpleBlocObserver();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeChange(lightTheme),
    child: ChangeNotifierProvider(
        create: (context) => AuthState(),
        child: MyApp(
          deliveryRepository: FirebaseDeliveryRepository(),
          userRepository: FirebaseUserRepository(),
        )),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final DeliveryRepository deliveryRepository;
  const MyApp(
      {super.key,
      required this.userRepository,
      required this.deliveryRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(myUserRepository: userRepository),
        ),
        RepositoryProvider(
          create: (context) => FirebaseDeliveryRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInBloc(myUserRepository: userRepository),
          ),
          BlocProvider(
            create: (context) => SignInBloc(myUserRepository: userRepository),
          ),
          BlocProvider(
            create: (context) => UpdateUserBloc(userRepository: userRepository),
          ),
          BlocProvider(
              create: (context) => AddDeliveryBloc(
                    deliveryRepository: FirebaseDeliveryRepository(),
                  )),
        ],
        child: Consumer<ThemeChange>(builder: (context, theme, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme.getTheme(),
            home: const Registration(),
          );
        }),
      ),
    );
  }
}
