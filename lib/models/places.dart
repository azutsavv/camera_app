import 'package:uuid/uuid.dart';

const uuid = Uuid();

class new_Places {
  new_Places({required this.title}) : id = uuid.v4();

  final String title;
  final String id;
}
