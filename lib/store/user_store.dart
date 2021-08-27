import 'package:async/async.dart';
import 'package:mobx/mobx.dart';
import 'package:test_app/models/user.dart';
import 'package:test_app/repository/users_repository.dart';
part 'user_store.g.dart';

class UserStore = _USerStore with _$UserStore;

abstract class _USerStore with Store {
  UsersRepository repository = UsersRepository();
  final AsyncMemoizer<User> _memoizer = AsyncMemoizer<User>();

  @computed
  bool get connected => repository.connected;

  @observable
  late User currentUser;
  User get user => currentUser;

  @action
  Future<User> getCurrentUser() async => _memoizer.runOnce(() async => currentUser = (await repository.getLoggedInUser())!);
}
