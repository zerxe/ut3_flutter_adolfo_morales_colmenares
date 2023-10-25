import 'character.dart';

class User {
  String username;
  String password;
  List<Character> characters;

  User({
    required this.username,
    required this.password,
    this.characters = const [],
  });

  void addCharacter(Character character) {
    characters.add(character);
  }

  void removeCharacter(Character character) {
    characters.remove(character);
  }
}
