import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            sliver: SliverToBoxAdapter(
              child: TextField(
                decoration: InputDecoration(labelText: 'Поиск'),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                leading: const CircleAvatar(
                  child: Text('КБ'),
                ),
                title: const Text('Барабанщиков К.Д.'),
                subtitle: const Text('Начало последнего сообщения из скоторого взято сообщение', overflow: TextOverflow.ellipsis),
                trailing: const Column(
                  children: [
                    Text('9:15'),
                    SizedBox(height: 5),
                    Badge(label: Text('156')),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
