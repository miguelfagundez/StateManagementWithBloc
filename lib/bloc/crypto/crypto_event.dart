//************************************************************
// Crypto Event
// Author: Miguel Fagundez
// Date: May, 28 2022
// This file will have all actions that my crypto_block will receive
// to change its state throughout crypto_state
//************************************************************
//*****************************
// In general:
// bloc -> business component
// event -> actions
// state -> app state
//*****************************/

part of 'crypto_bloc.dart';

@immutable
abstract class CryptoEvent {}

class SelectCryptoEvent extends CryptoEvent {
  final CryptoModel crypto;
  final int randomNum;

  SelectCryptoEvent(this.crypto, this.randomNum);
}
