import 'package:dashboard/entities/user/ui/avatar/user_avatar.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 30),
            sliver: SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 310,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'СРОЧНО',
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 20),
                            const Icon(Icons.calendar_month),
                            const SizedBox(width: 5),
                            const Expanded(child: Text('26 мая 2024')),
                            MenuAnchor(
                              builder: (context, controller, child) {
                                return IconButton(
                                  onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                                  icon: const Icon(Icons.more_vert),
                                );
                              },
                              menuChildren: [
                                MenuItemButton(
                                  onPressed: () {},
                                  leadingIcon: const Icon(Icons.edit),
                                  child: const Text('Изменить'),
                                ),
                                MenuItemButton(
                                  onPressed: () {},
                                  leadingIcon: const Icon(Icons.delete),
                                  child: const Text('Удалить'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Продать как можно больше товара Продать как можно больше товара',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Продать как можно больше товара продать как можно больше товара продать как можно больше товара продать как можно больше товара продать как можно больше товараПродать как можно больше товара продать как можно больше товара продать как можно больше товара продать как можно больше товара продать как можно больше товара',
                          style: TextStyle(fontSize: 16),
                          maxLines: 4,
                        ),
                        const Expanded(child: SizedBox()),
                        const Divider(height: 25),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Новая',
                                style: TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Tooltip(
                              message: 'Кирилл Барабанщиков',
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: UserAvatar(displayName: 'Кирилл Барабанщиков'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Tooltip(
                              message: 'Девятых Матвей',
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: UserAvatar(displayName: 'Девятых Матвей'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Tooltip(
                              message: 'Девятых Матвей',
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: UserAvatar(displayName: 'Девятых Матвей'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Tooltip(
                              message: 'Девятых Матвей',
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: UserAvatar(displayName: 'Девятых Матвей'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Tooltip(
                              message: 'Девятых Матвей',
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: UserAvatar(displayName: 'Девятых Матвей'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: CircleAvatar(
                                backgroundColor: Colors.black.withOpacity(0.4),
                                child: const Text(
                                  '+9',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
