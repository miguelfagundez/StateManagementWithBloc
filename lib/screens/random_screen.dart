import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_bloc/bloc/crypto/crypto_bloc.dart';

//************************************************************
// RandomScreen class
// Author: Miguel Fagundez
// Date: May, 27 2022
// This is the second screen of the app
// Every time user push the button, we need to update
// the StreamController in our crypto services
//************************************************************
class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Screen'),
        elevation: 3.0,
        backgroundColor: Colors.indigo,
      ),
      body: const RandomScreenBody(),
    );
  }
}

class RandomScreenBody extends StatelessWidget {
  const RandomScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (BuildContext context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text('Take a random crypto & Go back to HomeScreen'),
            ),
            const SizedBox(
              height: 20,
            ),
            const CryptoButton(),
            const SizedBox(
              height: 50,
            ),
            (state.hasPushed)
                ? Text('Winning Crypto: ${state.crypto?.cryptoName}')
                : const Text('Winning Crypto: '),
            (state.hasPushed)
                ? Text('Random is: ${state.randomNumber}')
                : const Text('Random is:'),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                  'If the random number does not change it is because the value was repeated. Push again!'),
            ),
            const Text('')
          ],
        );
      },
    );
  }
}

class CryptoButton extends StatelessWidget {
  const CryptoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Center(
        child: SizedBox(
      height: 80,
      child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            final num = random.nextInt(11);
            final newCrypto = getCryptoData(num);

            final bloc = BlocProvider.of<CryptoBloc>(context, listen: false);
            bloc.add(SelectCryptoEvent(newCrypto, num));
          },
          child: const Text(
            'Random number',
            style: TextStyle(color: Colors.white),
          )),
    ));
  }
}
