import 'dart:io';

import 'package:dashboard/shared/services/hive_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../entities/session/model/model.dart';
import '../../entities/session/provider/session_provider.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _dateController;
  late TextEditingController _emailController;
  late MaskedTextController _phoneController;
  late TextEditingController _positionController;
  Uint8List? _currentFile;
  String? _fileName;
  String? _gender;
  SessionUser? _sessionUser;
  String? _photoUrl;
  bool _isLoading = false;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _sessionUser = HiveService.getSessionUser();
    _emailController = TextEditingController(text: _sessionUser?.email);
    _nameController = TextEditingController(text: _sessionUser?.displayName);
    _dateController = TextEditingController(text: _sessionUser?.dateBirth);
    _phoneController = MaskedTextController(mask: '+7 (000) 000 00-00', text: _sessionUser?.phone);
    _positionController = TextEditingController(text: _sessionUser?.position);
    _gender = _sessionUser?.gender;
    _photoUrl = _sessionUser?.photoUrl;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _dateController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      setState(() => _isLoading = true);
      String? url = _photoUrl;
      if (_currentFile != null) {
        final name = DateTime.now().millisecondsSinceEpoch;

        await FirebaseStorage.instance.ref('uploads/$name$_fileName').putData(_currentFile!);

        url = await FirebaseStorage.instance.ref().child('uploads/$name$_fileName').getDownloadURL();
      }

      await ref.read(sessionProvider).edit(SessionUser(
            uid: _sessionUser!.uid,
            email: _emailController.text.trim(),
            role: _sessionUser!.role,
            displayName: _nameController.text.trim(),
            photoUrl: url,
            dateBirth: _dateController.text.trim(),
            phone: _phoneController.text.trim(),
            gender: _gender,
            position: _positionController.text.trim(),
            createdAt: _sessionUser?.createdAt,
            isBlocked: _sessionUser!.isBlocked,
          ));
      if (mounted) context.go('/profile');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade500,
          content: const Text(
            'Ошибка обновления профиля',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _openFileExplorer() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
      );

      if (result?.files.first.extension == null || !['jpg', 'jpeg', 'png', 'webp'].contains(result?.files.first.extension)) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade500,
            content: const Text(
              'Выбран не поддерживаемый формат',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        );
        return;
      }

      if (kIsWeb) {
        _currentFile = result?.files.first.bytes;
      } else {
        String? filePath = result?.files.first.path;
        if (filePath != null) {
          _currentFile = await File(filePath).readAsBytes();
        }
      }
      _fileName = result?.files.first.name;
      setState(() {});
    } catch (e) {
      print('$e');
    }
  }

  void deleteFile() {
    setState(() {
      _currentFile = null;
      _photoUrl = null;
    });
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd.MM.yyyy').format(pickedDate);
      });
    }
  }

  bool _isValidPhoneNumber(String value) {
    final RegExp regex = RegExp(r'^\+7 \(\d{3}\) \d{3} \d{2}-\d{2}$');
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/profile'),
          tooltip: 'Назад',
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Редактирование профиля'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1100) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 50, right: 50, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 0,
                            child: SizedBox(
                              child: Column(
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: _openFileExplorer,
                                      child: SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: _currentFile != null
                                            ? Image.memory(
                                                _currentFile!,
                                                fit: BoxFit.cover,
                                              )
                                            : _photoUrl != null
                                                ? Image.network(
                                                    _photoUrl!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    kIsWeb ? 'images/profile.png' : 'assets/images/profile.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _photoUrl != null || _currentFile != null
                                      ? TextButton(
                                          onPressed: deleteFile,
                                          style: TextButton.styleFrom(foregroundColor: Colors.red),
                                          child: const Text('Удалить фото'),
                                        )
                                      : const SizedBox(height: 32),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(labelText: 'ФИО'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Введите ФИО';
                                      }
                                      String pattern = r"^[a-zA-Zа-яА-ЯёЁ\s]+$";
                                      RegExp regex = RegExp(pattern);
                                      if (!regex.hasMatch(value)) {
                                        return 'ФИО должно содержать только буквы и пробелы';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  const Text('Пол:'),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: RadioListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: const Text('Мужской'),
                                          value: 'Мужской',
                                          groupValue: _gender,
                                          onChanged: (value) {
                                            setState(() {
                                              _gender = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: RadioListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: const Text('Женский'),
                                          value: 'Женский',
                                          groupValue: _gender,
                                          onChanged: (value) {
                                            setState(() {
                                              _gender = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: _dateController,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Дата рождения',
                                      suffixIcon: Icon(Icons.calendar_today),
                                    ),
                                    onTap: _pickDate,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'E-mail'),
                        validator: (value) {
                          if (value!.isEmpty) return 'Введите e-mail';
                          if (!value.contains('@')) return 'Введите корректный e-mail';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Номер телефона',
                          hintText: '+7 (999) 999 99-99',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return null;
                          } else if (!_isValidPhoneNumber(value)) {
                            return 'Введите корректный номер телефона';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1000),
                      child: TextFormField(controller: _positionController, decoration: const InputDecoration(labelText: 'Место проживания')),
                    ),
                    const SizedBox(height: 20),
                    const Expanded(child: SizedBox()),
                    FilledButton(
                      onPressed: _onSubmit,
                      style: FilledButton.styleFrom(minimumSize: const Size(100, 50)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(color: Colors.white),
                                )
                              : const Text('Сохранить изменения')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _openFileExplorer,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: _currentFile != null
                            ? Image.memory(
                                _currentFile!,
                                fit: BoxFit.cover,
                              )
                            : _photoUrl != null
                                ? Image.network(
                                    _photoUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    kIsWeb ? 'images/profile.png' : 'assets/images/profile.png',
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _photoUrl != null || _currentFile != null
                        ? TextButton(
                            onPressed: deleteFile,
                            style: TextButton.styleFrom(foregroundColor: Colors.red),
                            child: const Text('Удалить фото'),
                          )
                        : const SizedBox(height: 32),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'ФИО'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите ФИО';
                        }
                        String pattern = r"^[a-zA-Zа-яА-ЯёЁ\s]+$";
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'ФИО должно содержать только буквы и пробелы';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Дата рождения',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: _pickDate,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: (value) {
                        if (value!.isEmpty) return 'Введите e-mail';
                        if (!value.contains('@')) return 'Введите корректный e-mail';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Номер телефона',
                        hintText: '+7 (999) 999 99-99',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return null;
                        } else if (!_isValidPhoneNumber(value)) {
                          return 'Введите корректный номер телефона';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _positionController,
                      decoration: const InputDecoration(labelText: 'Место проживания'),
                    ),
                    const SizedBox(height: 20),
                    const Text('Пол:'),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Мужской'),
                            value: 'Мужской',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Женский'),
                            value: 'Женский',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: _onSubmit,
                      style: FilledButton.styleFrom(minimumSize: const Size(100, 50)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(color: Colors.white),
                                )
                              : const Text('Сохранить изменения')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FileResult {
  const FileResult({
    required this.result,
    required this.bytes,
    required this.filename,
  });

  final FilePickerResult result;
  final Uint8List bytes;
  final String filename;
}
