import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../shared/constants.dart';
import '../../shared/widgets/custom_alert_dialog.dart';
import '../../shared/widgets/custom_align.dart';
import '../../shared/widgets/custom_text_form_field.dart';
import 'todo_store.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TodoStore _todoStore = TodoStore();

  final FocusNode _focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _todoStore.loadList();
  }

  @override
  void dispose() {
    _todoStore.todoTextController.dispose();
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
                        itemCount: _todoStore.tasks.length,
                        itemBuilder: (_, index) => ListTile(
                          title: Center(
                            child: Text(
                              _todoStore.tasks[index],
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
                                onPressed: () async {
                                  String originalValue =
                                      _todoStore.tasks[index];
                                  String newValue = '';
                                  final resp = await CustomAlertDialog.instance
                                      .asyncConfirmDialog(
                                    context: context,
                                    title: 'Edição',
                                    textConfirm: 'Salvar',
                                    textCancel: 'Cancelar',
                                    content: TextFormField(
                                      initialValue: originalValue,
                                      onChanged: (value) {
                                        newValue = value;
                                      },
                                    ),
                                  );
                                  if (resp != null && resp['resp'] == true) {
                                    _todoStore.putTask(newValue, index);
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Color.fromARGB(255, 204, 50, 52),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  final resp = await CustomAlertDialog.instance
                                      .asyncConfirmDialog(
                                    context: context,
                                    title: 'Confirmação',
                                    textConfirm: 'Excluir',
                                    textCancel: 'Cancelar',
                                    content: const Text(
                                        'Você tem certeza que deseja excluir este item?'),
                                  );
                                  if (resp != null && resp['resp'] == true) {
                                    _todoStore
                                        .removeTask(_todoStore.tasks[index]);
                                  }
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
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: CustomTextFormField(
                        controller: _todoStore.todoTextController,
                        focusNode: _focusNode,
                        autofocus: true,
                        hintText: 'Digite seu texto',
                        textAlign: TextAlign.center,
                        hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        onFieldSubmitted: (value) {
                          _focusNode.requestFocus();
                          if (_formKey.currentState!.validate()) {
                            _todoStore.addTask(value);
                          }
                        },
                        validator: (value) {
                          if ((value == null || value.isEmpty)) {
                            return 'Por Favor, preencha o campo';
                          }
                          return null;
                        },
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
}
