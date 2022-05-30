//************************************************************
// Crypto Bloc
// Author: Miguel Fagundez
// Date: May, 28 2022
// This file will have the business logic, know my current
// crypto state and assign the events
//************************************************************
//*****************************
// In general:
// bloc -> business component
// event -> actions
// state -> app state
//*****************************/

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:state_management_bloc/models/crypto_model.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitialState()) {
    // Here I will change my state due to my crypto has changed
    on<SelectCryptoEvent>((event, emit) {
      print('SelectCryptoEvent called..');
      emit(CryptoHasChanged(event.crypto, event.randomNum));
    });
  }
}
