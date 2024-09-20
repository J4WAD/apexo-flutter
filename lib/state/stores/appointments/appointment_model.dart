import 'package:apexo/state/stores/patients/patient_model.dart';
import 'package:apexo/state/stores/patients/patients_store.dart';
import 'package:apexo/state/stores/staff/member_model.dart';
import 'package:apexo/state/stores/staff/staff_store.dart';

import '../../../pages/widgets/week_calendar.dart';

class Appointment extends AgendaItem {
  @override
  String get title {
    if (patient == null) {
      return "  ";
    } else {
      return patient!.title;
    }
  }

  Patient? get patient {
    return patients.get(patientID ?? "return null when null");
  }

  List<Member> get operators {
    // ignore: unnecessary_null_comparison
    return operatorsIDs.map((id) => staff.get(id)!).where((a) => a != null).toList();
  }

  Set<int> get availableWeekDays {
    return operators.expand((element) => element.dutyDays).toSet().map((day) => allDays.indexOf(day) + 1).toSet();
  }

  @override
  String get subtitleLine1 {
    return "${isDone() ? "✔️ " : ""}${isDone() && postOpNotes.isNotEmpty ? postOpNotes : preOpNotes}";
  }

  @override
  String get subtitleLine2 {
    if (operatorsIDs.isEmpty) return "";
    return "👨‍⚕️ ${operatorsIDs.map((id) => staff.get(id)?.title).join(", ")}";
  }

  bool get fullPaid {
    return paid == price;
  }

  bool get overPaid {
    return paid > price;
  }

  bool get underPaid {
    return paid < price;
  }

  // id: id of the member (inherited from Model)
  // date: date (& time) of the member (inherited from AgendaItem)
  /* 1 */ List<String> operatorsIDs = [];
  /* 2 */ String? patientID;
  /* 4 */ String preOpNotes = "";
  /* 5 */ String postOpNotes = "";
  /* 6 */ List<String> prescriptions = [];
  /* 7 */ double price = 0;
  /* 8 */ double paid = 0;

  Appointment.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    /* 1 */ operatorsIDs = List<String>.from(json["operatorsIDs"] ?? operatorsIDs);
    /* 2 */ prescriptions = List<String>.from(json["prescriptions"] ?? prescriptions);
    /* 3 */ patientID = json["patientID"] ?? patientID;
    /* 4 */ preOpNotes = json["preOpNotes"] ?? preOpNotes;
    /* 5 */ postOpNotes = json["postOpNotes"] ?? postOpNotes;
    /* 6 */ price = json["price"] ?? price;
    /* 7 */ paid = json["paid"] ?? paid;
  }

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    final d = Appointment.fromJson({});
    /* 1 */ if (operatorsIDs.toString() != d.operatorsIDs.toString()) json['operatorsIDs'] = operatorsIDs;
    /* 2 */ if (prescriptions.toString() != d.prescriptions.toString()) json['prescriptions'] = prescriptions;
    /* 3 */ if (patientID != d.patientID) json['patientID'] = patientID;
    /* 4 */ if (preOpNotes != d.preOpNotes) json['preOpNotes'] = preOpNotes;
    /* 5 */ if (postOpNotes != d.postOpNotes) json['postOpNotes'] = postOpNotes;
    /* 6 */ if (price != d.price) json['price'] = price;
    /* 7 */ if (paid != d.paid) json['paid'] = paid;
    return json;
  }
}
