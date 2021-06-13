import 'package:flutter/cupertino.dart';
import 'package:lab1/src/common/constants/disease_status.dart';

class Patient {
  Patient({
    @required this.firstName,
    @required this.lastName,
    @required this.age,
    @required this.status,
  }) : assert(
          firstName != null &&
              lastName != null &&
              age != null &&
              status != null,
        );

  final String firstName;
  final String lastName;
  final int age;
  final DiseaseStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Patient &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age &&
          status == other.status;

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ age.hashCode ^ status.hashCode;

  @override
  String toString() {
    return '{Patient}:\n'
        '\t\tFirst name: $firstName\n'
        '\t\tLast name: $lastName\n'
        '\t\tage: $age\n'
        '\t\tstatus: ${status.toString().split('.').last}\n';
  }
}
