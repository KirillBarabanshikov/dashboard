import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../entities/user/user.dart';

class CreateDrugstoreDialog extends ConsumerStatefulWidget {
  const CreateDrugstoreDialog({super.key});

  @override
  ConsumerState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends ConsumerState<CreateDrugstoreDialog> {
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
      title: const Text('Добавить аптеку'),
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
                decoration: const InputDecoration(labelText: 'Бренд'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите e-mail';
                  if (!value.contains('@')) return 'Введите корректный e-mail';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Регион'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите e-mail';
                  if (!value.contains('@')) return 'Введите корректный e-mail';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Город'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите e-mail';
                  if (!value.contains('@')) return 'Введите корректный e-mail';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Адрес'),
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
