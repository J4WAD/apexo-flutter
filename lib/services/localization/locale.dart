import "package:apexo/core/observable.dart";
import "package:apexo/services/localization/ar.dart";
import "package:apexo/services/localization/en.dart";
import "package:fluent_ui/fluent_ui.dart";
// import "test.dart";

class _Localization {
  List<En> list = [En(), Ar()];
  final selectedLocale = ObservableState(0);
  En get s => list[selectedLocale()];
  void setSelected(int index) => selectedLocale(index);
}

final locale = _Localization();

String txt(String input) {
  final term = locale.s.dictionary[input];
  if (term != null) {
    return term;
  }
  return input;
}

class Txt extends Text {
  const Txt(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: locale.selectedLocale.stream,
        builder: (context, snapshot) {
          return Text(
            data ?? "",
            key: key,
            style: style,
            locale: this.locale,
            textScaler: textScaler,
            semanticsLabel: semanticsLabel,
            textAlign: textAlign,
            textDirection: textDirection,
            softWrap: softWrap,
            overflow: overflow,
            maxLines: maxLines,
            strutStyle: strutStyle,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          );
        });
  }
}
