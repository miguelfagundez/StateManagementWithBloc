//************************************************************
// Crypto State
// Author: Miguel Fagundez
// Date: May, 28 2022
// This file will have the current information about my app state
//************************************************************
//*****************************
// In general:
// bloc -> business component
// event -> actions
// state -> app state
//*****************************/

part of 'crypto_bloc.dart';

@immutable
abstract class CryptoState {
  final CryptoModel? crypto;
  final int randomNumber;
  final bool hasPushed;

  const CryptoState({
    this.crypto,
    this.randomNumber = 0,
    this.hasPushed = false,
  });
}

//***********************************************************
// This is our initial app state
//***********************************************************
class CryptoInitialState extends CryptoState {
  CryptoInitialState() : super(crypto: null);
}

class CryptoHasChanged extends CryptoState {
  final CryptoModel newCrypto;
  final int randomNum;

  const CryptoHasChanged(this.newCrypto, this.randomNum)
      : super(crypto: newCrypto, hasPushed: true, randomNumber: randomNum);
}

List<CryptoModel> cryptoList = initListOfCryptos();

CryptoModel getCryptoData(int index) {
  return cryptoList[index];
}

List<CryptoModel> initListOfCryptos() {
  return [
    CryptoModel(
        cryptoName: 'Bitcoin',
        cryptoSlug: 'BTC',
        cryptoImage: 'assets/bitcoin.png'),
    CryptoModel(
        cryptoName: 'Ethereum',
        cryptoSlug: 'ETH',
        cryptoImage: 'assets/ethereum.png'),
    CryptoModel(
        cryptoName: 'Cardano',
        cryptoSlug: 'ADA',
        cryptoImage: 'assets/cardano.png'),
    CryptoModel(
        cryptoName: 'Coti', cryptoSlug: 'COTI', cryptoImage: 'assets/coti.png'),
    CryptoModel(
        cryptoName: 'Crypto.com',
        cryptoSlug: 'CRO',
        cryptoImage: 'assets/crypto-com.png'),
    CryptoModel(
        cryptoName: 'Decentraland',
        cryptoSlug: 'MANA',
        cryptoImage: 'assets/decentraland.png'),
    CryptoModel(
        cryptoName: 'Dogecoin',
        cryptoSlug: 'DOGE',
        cryptoImage: 'assets/dogecoin.png'),
    CryptoModel(
        cryptoName: 'Fantom',
        cryptoSlug: 'FTM',
        cryptoImage: 'assets/fantom.png'),
    CryptoModel(
        cryptoName: 'Shiba-Inu',
        cryptoSlug: 'SHIB',
        cryptoImage: 'assets/shiba-inu.png'),
    CryptoModel(
        cryptoName: 'Solana',
        cryptoSlug: 'SOL',
        cryptoImage: 'assets/solana.png'),
    CryptoModel(
        cryptoName: 'Tether',
        cryptoSlug: 'USDT',
        cryptoImage: 'assets/tether.png'),
  ];
}
