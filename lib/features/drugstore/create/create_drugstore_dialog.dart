import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../entities/drugstore/drugstore.dart';

class CreateDrugstoreDialog extends ConsumerStatefulWidget {
  const CreateDrugstoreDialog({
    super.key,
    this.drugstore,
  });

  final DrugstoreModel? drugstore;

  @override
  ConsumerState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends ConsumerState<CreateDrugstoreDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _regionController;
  late TextEditingController _cityController;
  late TextEditingController _addressController;
  late TextEditingController _descController;
  String? _brand;
  bool _isLoading = false;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);

      if (widget.drugstore == null) {
        await ref.read(drugstoresProvider.notifier).create(DrugstoreModel(
              id: '0',
              address: _addressController.text.trim(),
              brand: _brand!,
              city: _cityController.text.trim(),
              description: _descController.text.trim(),
              name: _nameController.text.trim(),
              region: _regionController.text.trim(),
            ));
      } else {
        await ref.read(drugstoresProvider.notifier).edit(
              DrugstoreModel(
                id: widget.drugstore!.id,
                address: _addressController.text.trim(),
                brand: _brand!,
                city: _cityController.text.trim(),
                description: _descController.text.trim(),
                name: _nameController.text.trim(),
                region: _regionController.text.trim(),
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
    _nameController = TextEditingController(text: widget.drugstore?.name);
    _regionController = TextEditingController(text: widget.drugstore?.region);
    _cityController = TextEditingController(text: widget.drugstore?.city);
    _addressController = TextEditingController(text: widget.drugstore?.address);
    _descController = TextEditingController(text: widget.drugstore?.description);
    _brand = widget.drugstore?.brand;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _regionController.dispose();
    _cityController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(20),
      title: Text(widget.drugstore == null ? 'Добавить аптеку' : 'Изменить аптеку'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 500,
          minWidth: 500,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Введите название';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField(
                onChanged: (value) => _brand = value,
                value: _brand,
                items: const [
                  DropdownMenuItem(value: 'Аптека «Фармаимпекс»', child: Text('Аптека «Фармаимпекс»')),
                  DropdownMenuItem(value: 'Аптека от склада', child: Text('Аптека от склада')),
                  DropdownMenuItem(value: 'Аптека по пути', child: Text('Аптека по пути')),
                  DropdownMenuItem(value: 'Аптека Экона', child: Text('Аптека Экона')),
                  DropdownMenuItem(value: 'Бережная аптека', child: Text('Бережная аптека')),
                  DropdownMenuItem(value: 'Клюква', child: Text('Клюква')),
                  DropdownMenuItem(value: 'Социалочка', child: Text('Социалочка')),
                  DropdownMenuItem(value: 'Фармакон', child: Text('Фармакон')),
                ],
                validator: (value) {
                  if (value == null) return 'Выберите бренд';
                  return null;
                },
                dropdownColor: Colors.white,
                decoration: const InputDecoration(labelText: 'Бренд'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _regionController,
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Введите регион';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Регион'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _cityController,
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Введите город';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Город'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _addressController,
                validator: (value) {
                  if (value!.trim().isEmpty) return 'Введите адрес';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Адрес'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Описание'),
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
