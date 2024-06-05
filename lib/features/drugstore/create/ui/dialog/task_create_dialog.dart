import 'package:dashboard/entities/drugstore/model.dart';
import 'package:dashboard/entities/drugstore/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateDrugstoreDialog extends ConsumerStatefulWidget {
  const CreateDrugstoreDialog({super.key, this.drugstore});

  final DrugstoreModel? drugstore;

  @override
  ConsumerState createState() => _CreateUserDialogState();
}

class _CreateUserDialogState extends ConsumerState<CreateDrugstoreDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _brandController;
  late TextEditingController _regionController;
  late TextEditingController _cityController;
  late TextEditingController _addressController;
  late TextEditingController _descController;
  bool _isLoading = false;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      setState(() => _isLoading = true);

      if (widget.drugstore == null) {
        await ref.read(drugstoresProvider.notifier).create(DrugstoreModel(
              id: '0',
              address: _addressController.text.trim(),
              brand: _brandController.text.trim(),
              city: _cityController.text.trim(),
              description: _descController.text.trim(),
              name: _nameController.text.trim(),
              region: _regionController.text.trim(),
              createdAt: DateTime.now().millisecondsSinceEpoch,
            ));
      } else {
        await ref.read(drugstoresProvider.notifier).edit(DrugstoreModel(
            id: widget.drugstore!.id,
            address: _addressController.text.trim(),
            brand: _brandController.text.trim(),
            city: _cityController.text.trim(),
            description: _descController.text.trim(),
            name: _nameController.text.trim(),
            region: _regionController.text.trim(),
            createdAt: widget.drugstore!.createdAt));
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
    _brandController = TextEditingController(text: widget.drugstore?.brand);
    _regionController = TextEditingController(text: widget.drugstore?.region);
    _cityController = TextEditingController(text: widget.drugstore?.city);
    _addressController = TextEditingController(text: widget.drugstore?.address);
    _descController = TextEditingController(text: widget.drugstore?.description);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _brandController.dispose();
    _regionController.dispose();
    _cityController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.drugstore == null ? 'Добавить аптеку' : 'Изменить аптеку'),
      content: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 500, maxWidth: 500),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите название';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _brandController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите бренд';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Бренд'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _regionController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите регион';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Регион'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _cityController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите город';
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Город'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _addressController,
                validator: (value) {
                  if (value!.isEmpty) return 'Введите адрес';
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
