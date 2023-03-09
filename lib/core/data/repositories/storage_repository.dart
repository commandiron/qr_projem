import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageRepository {
  final storage = FirebaseStorage.instance;

  Future<String> uploadImage(Uint8List image) async {
    final uuid = const Uuid().v4();
    final imageRef = storage.ref().child("$uuid.jpg");
    await imageRef.putData(image);
    return await imageRef.getDownloadURL();
  }
}