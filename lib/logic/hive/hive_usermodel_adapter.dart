import 'package:hive/hive.dart';
import 'package:opticash/models/user.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      firstName: reader.readString(),
      lastName: reader.readString(),
      userName: reader.readString(),
      email: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.firstName ?? '');
    writer.writeString(obj.lastName ?? '');
    writer.writeString(obj.userName ?? '');
    writer.writeString(obj.email ?? '');
  }
}
