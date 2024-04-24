// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:tracker_flutter_annotations/tracker_flutter_annotations.dart';
import 'package:tracker_flutter_generators/src/command.dart';

import 'class_visitor.dart';

class TrackerGenerator extends GeneratorForAnnotation<Trackable> {
  Trackable _parseConfig(Element element, ConstantReader annotation) {
    final contentType = annotation.peek("contentType")?.stringValue;
    final referrer = annotation.peek("referrer")?.stringValue;

    final enumIndex = annotation.read("tenant").peek('index')?.intValue ?? 0;
    final tenant = TrackingTenant.values[enumIndex];

    return Trackable(
      contentType: contentType,
      referrer: referrer,
      tenant: tenant,
    );
  }

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ClassVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();

    final className = visitor.className, finalParams = visitor.finalParams;

    final config = _parseConfig(element, annotation);

    // CLASSNAME + PARAMS
    buffer.writeln("@optionalTypeArgs");
    buffer.writeln("mixin _\$${className}Mixin on State<$className> {");
    buffer.writeln("  final className = \"$className\";");
    buffer.writeln(
        "  final contentType = ${config.contentType != null ? "\"${config.contentType}\"" : null};");
    buffer.writeln(
        "  final referrer = ${config.referrer != null ? "\"${config.referrer}\"" : null};");
    buffer.writeln("  Map<String, dynamic> get params => {");
    for (final param in finalParams) {
      buffer.writeln("        \"${param.name}\": _tryToJson(widget.${param.name}),");
    }
    buffer.writeln("      };");
    buffer.writeln("");
    // ON ENTER
    onEnterCommand(buffer, config);

    // ON EXIT
    onExitCommand(buffer, config);

    buffer.writeln("");

    // OVERRIDE INITSTATE
    buffer.writeln("  @override");
    buffer.writeln("  void initState() {");
    buffer.writeln("    onEnter(className);");
    buffer.writeln(
        "    log(\"Load TrackablePage: \$className, params: \$params\", name: 'TRACKER_FLUTTER');");
    buffer.writeln("    super.initState();");
    buffer.writeln("  }");
    buffer.writeln("");
    // OVERRIDE DISPOSE
    buffer.writeln("  @override");
    buffer.writeln("  void dispose() {");
    buffer.writeln("    onExit(className);");
    buffer.writeln(
        "    log(\"Unload TrackablePage: \$className, params: \$params\", name: 'TRACKER_FLUTTER');");
    buffer.writeln("    super.dispose();");
    buffer.writeln("  }");
    buffer.writeln("}");

    // TRY TO JSON FUNCTION
    if (finalParams.isNotEmpty) writeTryToJson(buffer);

    return buffer.toString();
  }

  void onEnterCommand(StringBuffer buffer, Trackable config) {
    buffer.writeln("  @protected");
    buffer.writeln("  void onEnter(String className) {");
    switch (config.tenant) {
      case TrackingTenant.pinpos:
        buffer.writeln(
            "    EnterScreenViewData(to: className, from: referrer, extraData: params).analytics();");
        break;
      case TrackingTenant.other:
        // TODO: Handle with raw tracking
        break;
    }

    buffer.writeln("  }");
  }

  void onExitCommand(StringBuffer buffer, Trackable config) {
    buffer.writeln("  @protected");
    buffer.writeln("  void onExit(String className) {");
    switch (config.tenant) {
      case TrackingTenant.pinpos:
        buffer.writeln("    ExitScreenViewData(from: className, extraData: params).analytics();");
        break;
      case TrackingTenant.other:
        // TODO: Handle raw tracking
        break;
    }

    buffer.writeln("  }");
  }

  void writeTryToJson(StringBuffer buffer) {
    buffer.writeln(TrackerCommand.tryToJson);
  }
}
