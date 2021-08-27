import 'package:test_app/database/dao/data_access_object.dart';
import 'package:test_app/database/database.dart';

class Repository {
  bool connected = false;
  late DataStore store;

  initStore() async {
    if (store == null) {
      store = DataStore();
      await store.connect();
    }
  }

  addNoneExisting(DataAccessObject dao, List<dynamic> list) async {
    await dao.insertAll(list);
  }

  removeNoneExisting(DataAccessObject dao, List<dynamic> items) async {
    await dao.removeNoneExisting(items);
  }
}
