import 'dart:math';

import 'package:apexo/features/appointments/appointment_model.dart';
import 'package:apexo/features/doctors/doctor_model.dart';
import 'package:apexo/features/expenses/expense_model.dart';
import 'package:apexo/features/labwork/labwork_model.dart';
import 'package:apexo/features/patients/patient_model.dart';

const _firstNames = [
  "Mohamed",
  "Fatima",
  "Ahmed",
  "Nadia",
  "Karim",
  "Samira",
  "Rachid",
  "Amina",
  "Yacine",
  "Sabrina",
  "Abdelkader",
  "Kenza",
  "Omar",
  "Sofia",
  "Mustapha",
  "Lina",
  "Hocine",
  "Zineb",
  "Amine",
  "Naima",
  "Mehdi",
  "Dalila",
  "Said",
  "Hanane",
  "Rafik",
  "Yasmine",
  "Fouad",
  "Salima",
  "Nabil",
  "Meriem"
];

const _lastNames = [
  "Benali",
  "Benzema",
  "Chikhi",
  "Djebbar",
  "El-Hadj",
  "Fares",
  "Gacem",
  "Haddad",
  "Ibrahim",
  "Jabbar",
  "Khelifa",
  "Lamine",
  "Mokhtar",
  "Nouari",
  "Ounissi",
  "Rahmani",
  "Salah",
  "Tahar",
  "Ziani",
  "Touati"
];

const _patientTags = [
  "Diabétique",
  "Hypertendu",
  "Asthmatique",
  "Cardiaque",
  "Fumeur",
  "Allergique"
];

const _preOpNotes = [
  "Consultation dentaire de routine.",
  "Traitement de canal.",
  "Pose d'un implant dentaire.",
  "Pose d'un pont dentaire.",
  "Détartrage dentaire.",
  "Obturation dentaire.",
  "Pose d'une couronne dentaire.",
  "Extraction dentaire.",
  "Blanchiment dentaire.",
  "Pose de facette dentaire."
];

const _postOpNotes = [
  "Intervention réussie sans complications.",
  "Saignement arrêté.",
  "Aucune complication.",
  "Prescription remise.",
  "Rendez-vous de suivi programmé.",
  "Besoin d'un suivi supplémentaire.",
  "Douleur à gérer.",
  "Antibiotiques prescrits.",
  "Récupération attendue complète."
];

const Map<String, String> _labs = {
  "Laboratoire El-Djazair": "0551 23 45 67",
  "BioLab Oran": "0552 34 56 78",
  "Clinique dentaire Constantine": "0553 45 67 89",
  "Orthodent Alger": "0554 56 78 90"
};

const Map<String, String> _receiptIssuers = {
  "Matériel Dentaire Alger": "0661 12 34 56",
  "Fournitures Médicales Oran": "0662 23 45 67",
  "Clinique Ortho Constantine": "0663 34 56 78",
  "Stationnaire Médicale": "0664 45 67 89"
};

const List<String> _labworkNotes = [
  "Couronne Zircone",
  "Couronne Céramique",
  "Facette Dentaire",
  "Appareil Orthodontique",
  "Aligneur Invisible",
  "Expansion Palatine",
  "Gouttière de contention"
];

const List<String> _receiptItems = [
  "Papier",
  "Encre",
  "Cartouche toner",
  "Stérilisateur",
  "Bistouri",
  "Compresse stérile",
  "Gants chirurgicaux",
  "Alcool médical",
  "Ciment dentaire",
  "Adhésif dentaire",
  "Forets dentaires",
  "Fil dentaire"
];

const List<String> _receiptTags = [
  "Urgent",
  "Commande standard",
  "Paiement en plusieurs fois",
  "Achat en ligne",
  "Débit",
  "Crédit"
];

String _generateName() {
  final random = Random();
  final firstName = _firstNames[random.nextInt(_firstNames.length)];
  final lastName = _lastNames[random.nextInt(_lastNames.length)];
  return "$firstName $lastName";
}

String _demoEmailToName(String name) {
  return "${name.split(" ").first.toLowerCase()}@dentisapp.com";
}

String _randomAddress() {
  final random = Random();
  return "Rue ${random.nextInt(200)}, Alger";
}

List<Doctor> _savedDoctors = [];
List<Patient> _savedPatients = [];

