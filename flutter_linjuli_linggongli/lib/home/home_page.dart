import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linjuli_linggongli/app/router/juli_router.dart';
import 'package:flutter_linjuli_linggongli/musics/album_list_page.dart';
import 'package:flutter_linjuli_linggongli/singer/introduce_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<Widget> pages = [
    const IntroducePage(),
    AlbumListPage(),
  ];

  @override
  void initState() {
    super.initState();
    log("@!!--->> ref.read(tabIndexProvider): ${ref.read(tabIndexProvider)}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      log("@!!--->> ref.read(tabIndexProvider): ${ref.read(tabIndexProvider)}");
      if (ref.read(tabIndexProvider) == 0) {
        _showBottomSheet();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      body: pages[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '주인장',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: '음악',
          ),
        ],
        currentIndex: tabIndex,
        onTap: (index) {
          FirebaseAnalytics.instance.logEvent(
            name: 'TAB_CLICK',
            parameters: {'tabIndex': index},
          );
          ref.read(tabIndexProvider.notifier).state = index; // 수정된 부분

          if (index == 0) {
            _showBottomSheet();
          }
        },
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Bottom Sheet 내용'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAnalytics.instance.logEvent(
                      name: 'singer_bottom_sheet_confirm',
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text('내용 확인'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAnalytics.instance.logEvent(
                      name: 'singer_bottom_sheet_close',
                    );
                    Navigator.of(context).pop();
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
