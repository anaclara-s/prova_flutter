import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../controller.dart';
import '../custom/custom_align.dart';
import '../custom/custom_text_form_field.dart';

class InformationCaptureScreen extends StatefulWidget {
  const InformationCaptureScreen({super.key});

  @override
  State<InformationCaptureScreen> createState() =>
      _InformationCaptureScreenState();
}

class _InformationCaptureScreenState extends State<InformationCaptureScreen> {
  final List<String> tasks = [];
  final TaskController taskController = TaskController();
  final TextEditingController _controller = TextEditingController();

  bool _submitted = false;
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  void saveList(List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('my_list', list);
  }

  Future<List<String>> loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('my_list') ?? [];
    return list;
  }

  @override
  void initState() {
    super.initState();
    loadList()
        .then((list) => taskController.tasks = ObservableList<String>.of(list));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kDarkBackgroudColor,
                  kLightBackgroudColor,
                ],
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Observer(
                    builder: (_) => Container(
                      height: 450,
                      width: 350,
                      color: Colors.white,
                      child: ListView.separated(
                        itemCount: taskController.tasks.length,
                        itemBuilder: (_, index) => ListTile(
                          title: Center(
                            child: Text(
                              taskController.tasks[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  String originalValue =
                                      taskController.tasks[index];
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Edição'),
                                        content: TextField(
                                          controller: TextEditingController(
                                              text:
                                                  taskController.tasks[index]),
                                          onChanged: (value) {
                                            taskController.tasks[index] = value;
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text('Cancelar'),
                                            onPressed: () {
                                              taskController.tasks[index] =
                                                  originalValue;
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Salvar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Color.fromARGB(255, 204, 50, 52),
                                  size: 30,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirmação'),
                                        content: const Text(
                                            'Você tem certeza que deseja excluir este item?'),
                                        actions: [
                                          TextButton(
                                            child: const Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Excluir'),
                                            onPressed: () {
                                              setState(() {
                                                taskController.tasks
                                                    .removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (_, index) => const Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Divider(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 150),
                  child: SizedBox(
                    width: 350,
                    child: Observer(
                      builder: (_) => Form(
                        key: _formKey,
                        autovalidateMode: _autoValidateMode,
                        child: CustomTextFormField(
                          controller: _controller,
                          focusNode: _focusNode,
                          autofocus: true,
                          label: const Center(child: Text('Digite seu texto')),
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          onFieldSubmitted: (value) {
                            _focusNode.requestFocus();
                            _autoValidateMode =
                                AutovalidateMode.onUserInteraction;
                            if (value.isEmpty) {
                              setState(() {
                                _submitted = true;
                              });
                            } else {
                              taskController.addTask(value);
                              _controller.clear();
                              setState(() {
                                tasks.add(value);
                                _submitted = false;
                              });
                            }
                            _formKey.currentState!.validate();
                          },
                          validator: (value) {
                            if (_submitted &&
                                (value == null || value.isEmpty)) {
                              return 'Por Favor, preencha o campo';
                            }
                            return null;
                          },
                          onChanged: taskController.updateTextFormFieldValue,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CustomAlign(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask(String task) async {
    List<String> list = await loadList();
    list.add(task);
    saveList(list);
  }

  void removeTask(String task) async {
    List<String> list = await loadList();
    list.remove(task);
    saveList(list);
  }
}
