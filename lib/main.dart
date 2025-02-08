import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_graduation/api/authinticationcubit.dart';
import 'package:flutter_application_graduation/assets/login/forgetpassword.dart';
import 'package:flutter_application_graduation/assets/login/logindesign.dart';
import 'package:flutter_application_graduation/assets/login/reset.dart';
import 'package:flutter_application_graduation/home/home.dart';
import 'package:flutter_application_graduation/register/registerdesign.dart';
import 'package:flutter_application_graduation/screens/add.dart';
import 'package:flutter_application_graduation/screens/cart.dart';
import 'package:flutter_application_graduation/screens/contract.dart';
import 'package:flutter_application_graduation/screens/detailsfirstbageforcustomer.dart';
import 'package:flutter_application_graduation/screens/detailspageforownerandinvestor.dart';
import 'package:flutter_application_graduation/screens/detailsscreen.dart';
import 'package:flutter_application_graduation/screens/detailsscreencard.dart';
import 'package:flutter_application_graduation/screens/favourit.dart';
import 'package:flutter_application_graduation/screens/hometabscreen.dart';
import 'package:flutter_application_graduation/screens/ownerdetails.dart';
import 'package:flutter_application_graduation/screens/privacyandsceurityforbussinessowner.dart';
import 'package:flutter_application_graduation/screens/privacyandsecurityforcustomer.dart';
import 'package:flutter_application_graduation/screens/profile.dart';
import 'package:flutter_application_graduation/screens/profilebussinessowner.dart';
import 'package:flutter_application_graduation/screens/profileinvestor.dart';
import 'package:flutter_application_graduation/screens/search.dart';
import 'package:flutter_application_graduation/screens/searchinvestor.dart';
import 'package:flutter_application_graduation/screens/shopnecles.dart';
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
          privacyandsecurityforownerandinvestor.routname: (context) =>
              privacyandsecurityforownerandinvestor(),
          privacyandsecurityforcustomer.routname: (context) =>
              privacyandsecurityforcustomer(),
          profilebussinessowner.routeName: (context) => profilebussinessowner(
              firstnameController: '',
              lastnameController: '',
              emailController: '',
              passwordController: '',
              cityController: '',
              phoneNumber: '',
              role: ''),
          Detailspageforownerandinvestor.routname: (context) =>
              Detailspageforownerandinvestor(),
          profileinvestordessign.routeName: (context) => profileinvestordessign(
                firstnameController: '',
                emailController: '',
                lastnameController: '',
                passwordController: '',
                cityController: '',
                phoneNumber: '',
                role: '',
              ),
          searchinvestor.routname: (context) => searchinvestor(),
          add.routname: (context) => add(),
          contract.routname: (context) => contract(),
          detailsfirstscreencustomer.routname: (context) =>
              detailsfirstscreencustomer(),
          ownerdetails.routname: (context) => ownerdetails(),
          shopnecles.routname: (context) => shopnecles(),
          AllProductsGridcards.routname: (context) => AllProductsGridcards(),
          AllProductsGrid.routname: (context) => AllProductsGrid(),
          Logindesign.routname: (context) => Logindesign(),
          RegisterDesign.routeName: (context) => RegisterDesign(),
          ForgetPassword.routname: (context) => ForgetPassword(),
          resetpassword.routname: (context) => resetpassword(),
          homescreen.routname: (context) => homescreen(),
          cart.routname: (context) => cart(),
          favourit.routname: (context) => favourit(),
          search.routname: (context) => search(),
          profile.routeName: (context) => profile(),
          hometabscreen.routname: (context) => hometabscreen()
        },
      ),
    );
  }
}
