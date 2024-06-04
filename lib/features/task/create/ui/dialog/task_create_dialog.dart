import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../entities/user/user.dart';

class CreateTaskDialog extends ConsumerStatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  ConsumerState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends ConsumerState<CreateTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);
      await ref.read(usersProvider.notifier).create(
            _emailController.text.trim(),
            _nameController.text.trim(),
          );
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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
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
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите e-mail';
                  if (!value.contains('@')) return 'Введите корректный e-mail';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите e-mail';
                  if (!value.contains('@')) return 'Введите корректный e-mail';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Описание'),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Select an item',
                  border: const OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: 'Барабанщиков Кирилл Дмитриевич',
                    onChanged: (newValue) {},
                    items: ['Барабанщиков Кирилл Дмитриевич', '2', '3', '4'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Тип',
                  border: const OutlineInputBorder(),
                  suffixIcon: DropdownButtonFormField(
                    value: 'СРОЧНО',
                    onChanged: (newValue) {},
                    items: ['СРОЧНО', 'ПОЗЖЕ', 'НЕВАЖНО', '4'].map<DropdownMenuItem<String>>((String value) {
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
