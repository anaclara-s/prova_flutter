// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on _TaskController, Store {
  late final _$tasksAtom =
      Atom(name: '_TaskController.tasks', context: context);

  @override
  ObservableList<String> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<String> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$textFormFieldValueAtom =
      Atom(name: '_TaskController.textFormFieldValue', context: context);

  @override
  String get textFormFieldValue {
    _$textFormFieldValueAtom.reportRead();
    return super.textFormFieldValue;
  }

  @override
  set textFormFieldValue(String value) {
    _$textFormFieldValueAtom.reportWrite(value, super.textFormFieldValue, () {
      super.textFormFieldValue = value;
    });
  }

  late final _$_TaskControllerActionController =
      ActionController(name: '_TaskController', context: context);

  @override
  void updateTextFormFieldValue(String value) {
    final _$actionInfo = _$_TaskControllerActionController.startAction(
        name: '_TaskController.updateTextFormFieldValue');
    try {
      return super.updateTextFormFieldValue(value);
    } finally {
      _$_TaskControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask(String task) {
    final _$actionInfo = _$_TaskControllerActionController.startAction(
        name: '_TaskController.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TaskControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(String task) {
    final _$actionInfo = _$_TaskControllerActionController.startAction(
        name: '_TaskController.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_TaskControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
textFormFieldValue: ${textFormFieldValue}
    ''';
  }
}
