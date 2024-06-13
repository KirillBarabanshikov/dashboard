import 'package:dashboard/entities/session/model/model.dart';
import 'package:dashboard/entities/task/task.dart';
import 'package:dashboard/entities/user/provider/provider.dart';
import 'package:dashboard/shared/services/hive_service.dart';
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
  String type = 'НЕ ВАЖНО';
  TaskUserModel? user;
  bool _isLoading = false;
  late SessionUser sessionUser;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);
      if (widget.task == null) {
        await ref.read(tasksProvider(displayName: sessionUser.role == 'Администратор' ? null : sessionUser.displayName).notifier).create(
              TaskModel(
                id: '0',
                title: _titleController.text.trim(),
                description: _descController.text.trim(),
                status: '0',
                type: type,
                user:
                    sessionUser.role == 'Администратор' ? user! : TaskUserModel(displayName: sessionUser.displayName, photoUrl: sessionUser.photoUrl),
                createdAt: DateTime.now().millisecondsSinceEpoch,
                date: '',
              ),
            );
      } else {
        await ref.read(tasksProvider(displayName: null).notifier).edit(
              TaskModel(
                id: widget.task!.id,
                title: _titleController.text.trim(),
                description: _descController.text.trim(),
                status: widget.task!.status,
                type: type,
                user:
                    sessionUser.role == 'Администратор' ? user! : TaskUserModel(displayName: sessionUser.displayName, photoUrl: sessionUser.photoUrl),
                createdAt: widget.task!.createdAt,
                date: widget.task!.date,
              ),
            );
      }
    } catch (e) {
      if (!mounted) return;
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
      user = widget.task!.user;
    }
    sessionUser = HiveService.getSessionUser();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncUsers = ref.watch(usersProvider);

    return AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      title: Text(widget.task == null ? 'Добавить задачу' : 'Изменить задачу'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 500, maxWidth: 500),
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
              sessionUser.role == 'Администратор'
                  ? asyncUsers.hasValue
                      ? DropdownButtonFormField(
                          onChanged: (value) => user = value,
                          value: user,
                          isExpanded: true,
                          items: [
                            for (final item in asyncUsers.value!)
                              DropdownMenuItem(
                                value: TaskUserModel(
                                  displayName: item.displayName,
                                  photoUrl: item.photoUrl,
                                ),
                                child: Text(
                                  item.displayName,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                          ],
                          validator: (value) {
                            if (value == null) return 'Выберите содрудника';
                            return null;
                          },
                          dropdownColor: Colors.white,
                          decoration: const InputDecoration(labelText: 'Содрудник'),
                        )
                      : DropdownButtonFormField(
                          onChanged: (value) {},
                          value: user,
                          items: const [],
                          validator: (value) {
                            if (value == null) return 'Выберите содрудника';
                            return null;
                          },
                          dropdownColor: Colors.white,
                          decoration: const InputDecoration(labelText: 'Содрудник'),
                        )
                  : const SizedBox(),
              sessionUser.role == 'Администратор' ? const SizedBox(height: 15) : const SizedBox(),
              DropdownButtonFormField(
                dropdownColor: Colors.white,
                value: type,
                items: const [
                  DropdownMenuItem(value: 'НЕ ВАЖНО', child: Text('НЕ ВАЖНО')),
                  DropdownMenuItem(value: 'ПОЗЖЕ', child: Text('ПОЗЖЕ')),
                  DropdownMenuItem(value: 'СРОЧНО', child: Text('СРОЧНО')),
                ],
                onChanged: (value) => type = value!,
                decoration: const InputDecoration(
                  labelText: 'ТИП',
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
