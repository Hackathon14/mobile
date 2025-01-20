import 'package:smart_eco_mobile/auth/domain/model/user_personnal_info.dart';
import 'package:smart_eco_mobile/ddd/entity.dart';

abstract class UserPersonnalInfoSerialization {
  static Map<String, dynamic> toJson(UserPersonnalInfo userInfo) {
    return {
      'uid': userInfo.uid.value,
      'email': userInfo.email,
      'name': userInfo.name,
    };
  }

  static UserPersonnalInfo fromMap(Map<String, dynamic> map) {
    return UserPersonnalInfo(
      uid: EntityId(map['uid'] as String),
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }
}
