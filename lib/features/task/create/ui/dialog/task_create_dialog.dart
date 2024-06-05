import 'package:dashboard/entities/task/model.dart';
import 'package:dashboard/entities/task/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateTaskDialog extends ConsumerStatefulWidget {
  const CreateTaskDialog({super.key, this.task});

  final TaskModel? task;

  @override
  ConsumerState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends ConsumerState<CreateTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descController;
  String type = 'СРОЧНО';
  List<String> users = [];
  bool _isLoading = false;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);
      if (widget.task == null) {
        await ref.read(tasksProvider.notifier).create(
              TaskModel(
                id: '0',
                title: _titleController.text.trim(),
                description: _descController.text.trim(),
                status: '0',
                type: type,
                users: users,
                createdAt: DateTime.now().millisecondsSinceEpoch,
                date: '',
              ),
            );
      } else {
        await ref.read(tasksProvider.notifier).edit(
              TaskModel(
                id: widget.task!.id,
                title: _titleController.text.trim(),
                description: _descController.text.trim(),
                status: widget.task!.status,
                type: type,
                users: users,
                createdAt: widget.task!.createdAt,
                date: widget.task!.date,
              ),
            );
      }
    } catch (e) {
      if (!mounted) return;
      print('$e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade500,
          content: Text(
            '$e',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } finally {
      setState(() => _isLoading = false);
      if (mounted) context.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title);
    _descController = TextEditingController(text: widget.task?.description);
    if (widget.task != null) {
      type = widget.task!.type;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Добавить задачу'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 500),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите название';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _descController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите описание';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Описание'),
              ),
              const SizedBox(height: 15),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Подчинённый',
              //     border: const OutlineInputBorder(),
              //     suffixIcon: DropdownButtonFormField(
              //       value: null,
              //       onChanged: (newValue) => users.add(newValue!),
              //       items: ['Барабанщиков Кирилл Дмитриевич', '2', '3', '4'].map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Тип',
                  border: const OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: type,
                    onChanged: (newValue) => type = newValue!,
                    items: ['СРОЧНО', 'ПОЗЖЕ', 'НЕВАЖНО'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: const Text('Отменить'),
        ),
        TextButton(
          onPressed: _isLoading ? null : _onSubmit,
          child: const Text('Готово'),
        ),
      ],
    );
  }
}
