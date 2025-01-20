import 'package:equatable/equatable.dart';
import 'package:smart_eco_mobile/ddd/entity.dart';

class UserPersonnalInfo extends Equatable {
  final EntityId uid;
  final String email;
  final String name;

  const UserPersonnalInfo({
    required this.uid,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [uid, email, name];
}
