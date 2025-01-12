import 'package:apexo/core/model.dart';
import 'package:apexo/services/archived.dart';
import 'package:apexo/services/launch.dart';
import 'package:apexo/utils/encode.dart';
import 'package:apexo/services/localization/locale.dart';
import 'package:apexo/services/login.dart';
import 'package:apexo/features/appointments/appointment_model.dart';
import 'package:apexo/features/appointments/appointments_store.dart';

class Patient extends Model {
  List<Appointment> get allAppointments {
    return (appointments.byPatient[id]?["all"] ?? [])
        .where((appointment) => appointment.archived != true || showArchived())
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  List<Appointment> get doneAppointments {
    return (appointments.byPatient[id]?["done"] ?? [])
        .where((appointment) => appointment.archived != true || showArchived())
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  List<Appointment> get upcomingAppointments {
    return (appointments.byPatient[id]?["upcoming"] ?? [])
        .where((appointment) => appointment.archived != true || showArchived())
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  List<Appointment> get pastAppointments {
    return (appointments.byPatient[id]?["past"] ?? [])
        .where((appointment) => appointment.archived != true || showArchived())
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  int get age {
    return DateTime.now().year - birth;
  }

  double get paymentsMade {
    return doneAppointments.fold(0.0, (value, element) => value + element.paid);
  }

  double get pricesGiven {
    return doneAppointments.fold(0.0, (value, element) => value + element.price);
  }

  bool get overPaid {
    return paymentsMade > pricesGiven;
  }

  bool get fullPaid {
    return paymentsMade == pricesGiven;
  }

  bool get underPaid {
    return paymentsMade < pricesGiven;
  }

  double get outstandingPayments {
    return pricesGiven - paymentsMade;
  }

  int? get daysSinceLastAppointment {
    if (doneAppointments.isEmpty) return null;
    return DateTime.now().difference(doneAppointments.last.date).inDays;
  }

  @override
  get avatar {
    if (launch.isDemo) return "https://person.alisaleem.workers.dev/";
    final appointmentsWithImages = allAppointments.where((a) => a.imgs.isNotEmpty);
    if (appointmentsWithImages.isEmpty) return null;
    return appointmentsWithImages.first.imgs.first;
  }

  @override
  get imageRowId {
    final appointmentsWithImages = allAppointments.where((a) => a.imgs.isNotEmpty);
    if (appointmentsWithImages.isEmpty) return null;
    return appointmentsWithImages.first.id;
  }

  get webPageLink {
    return "https://patient.apexo.app/${encode("$id|$title|${login.url}")}";
  }

  @override
  Map<String, String> get labels {
    Map<String, String> buildingLabels = {
      "Age": (DateTime.now().year - birth).toString(),
    };

    if (daysSinceLastAppointment == null) {
      buildingLabels["Last visit"] = txt("noVisits");
    } else {
      buildingLabels["Last visit"] = "$daysSinceLastAppointment ${txt("daysAgo")}";
    }

    if (gender == 0) {
      buildingLabels["Gender"] = "♀";
    } else {
      buildingLabels["Gender"] = "♂️";
    }

    if (outstandingPayments > 0) {
      buildingLabels["Pay"] = "${txt("underpaid")}🔻";
    }

    if (outstandingPayments < 0) {
      buildingLabels["Pay"] = "${txt("overpaid")}🔺";
    }

    if (paymentsMade != 0) {
      buildingLabels["Total payments"] = "$paymentsMade";
    }

    for (var i = 0; i < tags.length; i++) {
      buildingLabels[List.generate(i + 1, (_) => "\u200B").join("")] = tags[i];
    }
    return buildingLabels;
  }

  // id: id of the patient (inherited from Model)
  // title: name of the patient (inherited from Model)
  /* 1 */ int birth = DateTime.now().year - 18;
  /* 2 */ int gender = 0; // 0 for female, 1 for male
  /* 3 */ String phone = "";
  /* 4 */ String email = "";
  /* 5 */ String address = "";
  /* 6 */ List<String> tags = [];
  /* 7 */ String notes = "";
  /* 8 */ Map<String, String> teeth = {};

  @override
  Patient.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    /* 1 */ birth = json['birth'] ?? birth;
    /* 2 */ gender = json['gender'] ?? gender;
    /* 3 */ phone = json['phone'] ?? phone;
    /* 4 */ email = json['email'] ?? email;
    /* 5 */ address = json['address'] ?? address;
    /* 6 */ tags = List<String>.from(json['tags'] ?? tags);
    /* 7 */ notes = json['notes'] ?? notes;
    /* 8 */ teeth = Map<String, String>.from(json['teeth'] ?? teeth);
  }
  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    final d = Patient.fromJson({});

    /* 1 */ if (birth != d.birth) json['birth'] = birth;
    /* 2 */ if (gender != d.gender) json['gender'] = gender;
    /* 3 */ if (phone != d.phone) json['phone'] = phone;
    /* 4 */ if (email != d.email) json['email'] = email;
    /* 5 */ if (address != d.address) json['address'] = address;
    /* 6 */ if (tags.toString() != d.tags.toString()) json['tags'] = tags;
    /* 7 */ if (notes != d.notes) json['notes'] = notes;
    /* 8 */ if (teeth.isNotEmpty) json['teeth'] = teeth;
    return json;
  }
}
