import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_application_graduation/assets/const.dart';
import 'package:flutter_application_graduation/assets/login/forgetpassword.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';
import 'package:flutter_application_graduation/assets/login/reset.dart';
import 'package:flutter_application_graduation/assets/profile/profil.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: maincolor,
        home: AnimatedSplashScreen(
          backgroundColor: const Color.fromARGB(255, 112, 182, 182),
          splashIconSize: 450,
          splashTransition: SplashTransition.sizeTransition,
          splash: const CircleAvatar(
            radius: double.infinity,
            backgroundImage:
                AssetImage('lib/assets/photo_5904657378991784728_y.jpg'),
          ),
          nextScreen: RegisterDesign(),
        ),
        routes: {
          Logindesign.routname: (context) => Logindesign(),
          RegisterDesign.routeName: (context) => RegisterDesign(),
          forgetpassword.routname: (context) => forgetpassword(),
          resetpassword.routname: (context) => resetpassword(),
          profiledesign.routeName: (context) => profiledesign(
                firstnameController: '',
                emailController: '',
                lastnameController: '',
                passwordController: '',
                cityController: '',
                phoneNumber: '',
              ),
        },
      ),
    );
  }
}
