import 'dart:typed_data';

import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class DocumentRepository {
  Future<Either<RepositoryException, String>> uploadImage(
      Uint8List file, String fileName);
}
