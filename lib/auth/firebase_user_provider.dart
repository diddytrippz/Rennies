import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class RennieHouseFirebaseUser {
  RennieHouseFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

RennieHouseFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RennieHouseFirebaseUser> rennieHouseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RennieHouseFirebaseUser>(
      (user) {
        currentUser = RennieHouseFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
