import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/crypto/crypto_bloc.dart';
import 'package:state_management_bloc/models/crypto_model.dart';

//************************************************************
// HomeScreen class
// Author: Miguel Fagundez
// Date: May, 27 2022
// This screen will show some crypto data
// This way we can handle some basic management state if we
// have just few screen and few variables in the app state
//************************************************************
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 3.0,
        backgroundColor: Colors.indigo,
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (BuildContext context, state) {
          //***********************************************************
          // Now we can use our bloc to evaluate the app state
          //***********************************************************
          return state.hasPushed
              ? ShowCryptoInState(
                  crypto: state.crypto,
                )
              : const Center(
                  child: Text('No crypto found.'),
                );
        },
      ),
      //const ShowCryptoInState(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan),
          onPressed: () {
            Navigator.pushNamed(context, 'random_crypto');
          }),
    );
  }
}

class ShowCryptoInState extends StatelessWidget {
  final CryptoModel? crypto;

  const ShowCryptoInState({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Crypto Name: ${crypto?.cryptoName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Crypto Slug: ${crypto?.cryptoSlug}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            title: Text(
              'Crypto Logo: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 15),
              height: 50,
              width: 50,
              child: Image.asset(
                  crypto?.cryptoImage ?? 'assets/question-mark.png'))
        ],
      ),
    );
  }
}
