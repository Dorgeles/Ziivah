import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/child.model.dart';
import 'package:ziivah/services/acl.service.dart';
import 'package:ziivah/services/parent.service.dart';

class ChildService {
  //singleton
  static final ChildService _service = ChildService._internal();
  static final String _instanceRef = "Child";

  factory ChildService() {
    return _service;
  }

  ChildService._internal();

  Future<Child> create(Child args, String password) async {
    // process of creating user for new child
    var newUser = ParseUser(args.fullname, password, args.email);
    final res = await newUser.create();

    if (res != null) {
      final ParseObject pChildUser = ParseObject("_User");
      pChildUser.objectId = newUser.objectId;
      ParseUser user = await ParseUser.currentUser();
      ParseObject pParent = ParseObject("Parent");
      ParentService().getByUser(user).then((value) {
        pParent.objectId = value.objectId;
      });
      // determination de l'access controle
      final _acl = await ACLService.ownerACL();

      ParseObject pChild = ParseObject(_instanceRef)
        ..set("fullname", args.fullname)
        ..set("phoneTel", args.phoneTel)
        ..set("email", args.email)
        ..set("niveau", args.grade)
        ..set("schoolName", args.schoolName)
        ..set("parent", pParent)
        ..set("user", pChildUser)
        ..set("coach", []);
      pChild.setACL(_acl);
      print('on est ici');
      final response = await pChild.save();

      if (response != null) return Child.fromParse(response.results.first);
      return null;
    }
  }
}
