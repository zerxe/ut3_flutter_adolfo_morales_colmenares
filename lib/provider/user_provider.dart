import 'package:flutter/foundation.dart';
import '../model/character.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void login(String username, String password) {
    _user = User(username: username, password: password);
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }

  void addCharacter(Character character) {
    if (_user != null) {
      _user!.addCharacter(character);
      notifyListeners();
    }
  }

  void removeCharacter(Character character) {
    if (_user != null) {
      _user!.removeCharacter(character);
      notifyListeners();
    }
  }
}
