import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/user.model.dart';

class Parent {
  final String fullname;
  final String email;
  final String image;
  final String address;
  final String job;
  final String phoneTel;
  final int childrenCount;
  final User user;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Parent({
    this.image,
    this.user,
    this.objectId,
    this.createdAt,
    this.updateAt,
    this.fullname,
    this.email,
    this.address,
    this.job,
    this.phoneTel,
    this.childrenCount,
  });
  Parent.fromParse(ParseObject object)
      : fullname = object.get('fullname'),
        phoneTel = object.get('phoneTel'),
        email = object.get('email'),
        image = object.get("image"),
        address = object.get('address'),
        job = object.get("job"),
        childrenCount = object.get('childrenCount'),
        user = object.get('user') != null
            ? User.fromParse(object.get('user'))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
