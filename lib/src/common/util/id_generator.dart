import 'dart:math';

import 'package:lab1/src/common/constants/constants.dart';

int generateId() => Random().nextInt(DevConstants.maxId) - DevConstants.minId;
