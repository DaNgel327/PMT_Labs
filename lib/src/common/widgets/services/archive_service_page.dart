import 'package:flutter/widgets.dart';

import 'add_service.dart';
import 'remove_service.dart';

abstract class ArchiveService {
  static Widget addPatient() => AddService();

  static Widget removePatient() => RemoveService();
}
