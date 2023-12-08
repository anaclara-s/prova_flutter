import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class TaskController = _TaskController with _$TaskController;

abstract class _TaskController with Store {
  @observable
  ObservableList<String> tasks = ObservableList<String>();

  @observable
  String textFormFieldValue = '';

  @action
  void updateTextFormFieldValue(String value) {
    textFormFieldValue = value;
  }

  @action
  void addTask(String task) {
    tasks.add(task);
  }

  @action
  void removeTask(String task) {
    tasks.remove(task);
  }
}
