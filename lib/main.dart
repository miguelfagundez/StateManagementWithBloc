import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/crypto/crypto_bloc.dart';

import 'package:state_management_bloc/screens/home_screen.dart';
import 'package:state_management_bloc/screens/random_screen.dart';

void main() {
  runApp(const MyApp());
}

//************************************************************
// MyApp class
// Author: Miguel Fagundez
// Date: May, 27 2022
// MyApp
//************************************************************
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //***********************************************************
    // We need to create our block in the top of the widget trees
    //***********************************************************
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          return CryptoBloc();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crypto State Managment - Singlenton',
        initialRoute: 'home_crypto',
        routes: {
          //***********************************************************
          // Now, we have access of our block in the whole app
          //***********************************************************
          'home_crypto': (_) => const HomeScreen(),
          'random_crypto': (_) => const RandomScreen()
        },
      ),
    );
  }
}
