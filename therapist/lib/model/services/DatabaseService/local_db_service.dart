import 'package:get_storage/get_storage.dart';

class LocalDBService {
  final _box = GetStorage();
  final _keyTherapist = 'isTherapist';
  final _keyIsLogin = 'isLogedIn';
  bool isTherapistLogedIn() => _box.read(_keyTherapist) ?? false;
  // ignore: type_annotate_public_apis
  saveIsTherapist(bool isTherapist) => _box.write(_keyTherapist, isTherapist);

  bool isLoggedIn() => _box.read(_keyIsLogin) ?? false;
  // ignore: type_annotate_public_apis
  saveIsLoggedIn(bool isLogedIn) => _box.write(_keyIsLogin, isLogedIn);
}
