// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ClassVisitor extends SimpleElementVisitor<void> {
  var className = '';

  void setClassName(String name) => className = name;

  var finalParams = <FieldElement>{};

  void setFinalParams(Set<FieldElement> params) => finalParams = params;

  @override
  void visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement element) {
    final isFinal = element.isFinal;
    if (isFinal) {
      final newParams = {...finalParams, element};
      setFinalParams(newParams);
    }

    return super.visitFieldElement(element);
  }
}