Doctor _demoDoctor() {
  final name = _generateName();
  return Doctor.fromJson({
    "title": "Dr. $name",
    "email": _demoEmailToName(name),
  });
}

Patient _demoPatient() {
  final name = _generateName();
  return Patient.fromJson({
    "title": name,
    "gender": Random().nextInt(5).isEven ? 0 : 1,
    "phone": "+1 555-555-5555",
    "address": _randomAddress(),
    "birth": DateTime.now().year - 5 - Random().nextInt(55),
    "tags": List.generate(Random().nextInt(5).isEven ? 0 : 1,
        (_) => _patientTags[Random().nextInt(_patientTags.length)]),
  });
}

Appointment _demoAppointment() {
  final doctor = _savedDoctors[Random().nextInt(_savedDoctors.length)];
  final patient = _savedPatients[Random().nextInt(_savedPatients.length)];
  final price = Random().nextInt(1000);
  final date = DateTime.now()
      .add(Duration(hours: Random().nextInt(24 * 30)))
      .subtract(Duration(hours: Random().nextInt(24 * 200)));
  final future = date.isAfter(DateTime.now());
  return Appointment.fromJson({
    "date": date.millisecondsSinceEpoch / 60000,
    "isDone": future
        ? false
        : Random().nextInt(10) == 5
            ? false
            : true,
    "operatorsIDs": [doctor.id],
    "patientID": patient.id,
    "preOpNotes": _preOpNotes[Random().nextInt(_preOpNotes.length)],
    "postOpNotes":
        future ? "" : _postOpNotes[Random().nextInt(_postOpNotes.length)],
    "price": price,
    "paid": future
        ? null
        : Random().nextInt(20) == 15
            ? Random().nextInt(1500)
            : price,
  });
}

Labwork _demoLabwork() {
  final patient = _savedPatients[Random().nextInt(_savedPatients.length)];
  final date = DateTime.now()
      .add(Duration(hours: Random().nextInt(24 * 30)))
      .subtract(Duration(hours: Random().nextInt(24 * 200)));
  final future = date.isAfter(DateTime.now());
  final lab = _labs.keys.toList()[Random().nextInt(_labs.length)];
  return Labwork.fromJson({
    "date": (date.millisecondsSinceEpoch / (60 * 60 * 1000)).toInt(),
    "operatorsIDs": [_savedDoctors[Random().nextInt(_savedDoctors.length)].id],
    "patientID": patient.id,
    "paid": future ? null : true,
    "price": Random().nextInt(100),
    "lab": lab,
    "phoneNumber": _labs[lab],
    "note": _labworkNotes[Random().nextInt(_labworkNotes.length)],
  });
}

Expense _demoExpense() {
  final date = DateTime.now()
      .add(Duration(hours: Random().nextInt(24 * 30)))
      .subtract(Duration(hours: Random().nextInt(24 * 200)));
  final future = date.isAfter(DateTime.now());
  final price = Random().nextInt(700);
  final receiptIssuer =
      _receiptIssuers.keys.toList()[Random().nextInt(_receiptIssuers.length)];
  return Expense.fromJson({
    "date": (date.millisecondsSinceEpoch / (60 * 60 * 1000)).toInt(),
    "paid": future ? null : true,
    "amount": price,
    "issuer": receiptIssuer,
    "phoneNumber": _receiptIssuers[receiptIssuer],
    "items": List.generate(Random().nextInt(5).isEven ? 0 : Random().nextInt(5),
        (_) => _receiptItems[Random().nextInt(_receiptItems.length)]),
    "tags": List.generate(Random().nextInt(5).isEven ? 0 : Random().nextInt(2),
        (_) => _receiptTags[Random().nextInt(_receiptTags.length)]),
  });
}

List<Doctor> demoDoctors(int length) {
  _savedDoctors = List.generate(length, (_) => _demoDoctor());
  return _savedDoctors;
}

List<Patient> demoPatients(int length) {
  _savedPatients = List.generate(length, (_) => _demoPatient());
  return _savedPatients;
}

List<Appointment> demoAppointments(int length) {
  return List.generate(length, (_) => _demoAppointment());
}

List<Labwork> demoLabworks(int length) {
  return List.generate(length, (_) => _demoLabwork());
}

List<Expense> demoExpenses(int length) {
  return List.generate(length, (_) => _demoExpense());
}
