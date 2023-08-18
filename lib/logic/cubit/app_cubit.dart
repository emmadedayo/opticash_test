import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:opticash/logic/hive/hive_db.dart';
import 'package:opticash/logic/state/app_state.dart';
import 'package:opticash/models/transaction.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(AppState initialState) : super(initialState) {
    initState();
    getTransactions();
  }

  initState() async {
    emit(state.copy());
    state.user = await MyHiveBox.getObject('USER_OBJECT');
    state.pageController = PageController(initialPage: 0);
    emit(state.copy());
  }

  getTransactions() async {
    state.transactions = [
      Transaction(
        name: 'Transfer to James',
        status: 'Completed',
        date: "Today, 26 june 2021",
        amount: 150.0,
      ),
      Transaction(
        name: 'Transfer to Ade',
        status: 'Pending',
        date: "Today, 26 june 2021",
        amount: 200.0,
      ),
      Transaction(
        name: 'Transfer to Funke',
        status: 'Failed',
        date: "Today, 26 june 2021",
        amount: 50.0,
      ),
    ];
  }

  void changePage(int value) {
    state.index = value;
    state.pageController!.animateToPage(
      value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    emit(state.copy());
  }

  void toggleBalance() {
    state.hideBalance = !state.hideBalance;
    emit(state.copy());
  }
}
