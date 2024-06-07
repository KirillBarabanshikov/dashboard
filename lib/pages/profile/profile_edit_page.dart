import 'package:dashboard/shared/services/hive_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  late TextEditingController _phoneController;
  late TextEditingController _positionController;
  Uint8List? currentFile;
  String? fileName;
  String? _character;
  SessionUser? sessionUser;
  bool _isLoading = false;
  String? photoUrl;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      setState(() => _isLoading = true);
      String? url = photoUrl;
      if (currentFile != null) {
        final name = DateTime.now().millisecondsSinceEpoch;

        await FirebaseStorage.instance.ref('uploads/$name$fileName').putData(currentFile!);

        url = await FirebaseStorage.instance.ref().child('uploads/$name$fileName').getDownloadURL();
      }

      await ref.read(sessionProvider).edit(SessionUser(
            uid: sessionUser!.uid,
            email: _emailController.text.trim(),
            role: sessionUser!.role,
            displayName: _nameController.text.trim(),
            photoUrl: url,
            dateBirth: _dateController.text.trim(),
            phone: _phoneController.text.trim(),
            gender: _character,
            position: _positionController.text.trim(),
            createdAt: sessionUser?.createdAt,
            isBlocked: sessionUser!.isBlocked,
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
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

      currentFile = result?.files.first.bytes;
      fileName = result?.files.first.name;

      setState(() {});

      // String? fileName = result?.files.first.name;

      // FilePickerResult? result = await FilePicker.platform.pickFiles(
      //   type: FileType.custom,
      //   allowedExtensions: ['jpg', 'jpeg', 'png', 'webp'],
      // );
      // Uint8List? bytes;
      //
      // if (result != null) {
      //   final file = result.files.single;
      //
      //   if (file.extension == null || !['jpg', 'jpeg', 'png', 'webp'].contains(file.extension)) {
      //     // _showToast();
      //     print('error file pick');
      //     return;
      //   }
      //
      //   // setState(() {
      //   //   _filename = truncate(file.name);
      //   // });
      //
      //   if (kIsWeb) {
      //     bytes = file.bytes;
      //   } else {
      //     String? filePath = file.path;
      //     if (filePath != null) {
      //       bytes = await File(filePath).readAsBytes();
      //     }
      //   }
      //
      //   if (bytes != null) {
      //     final fileResult = FileResult(
      //       result: result,
      //       bytes: bytes,
      //       filename: file.name,
      //     );
      //     currentFile = fileResult;
      //     // widget.onChange(fileResult);
      //   }
      // }
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    sessionUser = HiveService.getSessionUser();
    _emailController = TextEditingController(text: sessionUser?.email);
    _nameController = TextEditingController(text: sessionUser?.displayName);
    _dateController = TextEditingController(text: sessionUser?.dateBirth);
    _phoneController = TextEditingController(text: sessionUser?.phone);
    _positionController = TextEditingController(text: sessionUser?.position);
    _character = sessionUser?.gender;
    photoUrl = sessionUser?.photoUrl;
  }

  void deleteFile() {
    setState(() {
      currentFile = null;
      photoUrl = null;
    });
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
      body: Form(
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
                                  child: currentFile != null
                                      ? Image.memory(
                                          currentFile!,
                                          fit: BoxFit.cover,
                                        )
                                      : photoUrl != null
                                          ? Image.network(
                                              photoUrl!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.asset(
                                              'images/profile.png',
                                              fit: BoxFit.cover,
                                            ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: deleteFile,
                              style: TextButton.styleFrom(foregroundColor: Colors.red),
                              child: const Text('Удалить фото'),
                            ),
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
                                if (value!.isEmpty) return 'Введите ФИО';
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
                                    groupValue: _character,
                                    onChanged: (value) {
                                      setState(() {
                                        _character = value;
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
                                    groupValue: _character,
                                    onChanged: (value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextFormField(controller: _dateController, decoration: const InputDecoration(labelText: 'Дата рождения')),
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
                    if (value!.isEmpty) return 'Введите ФИО';
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: TextFormField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Номер телефона')),
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
