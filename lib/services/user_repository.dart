import 'package:p1210_5/model/user.dart';
import 'package:p1210_5/services/user_api_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
