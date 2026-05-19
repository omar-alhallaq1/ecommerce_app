import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelpar {
  final storge = const FlutterSecureStorage(aOptions: AndroidOptions());
  Future saveToken({required String token}) async {
    await storge.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await storge.read(key: 'token') ?? '';
  }

  Future removeToken() async {
    await storge.delete(key: 'token');
  }
}
