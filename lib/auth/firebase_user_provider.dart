import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EasyTenantFirebaseUser {
  EasyTenantFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

EasyTenantFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EasyTenantFirebaseUser> easyTenantFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EasyTenantFirebaseUser>(
            (user) => currentUser = EasyTenantFirebaseUser(user));
