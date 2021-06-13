import 'package:lab1/src/common/constants/disease_status.dart';
import 'package:lab1/src/models/patient.dart';

class Archive {
  static List<Patient> _patients;

  static set setPatients(List<Patient> patients) => _patients = patients;

  static List<Patient> get getPatients => _patients;

  static void addPatient(Patient patient) => _patients.add(patient);

  static bool removePatient(String firstName, String lastName) {
    Patient removeObject;
    for (Patient patient in _patients) {
      if (patient.firstName == firstName && patient.lastName == lastName) {
        removeObject = patient;
        break;
      }
    }
    return removeObject != null ? _patients.remove(removeObject) : false;
  }

  static void initDemoArchive() => _patients = [
        Patient(
          firstName: 'Chris',
          lastName: 'Stapleton',
          age: 43,
          status: DiseaseStatus.FOR_RELEASE,
        ),
        Patient(
          firstName: 'James',
          lastName: 'Hetfield',
          age: 57,
          status: DiseaseStatus.FOR_RELEASE,
        ),
        Patient(
          firstName: 'Andrew',
          lastName: 'Scott',
          age: 44,
          status: DiseaseStatus.SICK,
        ),
      ]..shuffle();
}
