import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/models/storage.model.dart';

import 'acl.service.dart';
import 'storage.service.dart';

class ParentService {
  //singleton
  static final ParentService _service = ParentService._internal();
  static final String _instanceRef = "Parent";

  factory ParentService() {
    return _service;
  }

  ParentService._internal();

  Future<Parent> create(Parent args) async {
    ParseUser user = await ParseUser.currentUser();
    final ParseObject pUser = ParseObject("_User");
    pUser.objectId = user.objectId;
    // determination de l'access controle
    final _acl = await ACLService.ownerACL();

    ParseObject pParent = ParseObject(_instanceRef)
      ..set("fullname", args.fullname)
      ..set("phoneTel", args.phoneTel)
      ..set("email", args.email)
      ..set("job", args.job)
      ..set("address", args.address)
      ..set("childrenCount", args.childrenCount)
      ..set("enable", args.enable)
      ..set("user", pUser);

    pParent.setACL(_acl);

    final response = await pParent.save();
    if (response != null) return Parent.fromParse(response.results.first);
    return null;
  }

  Future<Parent> getImageProfil(Parent args) async {
    ParseObject pParent = ParseObject(_instanceRef);
    pParent.objectId = args.objectId;
    Storage coverPic = await StorageService().create(filePath: args.image);
    pParent..set("image", coverPic.url);
    final response = await pParent.save();
    if (response != null) {
      return Parent.fromParse(response.results.first);
    }
    return null;
  }

  Future<bool> registerNewUser(
      {String username, String password, String email}) async {
    if (username.length != 0 && password.length != 0 && email.length != 0) {
      var user = ParseUser(username, password, email)..set("profil", "parent");
      if (user != null) {
        print("on est aussi a la fin de la création d'user 1");

        final res = await user.create(); // CREATING THE USER
        if (res != null) {
          print("on est aussi a la fin de la création d'user 2");

          var responseSignUp = await user.signUp(); // Registring the user
          if (responseSignUp != null) {
            var response = await user.login(); // login the user
            print("on est aussi a la fin de la création d'user");
            return true;
          }
        }
        return false;
      }
    }

    return false;
  }

  Future<bool> isEnabled() async {
    final user = await ParseUser.currentUser();
    if (user != null) {
      final Parent parent = await getByUser(user);
      if (parent != null) {
        if (parent.enable == true) return true;
      }
      return false;
    }
    return false;
  }

  Future<Parent> getByUser(ParseUser user) async {
    final pParent = ParseObject(_instanceRef);
    final QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(pParent);

    ParseUser pUser = await ParseUser.currentUser();

    query.whereEqualTo("user", pUser);
    query.includeObject(["user"]);

    final response = await query.query();

    if (response != null) return Parent.fromParse(response.results.first);
    return null;
  }
}
