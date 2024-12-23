import 'package:flutter/material.dart';
import 'package:flutter_linjuli_linggongli/app/router/juli_router.dart';
import 'package:go_router/go_router.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({super.key});

  @override
  State<AlbumListPage> createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  final List<String> albumList = [
    '1st Album',
    '2nd Album',
    '3rd Album',
    '4th Album'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          children: albumList
              .map(
                (item) => InkWell(
                  onTap: () {
                    context.go('/albumList/musicList');
                  },
                  child: Container(
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: Text(item),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
