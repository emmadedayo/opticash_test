import 'package:flutter/cupertino.dart';
import 'package:opticash/models/transaction.dart';
import 'package:opticash/models/user.dart';

class AppState {
  UserModel? user;
  bool? userLogin;
  bool hideBalance;
  List<Transaction> transactions;
  PageController? pageController;
  AnimationController? animationController;
  int index;
  BuildContext? context;
  AppState({
    this.user,
    this.userLogin,
    this.transactions = const [],
    this.hideBalance = true,
    this.index = 0,
    this.animationController,
    this.pageController,
    this.context,
  });

  AppState copy() {
    AppState copy = AppState(
      user: user,
      userLogin: userLogin,
      transactions: transactions,
      index: index,
      context: context,
      hideBalance: hideBalance,
      animationController: animationController,
      pageController: pageController,
    );
    return copy;
  }
}
