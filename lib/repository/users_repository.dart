import 'package:test_app/helper/shared_preferences_helper.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/repository/repository.dart';

class UsersRepository extends Repository { 
  
  Future<User?> getLoggedInUser() async {
    await initStore();
    try {
      int? id = await Prefs.getLoggedInUser();
      if(id == null){
        throw ArgumentError;
      }

      return await store.userDao.get(id);
    } catch(_){
      return null;
    }
  }
}