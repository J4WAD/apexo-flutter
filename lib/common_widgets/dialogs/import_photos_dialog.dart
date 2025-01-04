import 'dart:convert';
import 'package:apexo/app/routes.dart';
import 'package:apexo/common_widgets/dialogs/close_dialog_button.dart';
import 'package:apexo/common_widgets/dialogs/dialog_styling.dart';
import 'package:apexo/core/observable.dart';
import 'package:apexo/utils/imgs.dart';
import 'package:apexo/utils/logger.dart';
import 'package:apexo/services/localization/locale.dart';
import 'package:apexo/common_widgets/tabbed_modal.dart';
import 'package:apexo/features/appointments/appointments_store.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class ImportDialog extends StatelessWidget {
  SheetState state;

  ImportDialog({super.key, required this.state});

  final importPhotosFromLinkController = TextEditingController();
  final importResult = ObservableState("");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: importResult.stream,
        builder: (context, _) {
          return ContentDialog(
            title: const SizedBox(),
            style: dialogStyling(false),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoBar(
                  title: Txt(txt("importingPhotosFromLink")),
                  content: Txt(txt("useThisForm")),
                ),
                const SizedBox(height: 10),
                if (importResult().length > 1)
                  InfoBar(
                    title: Txt(txt("error")),
                    content: Txt(importResult()),
                    severity: InfoBarSeverity.error,
                  ),
                const SizedBox(height: 10),
                InfoLabel(
                  label: txt("link"),
                  child: CupertinoTextField(controller: importPhotosFromLinkController, placeholder: txt("enterLink")),
                ),
              ],
            ),
            actions: [
              if (importResult().length == 1) const ProgressBar(),
              const CloseButtonInDialog(),
              FilledButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Icon(FluentIcons.save), const SizedBox(width: 5), Txt(txt("import"))]),
                onPressed: () async {
                  // cache the id so that if the user opens another appointment
                  // the photos would go to the correct appointment
                  final id = routes.openAppointment.id;
                  importResult(".");
                  state.rebuildSheet();
                  List<String> res;
                  try {
                    final response = await get(Uri.parse(
                        'https://imgs.apexo.app/?url=${Uri.encodeComponent(importPhotosFromLinkController.text)}'));
                    if (response.statusCode != 200) {
                      throw Exception(response.body);
                    } else {
                      importResult("");
                      res = List<String>.from(jsonDecode(response.body));
                    }
                  } catch (e) {
                    importResult(e.toString());
                    state.rebuildSheet();
                    return;
                  }
                  if (context.mounted) Navigator.pop(context);
                  state.startProgress();
                  try {
                    for (var imgLink in res) {
                      final appointment = appointments.get(id)!;
                      final imgName = await handleNewImage(rowID: id, targetPath: imgLink);
                      if (appointment.imgs.contains(imgName) == false) {
                        appointment.imgs.add(imgName);
                        appointments.set(appointment);
                      }
                    }
                  } catch (e, s) {
                    logger("Error during images importing: $e", s);
                  }
                  state.endProgress();
                },
              ),
            ],
          );
        });
  }
}
